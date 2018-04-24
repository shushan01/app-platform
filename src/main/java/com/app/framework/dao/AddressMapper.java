package com.app.framework.dao;

import com.app.framework.core.utils.BaseDao;
import com.app.framework.model.Address;

public interface AddressMapper extends BaseDao {
    int deleteByPrimaryKey(Long id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}