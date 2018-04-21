package com.app.framework.auth.service;

import com.app.framework.auth.dao.UserRoleDao;
import com.app.framework.auth.model.UserRole;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
public class UserRoleService extends BaseService<UserRole> {
    private UserRoleDao userRoleDao;

    @Autowired
    public UserRoleService(UserRoleDao userRoleDao) {
        super(userRoleDao);
        this.userRoleDao = userRoleDao;
    }
}
