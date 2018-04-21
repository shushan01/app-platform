package com.app.framework.auth.dao;

import com.app.framework.auth.model.UserRole;
import com.app.framework.core.utils.BaseDao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface UserRoleDao extends BaseDao<UserRole> {


    @Select("delete from tb_user_role where user_id=#{userId}")
    void delByTUserId(@Param("userId") Long userId);
}
