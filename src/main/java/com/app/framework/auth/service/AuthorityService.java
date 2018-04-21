package com.app.framework.auth.service;

import com.app.framework.auth.dao.AuthorityDao;
import com.app.framework.auth.model.Authority;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
public class AuthorityService extends BaseService<Authority> {
    private AuthorityDao authorityDao;

    @Autowired
    public AuthorityService(AuthorityDao authorityDao) {
        super(authorityDao);
        this.authorityDao = authorityDao;
    }
}
