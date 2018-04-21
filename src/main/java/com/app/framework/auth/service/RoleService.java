package com.app.framework.auth.service;

import com.app.framework.auth.model.Role;
import com.app.framework.auth.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
public class RoleService extends BaseService<Role> {

    private RoleDao roleDao;

    @Autowired
    public RoleService(RoleDao roleDao) {
        super(roleDao);
        this.roleDao = roleDao;
    }
}
