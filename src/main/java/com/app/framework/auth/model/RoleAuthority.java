package com.app.framework.auth.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by yangyijun on 2018/4/14.
 */
@Entity
@Table(name = "tb_role_authority")
public class RoleAuthority extends BaseEntity {

    /**
     */
    private static final long serialVersionUID = 1L;

    private Long roleId;

    private Long authorityId;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Long authorityId) {
        this.authorityId = authorityId;
    }
}
