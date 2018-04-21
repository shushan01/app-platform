CREATE TABLE `tb_login_user` (
  `last_login` bigint(20) DEFAULT NULL COMMENT '最后登录时间',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_role` (
  `utime` bigint(20) NOT NULL COMMENT '修改时间',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `modifier` bigint(20) NOT NULL COMMENT '修改人',
  `creator` bigint(20) NOT NULL COMMENT '创建人',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_authority` (
  `utime` bigint(20) NOT NULL COMMENT '修改时间',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `modifier` bigint(20) NOT NULL COMMENT '修改人',
  `creator` bigint(20) NOT NULL COMMENT '创建人',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_role_authority` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `authority_id` bigint(20) NOT NULL COMMENT '权限id',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

