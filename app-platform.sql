/*
Navicat MySQL Data Transfer

Source Server         : app-weixin
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : app_weixin

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-04-21 14:27:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `area_info` varchar(255) DEFAULT NULL COMMENT '地址信息',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `trueName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `zip` varchar(255) DEFAULT NULL COMMENT '邮编',
  `area_id` bigint(20) DEFAULT NULL COMMENT '地区',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_album
-- ----------------------------
DROP TABLE IF EXISTS `t_album`;
CREATE TABLE `t_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `alblum_info` longtext COMMENT '信息',
  `album_default` bit(1) DEFAULT NULL COMMENT '默认相册',
  `album_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `album_sequence` int(11) DEFAULT NULL COMMENT '序号',
  `album_cover_id` bigint(20) DEFAULT NULL COMMENT '相册',
  `user_id` bigint(20) DEFAULT NULL COMMENT '所属人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `areaName` varchar(255) DEFAULT NULL COMMENT '地区名称',
  `level` int(11) DEFAULT NULL COMMENT '地区层级',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '地区父类',
  `common` bit(1) DEFAULT NULL COMMENT '是否常用地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `content` longtext COMMENT '内容',
  `display` bit(1) DEFAULT NULL COMMENT '显示',
  `mark` varchar(255) DEFAULT NULL COMMENT '标记',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `articleClass_id` bigint(20) DEFAULT NULL COMMENT '文章分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_articleclass
-- ----------------------------
DROP TABLE IF EXISTS `t_articleclass`;
CREATE TABLE `t_articleclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `className` varchar(255) DEFAULT NULL COMMENT '类名称',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `mark` varchar(255) DEFAULT NULL COMMENT '标记',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `sysClass` bit(1) DEFAULT NULL COMMENT '是否系统文章',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_bargain
-- ----------------------------
DROP TABLE IF EXISTS `t_bargain`;
CREATE TABLE `t_bargain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `bargain_time` date DEFAULT NULL COMMENT '特价时间',
  `maximum` int(11) DEFAULT NULL COMMENT '最大值',
  `rebate` decimal(3,2) DEFAULT NULL COMMENT '折扣',
  `state` longtext COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_bargain_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_bargain_goods`;
CREATE TABLE `t_bargain_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `bg_price` decimal(12,2) DEFAULT NULL COMMENT '特价价格',
  `bg_status` int(11) DEFAULT NULL COMMENT '状态',
  `bg_time` date DEFAULT NULL COMMENT '特价时间',
  `bg_admin_user_id` bigint(20) DEFAULT NULL COMMENT '管理员',
  `bg_goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `bg_count` int(11) DEFAULT NULL COMMENT '数量',
  `bg_rebate` decimal(3,1) DEFAULT NULL COMMENT '折扣',
  `audit_time` datetime DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_brandcategory
-- ----------------------------
DROP TABLE IF EXISTS `t_brandcategory`;
CREATE TABLE `t_brandcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cart_gsp
-- ----------------------------
DROP TABLE IF EXISTS `t_cart_gsp`;
CREATE TABLE `t_cart_gsp` (
  `cart_id` bigint(20) DEFAULT NULL COMMENT '购物车',
  `gsp_id` bigint(20) DEFAULT NULL COMMENT '商品规格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `evaluate_admin_info` longtext COMMENT '评价',
  `evaluate_buyer_val` int(11) DEFAULT NULL COMMENT '买家',
  `evaluate_info` longtext COMMENT '评价信息',
  `evaluate_seller_info` longtext COMMENT '卖家学习',
  `evaluate_seller_time` datetime DEFAULT NULL COMMENT '评价时间',
  `evaluate_seller_val` int(11) DEFAULT NULL COMMENT '卖家评价',
  `evaluate_status` int(11) DEFAULT NULL COMMENT '状态',
  `evaluate_type` varchar(255) DEFAULT NULL COMMENT '类型',
  `goods_spec` longtext COMMENT '商品规格',
  `evaluate_goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `evaluate_seller_user_id` bigint(20) DEFAULT NULL COMMENT '卖家评价',
  `evaluate_user_id` bigint(20) DEFAULT NULL COMMENT '评价用户',
  `of_id` bigint(20) DEFAULT NULL COMMENT '订单',
  `description_evaluate` decimal(12,2) DEFAULT NULL COMMENT '评价描述',
  `service_evaluate` decimal(12,2) DEFAULT NULL COMMENT '评价服务',
  `ship_evaluate` decimal(12,2) DEFAULT NULL COMMENT '评价物流',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_favorite
-- ----------------------------
DROP TABLE IF EXISTS `t_favorite`;
CREATE TABLE `t_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_gold_log
-- ----------------------------
DROP TABLE IF EXISTS `t_gold_log`;
CREATE TABLE `t_gold_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `gl_admin_content` longtext COMMENT '内容',
  `gl_admin_time` datetime DEFAULT NULL COMMENT '时间',
  `gl_content` longtext COMMENT '内容',
  `gl_count` int(11) DEFAULT NULL COMMENT '数量',
  `gl_money` int(11) DEFAULT NULL COMMENT '金额',
  `gl_payment` varchar(255) DEFAULT NULL COMMENT '支付',
  `gl_type` int(11) DEFAULT NULL COMMENT '类型',
  `gl_admin_id` bigint(20) DEFAULT NULL COMMENT '管理员',
  `gl_user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `gr_id` bigint(20) DEFAULT NULL COMMENT '金币记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_gold_record
-- ----------------------------
DROP TABLE IF EXISTS `t_gold_record`;
CREATE TABLE `t_gold_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `gold_admin_info` longtext COMMENT '金币管理信息',
  `gold_admin_time` datetime DEFAULT NULL COMMENT '金币管理时间',
  `gold_count` int(11) DEFAULT NULL COMMENT '金币数量',
  `gold_exchange_info` longtext COMMENT '兑换信息',
  `gold_money` int(11) DEFAULT NULL COMMENT '金币金额',
  `gold_pay_status` int(11) DEFAULT NULL COMMENT '金币支付状态',
  `gold_payment` varchar(255) DEFAULT NULL COMMENT '金币支付状态',
  `gold_sn` varchar(255) DEFAULT NULL COMMENT '金币序号',
  `gold_status` int(11) DEFAULT NULL COMMENT '金币状态',
  `gold_admin_id` bigint(20) DEFAULT NULL COMMENT '金币管理者',
  `gold_user_id` bigint(20) DEFAULT NULL COMMENT '金币用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `goods_click` int(11) DEFAULT NULL COMMENT '点击量',
  `goods_details` longtext COMMENT '细节',
  `goods_fee` varchar(255) DEFAULT NULL COMMENT '小费',
  `goods_inventory` int(11) DEFAULT NULL COMMENT '库存',
  `goods_inventory_detail` longtext COMMENT '库存明细',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `goods_price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `goods_property` longtext COMMENT '商品属性',
  `goods_recommend` bit(1) DEFAULT NULL COMMENT '是否为推荐商品',
  `goods_salenum` int(11) DEFAULT NULL COMMENT '销售数量',
  `goods_seller_time` datetime DEFAULT NULL COMMENT '销售时间',
  `goods_serial` varchar(255) DEFAULT NULL COMMENT '商品序号',
  `goods_status` int(11) DEFAULT NULL COMMENT '状态',
  `goods_transfee` int(11) DEFAULT NULL COMMENT '运费',
  `goods_weight` decimal(12,2) DEFAULT NULL COMMENT '重量',
  `inventory_type` varchar(255) DEFAULT NULL COMMENT '库存类型',
  `seo_description` longtext COMMENT 'seo描述',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT 'seo关键词',
  `store_price` decimal(12,2) DEFAULT NULL COMMENT '店铺价格',
  `store_recommend` bit(1) DEFAULT NULL COMMENT '是否为店铺内推荐商品',
  `store_recommend_time` datetime DEFAULT NULL COMMENT '店铺内推荐时间',
  `ztc_admin_content` longtext COMMENT '直通车管理内容',
  `ztc_apply_time` datetime DEFAULT NULL COMMENT '直通车申请时间',
  `ztc_begin_time` date DEFAULT NULL COMMENT '直通车开始时间',
  `ztc_click_num` int(11) DEFAULT NULL COMMENT '直通车点击次数',
  `ztc_dredge_price` int(11) DEFAULT NULL COMMENT '直通车价格',
  `ztc_gold` int(11) DEFAULT NULL COMMENT '直通车金币',
  `ztc_pay_status` int(11) DEFAULT NULL COMMENT '直通车支付状态',
  `ztc_price` int(11) DEFAULT NULL COMMENT '直通车价格',
  `ztc_status` int(11) DEFAULT NULL COMMENT '直通车状态',
  `gc_id` bigint(20) DEFAULT NULL COMMENT '商品分类',
  `goods_brand_id` bigint(20) DEFAULT NULL COMMENT '品牌',
  `goods_main_photo_id` bigint(20) DEFAULT NULL COMMENT '主图',
  `goods_store_id` bigint(20) DEFAULT NULL COMMENT '店铺',
  `ztc_admin_id` bigint(20) DEFAULT NULL COMMENT '直通车管理员',
  `goods_collect` int(11) DEFAULT NULL COMMENT '收藏量',
  `group_buy` int(11) DEFAULT NULL COMMENT '团购商品',
  `goods_choice_type` int(11) DEFAULT NULL COMMENT '选择类型',
  `group_id` bigint(20) DEFAULT NULL COMMENT '团购',
  `activity_status` int(11) DEFAULT NULL COMMENT '活动状态',
  `bargain_status` int(11) DEFAULT NULL COMMENT '特价状态',
  `delivery_status` int(11) DEFAULT NULL COMMENT '买就送状态',
  `goods_current_price` decimal(12,2) DEFAULT NULL COMMENT '现价',
  `goods_volume` decimal(12,2) DEFAULT NULL COMMENT '量',
  `ems_trans_fee` decimal(12,2) DEFAULT NULL COMMENT 'EMS运费',
  `express_trans_fee` decimal(12,2) DEFAULT NULL COMMENT '快递运费',
  `mail_trans_fee` decimal(12,2) DEFAULT NULL COMMENT '平邮运费',
  `transport_id` bigint(20) DEFAULT NULL COMMENT '运费模板',
  `combin_status` int(11) DEFAULT NULL COMMENT '组合状态',
  `combin_begin_time` date DEFAULT NULL COMMENT '组合开始时间',
  `combin_end_time` date DEFAULT NULL COMMENT '组合结束时间',
  `combin_price` decimal(12,2) DEFAULT NULL COMMENT '组合商品价格',
  `description_evaluate` decimal(10,0) DEFAULT NULL COMMENT '描述评价',
  `weixin_shop_hot` bit(1) DEFAULT NULL COMMENT '微商城热卖',
  `weixin_shop_hotTime` date DEFAULT NULL COMMENT '微商城热卖时间',
  `weixin_shop_recommend` bit(1) DEFAULT NULL COMMENT '微商城推荐',
  `weixin_shop_recommendTime` date DEFAULT NULL COMMENT '微商城推荐时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goods_combin
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_combin`;
CREATE TABLE `t_goods_combin` (
  `t_goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `combin_goods_id` bigint(20) DEFAULT NULL COMMENT '组合商品'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goods_photo
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_photo`;
CREATE TABLE `t_goods_photo` (
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `photo_id` bigint(20) DEFAULT NULL COMMENT '图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_spec`;
CREATE TABLE `t_goods_spec` (
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `spec_id` bigint(20) DEFAULT NULL COMMENT '规格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goods_ugc
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_ugc`;
CREATE TABLE `t_goods_ugc` (
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `class_id` bigint(20) DEFAULT NULL COMMENT '商品分类'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodsbrand
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsbrand`;
CREATE TABLE `t_goodsbrand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `audit` bit(1) DEFAULT NULL COMMENT '审计',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `recommend` bit(1) DEFAULT NULL COMMENT '推荐',
  `sequence` int(11) DEFAULT NULL COMMENT '序列',
  `brandLogo_id` bigint(20) DEFAULT NULL COMMENT '品牌logo',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类',
  `remark` longtext COMMENT '评论',
  `userStatus` int(11) DEFAULT NULL COMMENT '使用者身份',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `weixin_shop_recommend` bit(1) DEFAULT NULL COMMENT '微商城推荐',
  `weixin_shop_recommendTime` date DEFAULT NULL COMMENT '微商城推荐时间',
  `first_word` varchar(255) DEFAULT NULL COMMENT '首字母',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodscart
-- ----------------------------
DROP TABLE IF EXISTS `t_goodscart`;
CREATE TABLE `t_goodscart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `spec_info` longtext COMMENT '商品规格',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品',
  `of_id` bigint(20) DEFAULT NULL COMMENT '订单',
  `cart_type` varchar(255) DEFAULT NULL COMMENT '购物车类型',
  `sc_id` bigint(20) DEFAULT NULL COMMENT '店铺购物车',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodsclass
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsclass`;
CREATE TABLE `t_goodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `className` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `display` bit(1) DEFAULT NULL COMMENT '是否显示',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `recommend` bit(1) DEFAULT NULL COMMENT '是否推荐',
  `sequence` int(11) DEFAULT NULL COMMENT '序列',
  `goodsType_id` bigint(20) DEFAULT NULL COMMENT '商品类型',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级分类',
  `seo_description` longtext COMMENT 'seo描述',
  `seo_keywords` longtext COMMENT 'seo关键词',
  `icon_sys` varchar(255) DEFAULT NULL COMMENT '图标系统',
  `icon_type` int(11) DEFAULT NULL COMMENT '图标类型',
  `icon_acc_id` bigint(20) DEFAULT NULL COMMENT '图标附件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodsclassstaple
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsclassstaple`;
CREATE TABLE `t_goodsclassstaple` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `gc_id` bigint(20) DEFAULT NULL COMMENT '商品类型',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodsspecification
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsspecification`;
CREATE TABLE `t_goodsspecification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodsspecproperty
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsspecproperty`;
CREATE TABLE `t_goodsspecproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `spec_id` bigint(20) DEFAULT NULL COMMENT '规格',
  `specImage_id` bigint(20) DEFAULT NULL COMMENT '规格图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodstype_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype_brand`;
CREATE TABLE `t_goodstype_brand` (
  `type_id` bigint(20) DEFAULT NULL COMMENT '商品类型',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodstype_spec
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype_spec`;
CREATE TABLE `t_goodstype_spec` (
  `type_id` bigint(20) DEFAULT NULL COMMENT '商品类型',
  `spec_id` bigint(20) DEFAULT NULL COMMENT '规格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_goodstypeproperty
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstypeproperty`;
CREATE TABLE `t_goodstypeproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `display` bit(1) DEFAULT NULL COMMENT '是否显示',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `goodsType_id` bigint(20) DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_orderform
-- ----------------------------
DROP TABLE IF EXISTS `t_orderform`;
CREATE TABLE `t_orderform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `finishTime` datetime DEFAULT NULL COMMENT '完成时间',
  `goods_amount` decimal(12,2) DEFAULT NULL COMMENT '数量',
  `invoice` varchar(255) DEFAULT NULL COMMENT '发票',
  `invoiceType` int(11) DEFAULT NULL COMMENT '发票类型',
  `msg` longtext COMMENT '消息',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态',
  `payTime` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_msg` longtext COMMENT '支付消息',
  `refund` decimal(12,2) DEFAULT NULL COMMENT '退款金额',
  `refund_type` varchar(255) DEFAULT NULL COMMENT '退款类型',
  `shipCode` varchar(255) DEFAULT NULL COMMENT '运送编码',
  `shipTime` datetime DEFAULT NULL COMMENT '运送时间',
  `ship_price` decimal(12,2) DEFAULT NULL COMMENT '运费',
  `totalPrice` decimal(12,2) DEFAULT NULL COMMENT '订单总额',
  `addr_id` bigint(20) DEFAULT NULL COMMENT '地址id',
  `payment_id` bigint(20) DEFAULT NULL COMMENT '支付id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '买家id',
  `auto_confirm_email` bit(1) DEFAULT NULL COMMENT '自动确认邮箱',
  `auto_confirm_sms` bit(1) DEFAULT NULL COMMENT '自动确认短信',
  `transport` varchar(255) DEFAULT NULL COMMENT '运费模板',
  `out_order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `ec_id` bigint(20) DEFAULT NULL COMMENT '未知',
  `ci_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `order_seller_intro` longtext COMMENT '卖家介绍',
  `return_shipCode` varchar(255) DEFAULT NULL COMMENT '退货运送编号',
  `return_ec_id` bigint(20) DEFAULT NULL COMMENT '退货',
  `return_content` longtext COMMENT '退货内容',
  `return_shipTime` datetime DEFAULT NULL COMMENT '退货运送时间',
  `order_type` varchar(255) DEFAULT NULL COMMENT '订单类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `display` bit(1) DEFAULT NULL COMMENT '是否显示',
  `info` varchar(255) DEFAULT NULL COMMENT '信息',
  `roleCode` varchar(255) DEFAULT NULL COMMENT '编码',
  `roleName` varchar(255) DEFAULT NULL COMMENT '名称',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `rg_id` bigint(20) DEFAULT NULL COMMENT '角色组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_role_res
-- ----------------------------
DROP TABLE IF EXISTS `t_role_res`;
CREATE TABLE `t_role_res` (
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `res_id` bigint(20) DEFAULT NULL COMMENT '资源id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rolegroup
-- ----------------------------
DROP TABLE IF EXISTS `t_rolegroup`;
CREATE TABLE `t_rolegroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_store
-- ----------------------------
DROP TABLE IF EXISTS `t_store`;
CREATE TABLE `t_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `card_approve` bit(1) DEFAULT NULL COMMENT '未知',
  `realstore_approve` bit(1) DEFAULT NULL COMMENT '未知',
  `store_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `store_credit` int(11) DEFAULT NULL COMMENT '信用',
  `store_info` longtext COMMENT '信息',
  `store_msn` varchar(255) DEFAULT NULL COMMENT 'MSN号码',
  `store_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `store_ower` varchar(255) DEFAULT NULL COMMENT '拥有者',
  `store_ower_card` varchar(255) DEFAULT NULL COMMENT '拥有者卡号',
  `store_qq` varchar(255) DEFAULT NULL COMMENT 'QQ号码',
  `store_recommend` bit(1) DEFAULT NULL COMMENT '是否推荐',
  `store_recommend_time` datetime DEFAULT NULL COMMENT '推荐时间',
  `store_seo_description` longtext COMMENT 'SEO描述',
  `store_seo_keywords` longtext COMMENT 'SEO关键词',
  `store_status` int(11) DEFAULT NULL COMMENT '状态',
  `store_telephone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `store_zip` varchar(255) DEFAULT NULL COMMENT '邮编',
  `template` varchar(255) DEFAULT NULL COMMENT '模板',
  `validity` datetime DEFAULT NULL COMMENT '有效时间',
  `violation_reseaon` longtext COMMENT '违规原因',
  `area_id` bigint(20) DEFAULT NULL COMMENT '区域id',
  `card_id` bigint(20) DEFAULT NULL COMMENT '卡id',
  `grade_id` bigint(20) DEFAULT NULL COMMENT '等级id',
  `sc_id` bigint(20) DEFAULT NULL COMMENT '店铺购物车id',
  `store_banner_id` bigint(20) DEFAULT NULL COMMENT '店铺主页banner',
  `store_license_id` bigint(20) DEFAULT NULL COMMENT '店铺许可证id',
  `store_logo_id` bigint(20) DEFAULT NULL COMMENT '店铺logo',
  `update_grade_id` bigint(20) DEFAULT NULL COMMENT '更新等级id',
  `domain_modify_count` int(11) DEFAULT NULL COMMENT '域名修改次数',
  `store_second_domain` varchar(255) DEFAULT NULL COMMENT '二级域名',
  `favorite_count` int(11) DEFAULT NULL COMMENT '收藏次数',
  `store_lat` decimal(6,2) DEFAULT NULL COMMENT '未知',
  `store_lng` decimal(6,2) DEFAULT NULL COMMENT '未知',
  `store_ww` varchar(255) DEFAULT NULL COMMENT '未知',
  `map_type` varchar(255) DEFAULT NULL COMMENT '未知',
  `delivery_begin_time` datetime DEFAULT NULL COMMENT '买就送开始时间',
  `delivery_end_time` datetime DEFAULT NULL COMMENT '买就送结束时间',
  `combin_begin_time` datetime DEFAULT NULL COMMENT '组合开始时间',
  `combin_end_time` datetime DEFAULT NULL COMMENT '组合结束时间',
  `weixin_begin_time` date DEFAULT NULL COMMENT '微商城开始时间',
  `weixin_end_time` date DEFAULT NULL COMMENT '微商城结束时间',
  `weixin_status` int(11) DEFAULT NULL COMMENT '微商城状态',
  `weixin_appId` varchar(255) DEFAULT NULL COMMENT '微信公众号appId',
  `weixin_appSecret` varchar(255) DEFAULT NULL COMMENT '微信公众号appSecret',
  `weixin_token` varchar(255) DEFAULT NULL COMMENT '微信公众号token',
  `weixin_welecome_content` longtext COMMENT '微商城欢迎内容',
  `weixin_qr_img_id` bigint(20) DEFAULT NULL COMMENT '微信公众号二维码id',
  `weixin_account` varchar(255) DEFAULT NULL COMMENT '微商城账户',
  `store_weixin_logo_id` bigint(20) DEFAULT NULL COMMENT '微商城logo',
  `weixin_store_name` varchar(255) DEFAULT NULL COMMENT '微商城店铺名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_store_stat
-- ----------------------------
DROP TABLE IF EXISTS `t_store_stat`;
CREATE TABLE `t_store_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `all_goods` int(11) DEFAULT NULL COMMENT '全部商品',
  `all_store` int(11) DEFAULT NULL COMMENT '全部店铺',
  `all_user` int(11) DEFAULT NULL COMMENT '全部用户',
  `next_time` datetime DEFAULT NULL COMMENT '下次时间',
  `order_amount` decimal(12,2) DEFAULT NULL COMMENT '订单总额',
  `store_update` int(11) DEFAULT NULL COMMENT '店铺更新',
  `week_complaint` int(11) DEFAULT NULL COMMENT '周投诉量',
  `week_goods` int(11) DEFAULT NULL COMMENT '周商品数量',
  `week_order` int(11) DEFAULT NULL COMMENT '周订单量',
  `week_report` int(11) DEFAULT NULL COMMENT '周报表量',
  `week_store` int(11) DEFAULT NULL COMMENT '周店铺数量',
  `week_user` int(11) DEFAULT NULL COMMENT '周用户数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_storecart
-- ----------------------------
DROP TABLE IF EXISTS `t_storecart`;
CREATE TABLE `t_storecart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `cart_session_id` varchar(255) DEFAULT NULL COMMENT '会话id',
  `total_price` decimal(19,2) DEFAULT NULL COMMENT '总价',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `sc_status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_storeclass
-- ----------------------------
DROP TABLE IF EXISTS `t_storeclass`;
CREATE TABLE `t_storeclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `className` varchar(255) DEFAULT NULL COMMENT '名称',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级id',
  `description_evaluate` decimal(4,1) DEFAULT NULL COMMENT '描述评价',
  `service_evaluate` decimal(4,1) DEFAULT NULL COMMENT '服务评价',
  `ship_evaluate` decimal(4,1) DEFAULT NULL COMMENT '运送评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_storewinestore
-- ----------------------------
DROP TABLE IF EXISTS `t_storewinestore`;
CREATE TABLE `t_storewinestore` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `cart_session_id` varchar(255) DEFAULT NULL COMMENT '会话id',
  `total_price` decimal(19,2) DEFAULT NULL COMMENT '总价',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `sc_status` int(11) DEFAULT NULL COMMENT '状态',
  `order_ids` text COMMENT '关联订单编号（编号之间用英文逗号分隔）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_trans_area
-- ----------------------------
DROP TABLE IF EXISTS `t_trans_area`;
CREATE TABLE `t_trans_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `areaName` varchar(255) DEFAULT NULL COMMENT '名称',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `sequence` int(11) DEFAULT NULL COMMENT '序号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_transport
-- ----------------------------
DROP TABLE IF EXISTS `t_transport`;
CREATE TABLE `t_transport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `trans_ems` bit(1) DEFAULT NULL COMMENT '是否EMS',
  `trans_ems_info` longtext COMMENT 'EMS信息',
  `trans_express` bit(1) DEFAULT NULL COMMENT '是否快递',
  `trans_express_info` longtext COMMENT '快递信息',
  `trans_mail` bit(1) DEFAULT NULL COMMENT '是否平邮',
  `trans_mail_info` longtext COMMENT '平邮信息',
  `trans_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺id',
  `trans_time` int(11) DEFAULT NULL COMMENT '运送时间',
  `trans_type` int(11) DEFAULT NULL COMMENT '运送类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `MSN` varchar(255) DEFAULT NULL COMMENT 'MSN号码',
  `QQ` varchar(255) DEFAULT NULL COMMENT 'QQ号码',
  `WW` varchar(255) DEFAULT NULL COMMENT '旺旺号码',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `availableBalance` decimal(12,2) DEFAULT NULL COMMENT '可用余额',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `freezeBlance` decimal(12,2) DEFAULT NULL COMMENT '冻结余额',
  `gold` int(11) DEFAULT NULL COMMENT '金币',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `lastLoginDate` datetime DEFAULT NULL COMMENT '上次登录日期',
  `lastLoginIp` varchar(255) DEFAULT NULL COMMENT '上次登录ip地址',
  `loginCount` int(11) DEFAULT NULL COMMENT '登录次数',
  `loginDate` datetime DEFAULT NULL COMMENT '登录日期',
  `loginIp` varchar(255) DEFAULT NULL COMMENT '登录ip地址',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `report` int(11) DEFAULT NULL COMMENT '报表',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `trueName` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `userRole` varchar(255) DEFAULT NULL COMMENT '角色',
  `user_credit` int(11) DEFAULT NULL COMMENT '信用',
  `photo_id` bigint(20) DEFAULT NULL COMMENT '相片id',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺',
  `qq_openid` varchar(255) DEFAULT NULL COMMENT 'qq的openid',
  `sina_openid` varchar(255) DEFAULT NULL COMMENT '新浪openid',
  `store_quick_menu` longtext COMMENT '店铺快捷菜单',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级id',
  `years` int(11) DEFAULT NULL COMMENT '年',
  `area_id` bigint(20) DEFAULT NULL COMMENT '区域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_userconfig
-- ----------------------------
DROP TABLE IF EXISTS `t_userconfig`;
CREATE TABLE `t_userconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_visit
-- ----------------------------
DROP TABLE IF EXISTS `t_visit`;
CREATE TABLE `t_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `visitTime` datetime DEFAULT NULL COMMENT '访问时间',
  `homepage_id` bigint(20) DEFAULT NULL COMMENT '主页',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_vlog
-- ----------------------------
DROP TABLE IF EXISTS `t_vlog`;
CREATE TABLE `t_vlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `gold` int(11) DEFAULT NULL COMMENT '金币',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_vmenu
-- ----------------------------
DROP TABLE IF EXISTS `t_vmenu`;
CREATE TABLE `t_vmenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `deleteStatus` bit(1) DEFAULT NULL COMMENT '删除状态',
  `menu_key` varchar(255) DEFAULT NULL COMMENT '键',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `menu_type` varchar(255) DEFAULT NULL COMMENT '类型',
  `menu_url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺',
  `menu_sequence` int(11) DEFAULT NULL COMMENT '序号',
  `menu_key_content` longtext COMMENT '内容',
  `menu_cat` varchar(255) DEFAULT NULL COMMENT '菜单类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
