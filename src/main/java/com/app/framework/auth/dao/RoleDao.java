package com.app.framework.auth.dao;

import com.app.framework.auth.model.Role;
import com.app.framework.core.utils.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
public interface RoleDao extends BaseDao<Role> {


    @Select("select r.* from tb_login_user u " +
            "inner join tb_user_role ur on u.id = ur.user_id " +
            "inner join tb_role r on ur.role_id = r.id " +
            "where u.user_name = #{userName}")
    List<Role> findRoleByUserName(@Param("userName") String userName);

    @Select("select r.* from tb_role r " +
            "inner join tb_user_role ur on ur.role_id = r.id " +
            "where ur.user_id = #{userId} ")
    List<Role> findRoleByUserId(@Param("userId") Long userId);


}
