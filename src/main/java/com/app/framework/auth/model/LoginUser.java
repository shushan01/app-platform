package com.app.framework.auth.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by yangyijun on 2018/4/13.
 */
@Entity
@Table(name = "tb_login_user")
public class LoginUser extends User {
    /**
     */
    private static final long serialVersionUID = 1L;

    @Column(name = "last_login", length = 64)
    private Long lastLogin;

    public Long getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Long lastLogin) {
        this.lastLogin = lastLogin;
    }
}
