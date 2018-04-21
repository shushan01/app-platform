package com.app.framework.auth.dao;

import com.app.framework.auth.model.Authority;
import com.app.framework.core.utils.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by yangyijun on 2018/4/14.
 */
@Transactional
public interface AuthorityDao extends BaseDao<Authority> {

    @Select("select a.* from tb_user_role ur " +
            "inner join tb_role_authority ra on ur.role_id = ra.role_id " +
            "inner join tb_authority a on a.id = ra.autority_id " +
            "where ur.user_id = #{userId} ")
    List<Authority> findByUserId(@Param("userId") Long userId);


    @Select("select a.* from tb_role_authority ra " +
            "inner join tb_authority a on a.id = ra.autority_id " +
            "where ra.role_id = #{roleId} ")
    List<Authority> findByRoleId(@Param("roleId") Long roleId);
}
