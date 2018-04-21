package com.app.framework.auth.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.app.framework.core.utils.BaseDao;
import com.app.framework.core.utils.PageResult;

import java.util.List;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
public class BaseService<T> {
    private BaseDao<T> baseDao;

    public BaseService(BaseDao<T> baseDao) {
        this.baseDao = baseDao;
    }

    public int deleteById(Object o) {
        return baseDao.deleteByPrimaryKey(o);
    }

    public int delete(T t) {
        return baseDao.delete(t);
    }

    public int save(T t) {
        return baseDao.insert(t);
    }

    public int saveBatch(List<T> list) {
        return baseDao.insertList(list);
    }

    public int updateById(T t) {
        return baseDao.updateByPrimaryKey(t);
    }

    public boolean exists(Object o) {
        return baseDao.existsWithPrimaryKey(o);
    }

    public List<T> findAll() {
        return baseDao.selectAll();
    }

    public PageResult<T> findAll(int pageNo, int pageSize) {
        Page<T> page = PageHelper.startPage(pageNo, pageSize);
        List<T> list = baseDao.selectAll();
        return new PageResult<T>(pageNo, pageSize, page.getTotal(), list);
    }

    public T findById(Object o) {
        return baseDao.selectByPrimaryKey(o);
    }
}
