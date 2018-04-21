package com.app.framework.auth.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * user's group
 */
@Entity
@Table(name = "tb_user_role")
public class UserRole extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;

    private Long userId;

    private Long roleId;

    public UserRole(Long userId, Long roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

}
