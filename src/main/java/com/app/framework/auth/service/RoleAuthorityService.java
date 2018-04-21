package com.app.framework.auth.service;

import com.app.framework.auth.dao.RoleAuthorityDao;
import com.app.framework.auth.model.RoleAuthority;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
public class RoleAuthorityService extends BaseService<RoleAuthority> {
    private RoleAuthorityDao roleAuthorityDao;

    @Autowired
    public RoleAuthorityService(RoleAuthorityDao roleAuthorityDao) {
        super(roleAuthorityDao);
        this.roleAuthorityDao = roleAuthorityDao;
    }
}
