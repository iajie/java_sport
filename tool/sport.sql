/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : sport

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 07/11/2021 16:43:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '食物名称',
  `type_id` bigint(20) NOT NULL COMMENT '食物类别',
  `image_urls` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片(列表)',
  `nutrient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营养元素',
  `heat` float(10, 2) NULL DEFAULT NULL COMMENT '热量',
  `protein` float(10, 2) NULL DEFAULT NULL COMMENT '蛋白质',
  `fat` float(10, 2) NULL DEFAULT NULL COMMENT '脂肪',
  `carbon_water` float(10, 2) NULL DEFAULT NULL COMMENT '碳水化合物',
  `dietary_fiber` float(10, 2) NULL DEFAULT NULL COMMENT '膳食纤维',
  `vitamin_a` float(10, 2) NULL DEFAULT NULL COMMENT '维生素A',
  `vitamin_c` float(10, 2) NULL DEFAULT NULL COMMENT '维生素C',
  `vitamin_e` float(10, 2) NULL DEFAULT NULL COMMENT '维生素E',
  `carrot` float(10, 2) NULL DEFAULT NULL COMMENT '胡萝卜素',
  `vitamin_b1` float(10, 2) NULL DEFAULT NULL COMMENT '维生素B1',
  `vitamin_b2` float(10, 2) NULL DEFAULT NULL COMMENT '维生素B2',
  `niacin` float(10, 2) NULL DEFAULT NULL COMMENT '烟酸',
  `cholesterol` float(10, 2) NULL DEFAULT NULL COMMENT '胆固醇',
  `magnesium` float(10, 2) NULL DEFAULT NULL COMMENT '镁',
  `iron` float(10, 2) NULL DEFAULT NULL COMMENT '铁',
  `calcium` float(10, 2) NULL DEFAULT NULL COMMENT '钙',
  `zinc` float(10, 2) NULL DEFAULT NULL COMMENT '锌',
  `copper` float(10, 2) NULL DEFAULT NULL COMMENT '铜',
  `manganese` float(10, 2) NULL DEFAULT NULL COMMENT '锰',
  `potassium` float(10, 2) NULL DEFAULT NULL COMMENT '钾',
  `phosphorus` float(10, 2) NULL DEFAULT NULL COMMENT '磷',
  `sodium` float(10, 2) NULL DEFAULT NULL COMMENT '钠',
  `selenium` float(10, 2) NULL DEFAULT NULL COMMENT '硒',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '食物详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
-- ----------------------------
-- Table structure for food_type
-- ----------------------------
DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类标题',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '食物分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food_type
-- ----------------------------
INSERT INTO `food_type` VALUES (1, '主食类', 'shiwu');
INSERT INTO `food_type` VALUES (2, '肉蛋类', 'roufu');
INSERT INTO `food_type` VALUES (3, '大豆及制品', 'kaoyudoufu');
INSERT INTO `food_type` VALUES (4, '蔬菜菌藻类', 'tubiaozhizuomoban');
INSERT INTO `food_type` VALUES (5, '水果类', 'shuiguo');
INSERT INTO `food_type` VALUES (6, '奶类', 'naizhipin');
INSERT INTO `food_type` VALUES (7, '油脂类', 'youtiao');
INSERT INTO `food_type` VALUES (8, '坚果类', 'jianguo');
INSERT INTO `food_type` VALUES (9, '调味品', 'tiaoweiliao');
INSERT INTO `food_type` VALUES (10, '饮料类', 'yinliao');
INSERT INTO `food_type` VALUES (11, '零食点心冷饮', 'icon-test');
INSERT INTO `food_type` VALUES (12, '其他', 'icon-test1');

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus`  (
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单权限ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES (1, 1);
INSERT INTO `roles_menus` VALUES (1, 2);
INSERT INTO `roles_menus` VALUES (1, 3);
INSERT INTO `roles_menus` VALUES (1, 4);
INSERT INTO `roles_menus` VALUES (1, 5);
INSERT INTO `roles_menus` VALUES (3, 1);
INSERT INTO `roles_menus` VALUES (7, 6);
INSERT INTO `roles_menus` VALUES (2, 1);
INSERT INTO `roles_menus` VALUES (2, 2);
INSERT INTO `roles_menus` VALUES (2, 3);
INSERT INTO `roles_menus` VALUES (2, 4);
INSERT INTO `roles_menus` VALUES (2, 5);
INSERT INTO `roles_menus` VALUES (2, 6);
INSERT INTO `roles_menus` VALUES (5, 1);
INSERT INTO `roles_menus` VALUES (5, 3);
INSERT INTO `roles_menus` VALUES (5, 4);
INSERT INTO `roles_menus` VALUES (6, 1);
INSERT INTO `roles_menus` VALUES (6, 5);
INSERT INTO `roles_menus` VALUES (6, 6);

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions`  (
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NULL DEFAULT NULL COMMENT '数据权限ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES (3, 1);
INSERT INTO `roles_permissions` VALUES (3, 2);
INSERT INTO `roles_permissions` VALUES (3, 4);
INSERT INTO `roles_permissions` VALUES (3, 15);
INSERT INTO `roles_permissions` VALUES (3, 16);
INSERT INTO `roles_permissions` VALUES (7, 1);
INSERT INTO `roles_permissions` VALUES (7, 2);
INSERT INTO `roles_permissions` VALUES (7, 5);
INSERT INTO `roles_permissions` VALUES (7, 8);
INSERT INTO `roles_permissions` VALUES (2, 1);
INSERT INTO `roles_permissions` VALUES (2, 2);
INSERT INTO `roles_permissions` VALUES (2, 3);
INSERT INTO `roles_permissions` VALUES (2, 4);
INSERT INTO `roles_permissions` VALUES (2, 7);
INSERT INTO `roles_permissions` VALUES (2, 6);
INSERT INTO `roles_permissions` VALUES (2, 5);
INSERT INTO `roles_permissions` VALUES (2, 8);
INSERT INTO `roles_permissions` VALUES (2, 9);
INSERT INTO `roles_permissions` VALUES (2, 10);
INSERT INTO `roles_permissions` VALUES (2, 13);
INSERT INTO `roles_permissions` VALUES (2, 12);
INSERT INTO `roles_permissions` VALUES (2, 11);
INSERT INTO `roles_permissions` VALUES (2, 15);
INSERT INTO `roles_permissions` VALUES (2, 16);
INSERT INTO `roles_permissions` VALUES (2, 19);
INSERT INTO `roles_permissions` VALUES (5, 1);
INSERT INTO `roles_permissions` VALUES (5, 2);
INSERT INTO `roles_permissions` VALUES (5, 4);
INSERT INTO `roles_permissions` VALUES (5, 15);
INSERT INTO `roles_permissions` VALUES (5, 16);
INSERT INTO `roles_permissions` VALUES (6, 1);
INSERT INTO `roles_permissions` VALUES (6, 2);
INSERT INTO `roles_permissions` VALUES (6, 4);
INSERT INTO `roles_permissions` VALUES (6, 15);
INSERT INTO `roles_permissions` VALUES (6, 16);
INSERT INTO `roles_permissions` VALUES (6, 1);
INSERT INTO `roles_permissions` VALUES (6, 2);
INSERT INTO `roles_permissions` VALUES (6, 4);
INSERT INTO `roles_permissions` VALUES (6, 15);
INSERT INTO `roles_permissions` VALUES (6, 16);
INSERT INTO `roles_permissions` VALUES (6, 1);
INSERT INTO `roles_permissions` VALUES (6, 2);
INSERT INTO `roles_permissions` VALUES (6, 4);
INSERT INTO `roles_permissions` VALUES (6, 15);
INSERT INTO `roles_permissions` VALUES (6, 16);
INSERT INTO `roles_permissions` VALUES (6, 5);
INSERT INTO `roles_permissions` VALUES (6, 8);
INSERT INTO `roles_permissions` VALUES (6, 11);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单组件',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级菜单',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '显示状态(0不显示、1显示)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '/', 'el-icon-set-up', '系统管理', 'home', NULL, 1);
INSERT INTO `sys_menu` VALUES (2, '/system/user', 'fa fa-user-md', '用户管理', 'system/user/index', 1, 1);
INSERT INTO `sys_menu` VALUES (3, '/system/role', 'fa fa-user-circle-o', '角色管理', 'system/role', 1, 1);
INSERT INTO `sys_menu` VALUES (4, '/system/permission', 'fa fa-pied-piper-alt', '权限管理', 'system/permission', 1, 1);
INSERT INTO `sys_menu` VALUES (5, '/system/menu', 'el-icon-menu', '菜单管理', 'system/menu', 1, 1);
INSERT INTO `sys_menu` VALUES (6, '/', 'eiconfont e-icon-yundong-yumaoqiu', '运动管理', 'home', NULL, 1);
INSERT INTO `sys_menu` VALUES (7, '/sport/intorduction', 'fa fa-codepen', '运动科普', 'sport/intorduction', 6, 0);
INSERT INTO `sys_menu` VALUES (8, 'food/type/index', 'fa fa-arrow-left', '食物分类管理', 'food/index', 8, 1);
INSERT INTO `sys_menu` VALUES (11, '/', 'fa fa-cutlery', '食物管理', 'home', NULL, 1);
INSERT INTO `sys_menu` VALUES (12, '/food/type', 'fa fa-codepen', '食物的分类管理', 'food/index', 11, 1);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标签',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限标签值',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '显示状态(0不显示、1显示)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, '添加用户', 'USER_INSERT', 1);
INSERT INTO `sys_permission` VALUES (2, '修改用户', 'USER_UPDATE', 1);
INSERT INTO `sys_permission` VALUES (3, '删除用户', 'USER_DELETE', 1);
INSERT INTO `sys_permission` VALUES (4, '查询用户', 'USER_SELECT', 1);
INSERT INTO `sys_permission` VALUES (5, '设置用户为管理员', 'USER_SET_ADMIN', 1);
INSERT INTO `sys_permission` VALUES (6, '添加角色', 'PRE_ROLE_INSERT', 1);
INSERT INTO `sys_permission` VALUES (7, '修改角色', 'PRE_USER_UPDATE', 1);
INSERT INTO `sys_permission` VALUES (8, '删除角色', 'PRE_USER_DELETE', 1);
INSERT INTO `sys_permission` VALUES (9, '查询角色', 'PRE_USER_SELECT', 1);
INSERT INTO `sys_permission` VALUES (10, '添加权限数据', 'PRE_INSERT', 1);
INSERT INTO `sys_permission` VALUES (11, '修改权限数据', 'PRE_UPDATE', 1);
INSERT INTO `sys_permission` VALUES (12, '删除权限数据', 'PRE_DELETE', 1);
INSERT INTO `sys_permission` VALUES (13, '查询权限数据', 'PRE_SELECT', 1);
INSERT INTO `sys_permission` VALUES (14, '添加菜单', 'MENU_INSERT', 0);
INSERT INTO `sys_permission` VALUES (15, '修改菜单', 'MENU_UPDATE', 1);
INSERT INTO `sys_permission` VALUES (16, '删除菜单', 'MENU_DELETE', 1);
INSERT INTO `sys_permission` VALUES (19, '查询菜单', 'MENU_SELECT', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色对应的标签值',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '显示状态(0不显示、1显示)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'SUPER_ADMIN', 1);
INSERT INTO `sys_role` VALUES (2, '管理员', 'ADMIN', 1);
INSERT INTO `sys_role` VALUES (3, '普通角色', 'PT_ROLE', 1);
INSERT INTO `sys_role` VALUES (5, '食物分配管理师', 'SPORT', 1);
INSERT INTO `sys_role` VALUES (6, '主任', 'ZHUREN', 1);
INSERT INTO `sys_role` VALUES (7, '搜索', 'fdsf', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别(0男，1女，2未知)',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小程序openid，每个用户对应一个，且唯一',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态，是否禁用',
  `admin` tinyint(1) NULL DEFAULT NULL COMMENT '是否是管理员',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$H4TnTlyPD6R/hvMj0sEzseqguWzt.GzI/TtJPLgXPdEDQRbUfPDde', '管理员', 0, 'https://thirdwx.qlogo.cn/mmopen/vi_32/2WrOZ9pEI713zuYictHR3UtjicKPEkVXTpeQAGVBdRBtABR5Oe6wNuT4NMg6s7wgHTjxd70kiabibKM3klMn7nUT6g/132', '', '', 1, 1, '15523285128', NULL);
INSERT INTO `sys_user` VALUES (3, '张三', '$2a$10$PkcvdnS74lNH9f5aBKwxcutiznjhVMmjQhUHvCL.04UX3rjwDIG9O', '大哥', 0, '20210906220630安装工具.png', NULL, NULL, 1, 0, '13728287829', '1737194722@qq.com');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (2, 3);
INSERT INTO `user_roles` VALUES (3, 5);
INSERT INTO `user_roles` VALUES (3, 1);

SET FOREIGN_KEY_CHECKS = 1;
