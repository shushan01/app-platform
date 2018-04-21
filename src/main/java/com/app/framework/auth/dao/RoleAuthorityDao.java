package com.app.framework.auth.dao;

import com.app.framework.core.utils.BaseDao;
import com.app.framework.auth.model.RoleAuthority;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by yangyijun on 2018/4/14.
 */
@Transactional
public interface RoleAuthorityDao extends BaseDao<RoleAuthority> {
    @Select("delete from tb_role_authority where role_id=#{roleId}")
    void delByRoleId(@Param("roleId") Long roleId);
}
