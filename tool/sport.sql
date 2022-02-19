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

 Date: 19/02/2022 23:02:51
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
INSERT INTO `food` VALUES (1, '稀饭', 1, '20211107163220c39b9a7.JPG', '每100g', 59.00, 1.30, 0.20, 13.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7.00, 0.10, 7.00, 0.12, 0.01, 0.01, 13.00, 20.00, 2.80, 0.74);
INSERT INTO `food` VALUES (2, '白粥', 1, '20211107163224a1142f7.JPG', '每100g', 46.00, 1.10, 0.30, 9.90, 0.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.03, 0.20, 0.00, 7.00, 0.10, 7.00, 0.20, 0.03, 0.20, 13.00, 20.00, 2.80, 0.20);
INSERT INTO `food` VALUES (3, '鲜玉米', 1, '202111071632257048778.JPG', '每100g', 112.00, 4.00, 1.20, 22.80, 2.90, 0.00, 16.00, 0.46, 0.00, 0.16, 0.11, 1.80, 0.00, 32.00, 1.10, 0.00, 0.90, 0.09, 0.22, 238.00, 117.00, 1.10, 1.63);
INSERT INTO `food` VALUES (4, '燕麦片', 1, '2021110716322562be0a1.JPG', '每100g', 338.00, 10.10, 0.20, 77.40, 6.00, 0.00, 0.00, 0.91, 0.00, 0.46, 0.07, 0.00, 0.00, 116.00, 2.90, 58.00, 1.75, 0.21, 3.91, 356.00, 342.00, 2.10, 0.00);
INSERT INTO `food` VALUES (5, '煮面条', 1, '202111071632260a25026.JPG', '每100g', 107.00, 3.90, 0.40, 22.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.02, 0.01, 0.56, 0.00, 10.00, 0.20, 4.00, 0.10, 0.01, 0.01, 15.00, 24.00, 26.90, 1.16);
INSERT INTO `food` VALUES (6, '面包', 1, '2021110716322694aa22e.JPG,20211107163943a9eb9b5773eb023580ca269efd81e5fa.jpeg,20211107163949306cc7841a50f011ebd5f8683c79e12e.jpeg', '每100g', 313.00, 8.30, 5.10, 58.60, 0.50, NULL, NULL, 1.66, NULL, 0.03, 0.06, 1.70, NULL, 31.00, 2.00, 49.00, 0.75, 0.27, 0.37, 88.00, 107.00, 230.40, 3.15);
INSERT INTO `food` VALUES (7, '红薯', 1, '202111071632265bc1396.JPG', '每100g', 86.00, 1.57, 0.10, 20.12, 3.00, 709.00, 2.40, 0.26, 8968.00, 0.08, 0.06, 0.56, 0.00, 25.00, 0.61, 30.00, 0.30, 0.15, 0.26, 337.00, 47.00, 55.00, 0.60);
INSERT INTO `food` VALUES (8, '小米粥', 1, '20211107163226310586e.JPG', '每100g', 46.00, 1.40, 0.70, 8.40, 0.00, 0.00, 0.00, 0.26, 0.00, 0.02, 0.07, 0.90, 0.00, 22.00, 1.00, 10.00, 0.41, 0.07, 0.16, 19.00, 32.00, 4.10, 0.30);
INSERT INTO `food` VALUES (9, '马铃薯', 1, '20211107163227e0bd1c3.JPG', '每100g', 81.00, 2.60, 17.80, 1.10, 1.00, 14.00, 0.34, 6.00, 0.10, 0.02, 1.10, 0.00, 24.00, 7.00, 0.30, 0.40, 0.09, 0.10, 347.00, 46.00, 5.90, 0.47, NULL);
INSERT INTO `food` VALUES (10, '米饭', 1, '20211107163227a1f32bd.JPG', '每100g', 116.00, 2.60, 0.30, 25.90, 0.30, 0.00, 0.00, 0.00, 0.00, 0.02, 0.03, 1.90, 0.00, 15.00, 1.30, 7.00, 0.92, 0.06, 0.58, 30.00, 62.00, 2.50, 0.40);
INSERT INTO `food` VALUES (11, '白薯', 1, '20211107163227a55d339.JPG', '每100g', 106.00, 1.40, 0.20, 25.20, 1.00, 18.00, 24.00, 0.43, 220.00, 0.07, 0.04, 0.60, 0.00, 17.00, 0.80, 24.00, 0.22, 0.16, 0.21, 174.00, 46.00, 58.20, 0.63);
INSERT INTO `food` VALUES (12, '烙饼', 1, '20211107163228506ec58.JPG', '每100g', 258.00, 7.50, 2.30, 52.90, 1.90, 0.00, 0.00, 1.03, 0.00, 0.02, 0.04, 0.00, 0.00, 51.00, 2.40, 20.00, 0.94, 0.15, 1.15, 141.00, 146.00, 149.30, 7.50);
INSERT INTO `food` VALUES (13, '紫薯', 1, '202111071632284e8dbb3.JPG', '每100g', 133.00, 1.20, 0.30, 31.70, 2.50, 0.00, 0.10, 1.30, 0.00, 0.12, 0.02, 1.30, 0.00, 26.00, 0.60, 24.00, 0.20, 0.21, 0.50, 370.00, 56.00, 30.00, 0.00);
INSERT INTO `food` VALUES (14, '方便面', 1, '2021110716322819e3932.JPG', '每100g', 473.00, 9.50, 21.10, 61.60, 0.70, NULL, NULL, 2.28, NULL, 0.12, 0.06, 0.90, NULL, 38.00, 4.10, 25.00, 1.06, 0.29, 0.79, 134.00, 80.00, 1144.00, 10.49);
INSERT INTO `food` VALUES (15, '山药', 1, '2021110716322858eca7e.JPG', '每100g', 57.00, 1.90, 0.20, 12.40, 0.80, 3.00, 5.00, 0.24, 20.00, 0.05, 0.02, 0.30, 0.00, 20.00, 0.30, 16.00, 0.27, 0.24, 0.12, 213.00, 34.00, 18.60, 0.55);
INSERT INTO `food` VALUES (16, '鸡蛋', 2, '2021110716322948da7e6.JPG', '每100g', 139.00, 13.10, 8.60, 2.40, 0.00, 255.00, 0.00, 1.14, 0.00, 0.09, 0.20, 0.20, 648.00, 10.00, 1.60, 56.00, 0.89, 0.19, 0.03, 154.00, 130.00, 13.15, 13.96);
INSERT INTO `food` VALUES (17, '猪小排', 2, '20211107163230d6753bd.JPG', '每100g', 295.00, 16.80, 25.30, 0.00, 0.00, 7.00, 0.00, 0.46, 0.00, 0.31, 0.26, 4.11, 120.00, 17.00, 1.10, 14.00, 2.42, 0.00, 0.00, 222.00, 101.00, 62.66, 8.46);
INSERT INTO `food` VALUES (18, '鸭肉', 2, NULL, '每100g', 240.00, 15.50, 19.70, 0.20, NULL, 52.00, NULL, 0.27, NULL, 0.08, 0.22, 4.20, 94.00, 14.00, 2.20, 6.00, 1.33, 0.21, 0.06, 191.00, 122.00, 69.00, 12.25);
INSERT INTO `food` VALUES (19, '鸡肉(公鸡)', 2, '20211107163230ca7c589.JPG', '每100g', 389.00, 16.70, 35.40, 0.90, NULL, 226.00, NULL, NULL, NULL, 0.07, 0.07, 131.00, 106.00, 7.00, 1.70, 37.00, 1.10, 0.08, 0.01, 123.00, 102.00, 47.80, 5.40);
INSERT INTO `food` VALUES (20, '鸡肉(母鸡)', 2, '20211107163230b82bea2.JPG', '每100g', 256.00, 20.30, 16.80, 5.80, NULL, 139.00, NULL, 1.34, NULL, 0.05, 0.04, 8.80, 166.00, 16.00, 1.20, 2.00, 1.46, 0.09, 0.04, 275.00, 120.00, 62.20, NULL);
INSERT INTO `food` VALUES (21, '鸡肉(土鸡)', 2, '202111071632304a08a77.JPG', '每100g', 124.00, 20.80, 4.50, 0.00, NULL, 64.00, NULL, 2.02, NULL, 0.09, 0.08, 15.70, 106.00, 40.00, 2.10, 9.00, 1.06, 0.10, 0.05, 276.00, 141.00, 74.10, 12.75);
INSERT INTO `food` VALUES (22, '猪蹄', 2, '20211107163231f6ec731.JPG', '每100g', 260.00, 22.60, 18.80, 0.00, 0.00, 3.00, 0.00, 0.01, 0.00, 0.05, 0.10, 1.50, 192.00, 5.00, 1.10, 33.00, 1.14, 0.09, 0.01, 54.00, 33.00, 101.00, 5.85);
INSERT INTO `food` VALUES (23, '猪肉(瘦)', 2, '20211107163231d168b5c.JPG', '每100g', 143.00, 20.30, 6.20, 1.50, 0.00, 44.00, 0.00, 0.34, 0.00, 0.54, 0.10, 5.30, 81.00, 25.00, 3.00, 6.00, 2.99, 0.11, 0.03, 305.00, 189.00, 57.50, 9.50);
INSERT INTO `food` VALUES (24, '鸡蛋清', 2, '202111071632318c30780.JPG', '每100g', 60.00, 11.60, 0.10, 3.10, NULL, NULL, NULL, 0.01, NULL, 0.04, 0.31, 0.20, NULL, 15.00, 1.60, 9.00, 0.02, 0.05, 0.02, 132.00, 18.00, 79.40, 6.97);
INSERT INTO `food` VALUES (25, '火腿肠', 2, NULL, '每100g', 212.00, 14.00, 10.40, 15.60, 0.00, 5.00, 0.00, 0.71, 0.00, 0.26, 0.43, 2.30, 57.00, 22.00, 4.50, 9.00, 3.22, 0.36, 0.14, 217.00, 187.00, 771.20, 9.20);
INSERT INTO `food` VALUES (26, '鸡胸肉', 2, '20211107163232a377750.JPG', '每100g', 118.00, 24.60, 1.90, 0.60, 0.00, 3.00, 0.00, 0.41, 0.00, 0.07, 0.06, 11.96, 65.00, 28.00, 1.00, 1.00, 0.26, 0.01, 0.01, 333.00, 170.00, 44.80, 11.75);
INSERT INTO `food` VALUES (27, '牛肉(腑肋)', 2, '202111071632324dd60b8.JPG', '每100g', 123.00, 18.60, 5.40, 0.00, NULL, 7.00, NULL, 0.37, NULL, 0.06, 0.13, 3.10, 71.00, 14.00, 2.70, 19.00, 4.05, 0.07, 0.06, 217.00, 120.00, 66.60, 2.35);
INSERT INTO `food` VALUES (28, '猪大排', 2, '202111071632320c8c792.JPG', '每100g', 264.00, 18.30, 20.40, 1.70, 0.00, 12.00, 0.00, 0.11, 0.00, 0.80, 0.15, 5.30, 165.00, 17.00, 0.80, 8.00, 1.72, 0.12, 0.05, 274.00, 125.00, 44.50, 10.30);
INSERT INTO `food` VALUES (29, '猪肉(奶脯)', 2, NULL, '每100g', 349.00, 7.70, 35.50, 0.00, NULL, 39.00, NULL, 0.49, NULL, 0.14, 0.06, 2.00, 98.00, 5.00, 0.80, 5.00, 0.73, 0.13, NULL, 53.00, 67.00, 36.70, 2.22);
INSERT INTO `food` VALUES (30, '草鱼', 2, '2021110716323279f81c0.JPG', '每100g', 113.00, 16.60, 5.20, 0.00, 0.00, 11.00, 0.00, 2.03, 0.00, 0.04, 0.11, 2.80, 86.00, 31.00, 0.80, 38.00, 0.87, 0.05, 0.05, 312.00, 203.00, 46.00, 6.66);
INSERT INTO `food` VALUES (31, '鸡腿', 2, '20211107163233646be79.JPG', '每100g', 146.00, 20.20, 7.20, 0.00, 0.00, 22.00, 0.00, 0.00, 0.00, 0.06, 0.10, 3.25, 99.00, 21.00, 1.80, 0.00, 1.11, 0.01, 0.01, 221.00, 271.00, 73.60, 9.70);
INSERT INTO `food` VALUES (32, '鲫鱼', 2, '20211107163233ba0799c.JPG', '每100g', 108.00, 17.10, 2.70, 3.80, 0.00, 17.00, 0.00, 0.68, 0.00, 0.04, 0.09, 2.50, 130.00, 41.00, 1.30, 79.00, 1.94, 0.08, 0.06, 290.00, 193.00, 41.20, 14.31);
INSERT INTO `food` VALUES (33, '牛肉干', 2, '20211107163233badd3c4.JPG', '每100g', 550.00, 45.60, 40.00, 1.90, 0.00, 0.00, 0.00, 0.00, 0.00, 0.06, 0.26, 15.20, 120.00, 107.00, 15.60, 43.00, 7.26, 0.29, 0.19, 510.00, 464.00, 412.40, 9.80);
INSERT INTO `food` VALUES (34, '鲤鱼', 2, '20211107163234cf8b947.JPG', '每100g', 109.00, 17.60, 4.10, 0.50, 0.00, 25.00, 0.00, 1.27, 0.00, 0.03, 0.09, 2.70, 84.00, 33.00, 1.00, 50.00, 2.08, 0.06, 0.05, 334.00, 204.00, 53.70, 15.38);
INSERT INTO `food` VALUES (35, '明虾', 2, '202111071632344829931.JPG', '每100g', 85.00, 13.40, 1.80, 3.80, 0.00, 0.00, 0.00, 1.55, 0.00, 0.01, 0.04, 4.00, 273.00, 31.00, 0.60, 75.00, 3.59, 0.09, 0.02, 238.00, 189.00, 119.00, 25.48);
INSERT INTO `food` VALUES (36, '青鱼', 2, '20211107163234f4cbbb6.JPG', '每100g', 118.00, 20.10, 4.20, 0.00, 0.00, 42.00, 0.00, 0.81, 0.00, 0.03, 0.07, 2.90, 108.00, 32.00, 0.90, 31.00, 0.96, 0.06, 0.04, 325.00, 184.00, 47.40, 37.69);
INSERT INTO `food` VALUES (37, '猪肝', 2, '20211107163234aa3f2a2.JPG', '每100g', 126.00, 19.20, 4.70, 1.80, 0.00, 6502.00, 20.00, 0.00, 0.00, 0.22, 2.02, 10.11, 108.00, 24.00, 23.20, 6.00, 3.68, 0.02, 0.01, 235.00, 243.00, 68.60, 26.12);
INSERT INTO `food` VALUES (38, '黄鱼(大黄花鱼)', 2, '202111071632357516d0b.JPG', '每100g', 97.00, 17.70, 2.50, 0.80, 0.00, 0.00, 0.00, 1.13, 0.00, 0.03, 0.10, 1.90, 86.00, 39.00, 0.70, 53.00, 0.58, 0.04, 0.02, 260.00, 174.00, 120.30, 42.57);
INSERT INTO `food` VALUES (39, '河虾', 2, NULL, '每100g', 87.00, 16.40, 2.40, 0.00, 0.00, 48.00, 0.00, 5.33, 0.00, 0.04, 0.03, 0.00, 240.00, 60.00, 4.00, 325.00, 2.24, 0.64, 0.27, 329.00, 186.00, 133.80, 29.65);
INSERT INTO `food` VALUES (40, '罗非鱼', 2, '20211107163235a7fa5a5.JPG', '每100g', 98.00, 18.40, 1.50, 2.80, 0.00, 0.00, 0.00, 1.91, 0.00, 0.11, 0.17, 3.30, 78.00, 36.00, 0.90, 12.00, 0.87, 0.05, 0.09, 289.00, 161.00, 19.80, 22.60);
INSERT INTO `food` VALUES (41, '鳕鱼', 2, NULL, '每100g', 88.00, 20.40, 0.50, 0.50, 0.00, 14.00, 0.00, 0.00, 0.00, 0.04, 0.13, 2.70, 114.00, 84.00, 0.50, 42.00, 0.86, 0.01, 0.01, 321.00, 232.00, 130.30, 24.80);
INSERT INTO `food` VALUES (42, '鲈鱼', 2, NULL, '每100g', 105.00, 18.60, 3.40, 0.00, 0.00, 19.00, 0.00, 0.75, 0.00, 0.03, 0.17, 3.10, 86.00, 37.00, 2.00, 138.00, 2.83, 0.05, 0.04, 205.00, 242.00, 141.10, 33.06);
INSERT INTO `food` VALUES (43, '鳗鱼', 2, NULL, '每100g', 211.00, 21.30, 9.80, 9.50, 0.00, 0.00, 0.00, 5.91, 75.00, 0.03, 0.09, 1.47, 50.00, 16.00, 2.20, 37.00, 2.46, 0.04, 0.05, 174.00, 120.00, 1252.00, 24.45);
INSERT INTO `food` VALUES (44, '豆浆', 3, '20211107163235e2646a1.JPG', '每100g', 31.00, 3.00, 1.60, 1.20, 0.00, 0.00, 0.00, 1.06, 0.00, 0.02, 0.02, 0.14, 0.00, 15.00, 0.40, 5.00, 0.28, 0.16, 0.16, 117.00, 42.00, 3.70, 0.00);
INSERT INTO `food` VALUES (45, '豆浆(甜)', 3, '20211107163236ca24bf7.JPG', '每100g', 34.00, 2.40, 0.50, 4.90, 0.10, 0.00, 0.00, 1.27, 0.00, 0.04, 0.02, 0.15, 0.00, 15.00, 0.50, 27.00, 0.27, 0.08, 0.00, 54.00, 21.00, 0.00, 0.10);
INSERT INTO `food` VALUES (46, '豆腐干(白干)', 3, NULL, '每100g', 197.00, 14.90, 11.30, 9.60, 0.00, 2.00, 0.00, 13.00, 25.00, 0.02, 0.05, 0.40, 0.00, 69.00, 7.10, 447.00, 1.84, 0.41, 1.07, 137.00, 174.00, 329.00, 7.12);
INSERT INTO `food` VALUES (47, '豆腐', 3, NULL, '每100g', 84.00, 6.60, 5.30, 3.40, 0.00, 0.00, 0.00, 5.79, 0.00, 0.06, 0.02, 0.21, 0.00, 41.00, 1.20, 78.00, 0.57, 0.08, 0.12, 118.00, 82.00, 5.60, 1.50);
INSERT INTO `food` VALUES (48, '豆腐花', 3, NULL, '每100g', 15.00, 1.90, 0.80, 0.00, 0.00, 21.00, 0.00, 5.00, 250.00, 0.02, 0.03, 0.40, 0.00, 60.00, 3.30, 175.00, 0.75, 0.28, 0.52, 339.00, 95.00, 0.00, 1.70);
INSERT INTO `food` VALUES (49, '豆奶', 3, '2021110716323683238e5.JPG', '每100g', 30.00, 2.40, 1.50, 1.80, 0.00, 0.00, 0.00, 4.50, 0.00, 0.02, 0.06, 0.30, 0.00, 7.00, 0.60, 23.00, 0.24, 5.57, 0.11, 92.00, 35.00, 3.20, 0.73);
INSERT INTO `food` VALUES (50, '豆腐脑', 3, NULL, '每100g', 48.00, 2.60, 1.80, 5.40, 0.20, NULL, NULL, 0.87, NULL, 0.01, 0.40, NULL, 35.00, 301.00, 0.45, 1.70, 0.06, 0.18, 108.00, 46.00, 235.60, 0.50, NULL);
INSERT INTO `food` VALUES (51, '黄豆', 3, NULL, '每100g', 390.00, 35.00, 16.00, 34.20, 15.50, 18.00, 0.00, 18.90, 220.00, 0.41, 0.20, 2.10, 0.00, 199.00, 8.20, 191.00, 3.34, 1.35, 2.26, 1503.00, 465.00, 2.20, 6.16);
INSERT INTO `food` VALUES (52, '黑豆', 3, '2021110716323678f8278.JPG', '每100g', 401.00, 36.00, 15.90, 33.60, 10.20, 3.00, 0.00, 17.36, 30.00, 0.20, 0.33, 2.00, 0.00, 243.00, 7.00, 224.00, 4.18, 1.56, 2.83, 1377.00, 500.00, 3.00, 6.79);
INSERT INTO `food` VALUES (53, '腐竹(干)', 3, NULL, '每100g', 485.00, 54.20, 27.20, 8.10, 0.00, 0.00, 0.00, 28.43, 0.00, 0.02, 0.17, 0.80, 0.00, 140.00, 3.80, 50.00, 4.71, 0.86, 2.38, 670.00, 655.00, 27.10, 1.51);
INSERT INTO `food` VALUES (54, '青豆(干)', 3, '2021110716323663ba9b6.JPG', '每100g', 152.00, 15.80, 7.80, 5.10, 0.80, 3.00, 0.00, 15.85, 40.00, 0.04, 0.03, 0.30, 0.00, 88.00, 5.70, 299.00, 1.59, 0.41, 1.19, 99.00, 219.00, 234.10, 3.15);
INSERT INTO `food` VALUES (55, '豆渣', 3, NULL, '每100g', 89.00, 4.80, NULL, 3.60, 9.70, 9.70, 0.00, 0.00, 3.50, 0.00, 0.11, 0.04, 0.30, NULL, NULL, 100.00, 1.20, NULL, NULL, NULL, NULL, 4.80, NULL);
INSERT INTO `food` VALUES (56, '小白菜', 4, '20211107163237ef0ab80.JPG', '每100g', 14.00, 1.40, 0.30, 2.40, 0.00, 154.00, 64.00, 0.40, 1853.00, 0.01, 0.05, 0.00, 0.00, 30.00, 1.30, 117.00, 0.23, 0.02, 0.15, 116.00, 26.00, 132.20, 0.39);
INSERT INTO `food` VALUES (57, '大白菜', 4, '2021110716323717e363f.JPG', '每100g', 20.00, 1.60, 0.20, 3.40, 0.90, 7.00, 37.50, 0.36, 80.00, 0.05, 0.04, 0.65, 0.00, 12.00, 0.80, 57.00, 0.46, 0.06, 0.19, 134.00, 33.00, 68.90, 0.57);
INSERT INTO `food` VALUES (58, '番茄', 4, NULL, '每100g', 15.00, 0.90, 0.20, 3.30, 1.00, 31.00, 14.00, 0.42, 375.00, 0.02, 0.01, 0.49, 0.00, 12.00, 0.20, 4.00, 0.12, 0.04, 0.06, 179.00, 24.00, 9.70, 0.00);
INSERT INTO `food` VALUES (59, '黄瓜', 4, NULL, '每100g', 16.00, 0.80, 0.20, 2.90, 0.50, 8.00, 9.00, 0.49, 90.00, 0.02, 0.03, 0.20, 0.00, 15.00, 0.50, 24.00, 0.18, 0.05, 0.06, 102.00, 24.00, 4.90, 0.38);
INSERT INTO `food` VALUES (60, '上海青', 4, NULL, '每100g', 18.00, 1.70, 0.20, 3.20, 1.60, 200.00, 10.00, NULL, 1200.00, NULL, 0.03, 0.50, NULL, 91.00, 1.80, 59.00, 0.54, 0.06, 0.19, 245.00, 36.00, 56.90, 3.40);
INSERT INTO `food` VALUES (61, '西兰花', 4, NULL, '每100g', 27.00, 3.50, 0.60, 3.70, 2.60, 13.00, 56.00, 0.76, 151.00, 0.06, 0.08, 0.73, 0.00, 22.00, 0.90, 50.00, 0.46, 0.03, 0.16, 179.00, 61.00, 46.70, 0.43);
INSERT INTO `food` VALUES (62, '白萝卜', 4, NULL, '每100g', 16.00, 0.70, 0.10, 4.00, 1.10, 0.00, 19.00, 0.00, 0.00, 0.02, 0.01, 0.14, 0.00, 12.00, 0.20, 47.00, 0.14, 0.01, 0.01, 0.05, 167.00, 16.00, 0.12);
INSERT INTO `food` VALUES (63, '花菜', 4, '20211107163237a1954a8.JPG', '每100g', 20.00, 1.70, 0.20, 4.20, 2.10, 1.00, 32.00, 0.00, 11.00, 0.04, 0.04, 0.32, 0.00, 18.00, 0.40, 31.00, 0.17, 0.02, 0.09, 206.00, 32.00, 39.20, 2.86);
INSERT INTO `food` VALUES (64, '南瓜', 4, NULL, '每100g', 23.00, 0.70, 0.10, 5.30, 0.80, 74.00, 8.00, 0.36, 890.00, 0.03, 0.04, 0.40, 0.00, 8.00, 0.40, 16.00, 0.14, 0.03, 0.08, 145.00, 24.00, 0.80, 0.46);
INSERT INTO `food` VALUES (65, '胡萝卜', 4, NULL, '每100g', 39.00, 1.00, 0.20, 8.80, 1.10, 688.00, 13.00, 0.41, 4130.00, 0.44, 0.03, 0.60, 0.00, 14.00, 1.00, 32.00, 0.23, 0.08, 190.00, 27.00, 71.40, 0.63, 0.00);
INSERT INTO `food` VALUES (66, '生菜', 4, NULL, '每100g', 16.00, 1.40, 0.40, 2.10, 0.60, 60.00, 20.00, 0.00, 360.00, 0.00, 0.10, 0.20, 0.00, 29.00, 1.20, 70.00, 0.43, 0.08, 0.15, 100.00, 31.00, 80.00, 1.55);
INSERT INTO `food` VALUES (67, '圣女果', 4, NULL, '每100g', 25.00, 1.00, 0.20, 5.80, 1.50, 28.00, 33.00, 0.98, 332.00, 0.03, 0.02, 0.92, 0.00, 12.00, 0.30, 6.00, 0.20, 0.04, 0.06, 262.00, 26.00, 10.00, 0.20);
INSERT INTO `food` VALUES (68, '冬瓜', 4, NULL, '每100g', 10.00, 0.30, 0.20, 2.40, 1.10, 0.00, 16.00, 0.04, 0.00, 0.00, 0.00, 0.22, 0.00, 10.00, 0.10, 12.00, 0.10, 0.10, 0.02, 57.00, 11.00, 2.80, 0.02);
INSERT INTO `food` VALUES (69, '竹笋(嫩)', 4, NULL, '每100g', 23.00, 2.60, 0.20, 3.60, 1.80, 0.00, 5.00, 0.05, 0.00, 0.08, 0.08, 0.60, 1.00, 9.00, 0.33, 0.50, 0.09, 1.14, 389.00, 64.00, 0.40, 0.04, NULL);
INSERT INTO `food` VALUES (70, '卷心菜', 4, NULL, '每100g', 24.00, 1.50, 0.20, 4.60, 1.00, 6.00, 40.00, 0.50, 70.00, 0.03, 0.03, 0.40, 12.00, 49.00, 0.60, 0.60, 0.25, 0.04, 0.18, 124.00, 26.00, 27.20, 0.96);
INSERT INTO `food` VALUES (71, '木耳', 4, NULL, '每100g', 27.00, 1.50, 0.20, 2.60, 2.00, 1.00, 0.00, 20.00, 20.00, 0.01, 0.05, 0.20, 0.00, 57.00, 5.50, 34.00, 0.53, 0.04, 0.97, 52.00, 12.00, 8.50, 0.46);
INSERT INTO `food` VALUES (72, '菠菜', 4, NULL, '每100g', 28.00, 2.60, 0.30, 4.50, 1.70, 243.00, 32.00, 1.74, 2920.00, 0.04, 0.11, 0.60, 0.00, 58.00, 2.90, 66.00, 0.85, 0.10, 0.66, 311.00, 47.00, 85.20, 0.97);
INSERT INTO `food` VALUES (73, '豆芽(黄豆芽)', 4, NULL, '每100g', 16.00, 1.70, 0.10, 2.60, 1.20, 1.00, 1.00, 4.00, 0.00, 11.00, 0.02, 0.02, 0.35, 0.00, 14.00, 18.00, 0.30, 0.20, 0.05, 32.00, 19.00, 25.80, 0.27);
INSERT INTO `food` VALUES (74, '香菇(鲜)', 4, NULL, '每100g', 26.00, 2.20, 0.30, 5.20, 3.30, 0.00, 1.00, 0.00, 0.00, 0.00, 0.08, 2.00, 0.00, 11.00, 0.30, 2.00, 0.66, 0.12, 0.25, 20.00, 53.00, 1.40, 2.58);
INSERT INTO `food` VALUES (75, '茄子', 4, NULL, '每100g', 23.00, 1.10, 0.20, 4.90, 1.30, 4.00, 5.00, 1.13, 50.00, 0.02, 0.04, 0.60, 0.00, 13.00, 0.50, 24.00, 0.23, 0.10, 0.13, 142.00, 23.00, 5.40, 0.48);
INSERT INTO `food` VALUES (76, '海带(浸)', 4, NULL, '每100g', 16.00, 1.10, 0.10, 3.00, 0.90, 26.00, 0.00, 0.08, 310.00, 0.02, 0.01, 0.90, 0.00, 61.00, 3.30, 241.00, 0.66, 0.03, 1.47, 222.00, 29.00, 107.60, 4.90);
INSERT INTO `food` VALUES (77, '鱼腥草(叶)', 4, NULL, '每100g', 32.00, 2.10, 0.10, 10.70, 0.00, 0.00, 1.60, 1.28, 0.00, 0.03, 1.20, 1.04, 0.00, 145.00, 2.30, 57.00, 0.40, 0.09, 1.00, 494.00, 31.00, 21.60, 1.25);
INSERT INTO `food` VALUES (78, '空心菜', 4, NULL, '每100g', 19.00, 2.20, 0.20, 4.00, 1.90, 143.00, 5.00, 0.10, 1714.00, 0.03, 0.05, 0.22, 0.00, 46.00, 1.00, 115.00, 0.27, 0.05, 0.52, 304.00, 37.00, 107.60, 0.00);
INSERT INTO `food` VALUES (79, '豌豆尖', 4, '20211107163238f95c908.JPG', '每100g', 32.00, 4.80, 0.80, 2.60, 0.00, 28.00, 8.00, 0.10, 333.00, 0.11, 0.16, 0.49, 0.00, 14.00, 0.50, 15.00, 0.42, 0.07, 0.08, 145.00, 60.00, 20.90, 0.56);
INSERT INTO `food` VALUES (80, '小葱', 4, NULL, '每100g', 27.00, 1.60, 0.40, 4.90, 1.40, 70.00, 21.00, 0.49, 840.00, 0.05, 0.06, 0.40, 0.00, 18.00, 1.30, 72.00, 0.35, 0.06, 0.16, 143.00, 26.00, 10.40, 1.06);
INSERT INTO `food` VALUES (81, '青椒', 4, NULL, '每100g', 22.00, 0.80, 0.80, 0.30, 5.20, 2.20, 8.00, 59.00, 0.38, 98.00, 0.02, 0.62, 0.00, 15.00, 0.30, 11.00, 0.21, 0.05, 0.05, 154.00, 20.00, 7.00, 0.02);
INSERT INTO `food` VALUES (82, '洋葱', 4, NULL, '每100g', 40.00, 1.10, 0.20, 9.00, 0.90, 2.00, 8.00, 0.14, 20.00, 0.03, 0.03, 0.30, 0.00, 15.00, 0.60, 24.00, 0.23, 0.05, 0.14, 147.00, 39.00, 4.40, 0.92);
INSERT INTO `food` VALUES (83, '金针菇', 4, NULL, '每100g', 32.00, 2.40, 0.40, 6.00, 2.70, 3.00, 2.00, 1.14, 30.00, 0.15, 0.19, 4.10, 0.00, 17.00, 1.40, 0.00, 0.39, 0.14, 0.10, 195.00, 97.00, 4.30, 0.28);
INSERT INTO `food` VALUES (84, '苦瓜', 4, NULL, '每100g', 22.00, 1.00, 0.10, 4.90, 1.40, 8.00, 56.00, 0.85, 100.00, 0.03, 0.03, 0.40, 0.00, 18.00, 0.70, 14.00, 0.36, 0.06, 0.16, 256.00, 35.00, 2.50, 0.36);
INSERT INTO `food` VALUES (85, '丝瓜', 4, NULL, '每100g', 20.00, 1.30, 0.20, 4.00, 0.00, 13.00, 4.00, 0.08, 155.00, 0.02, 0.04, 32.00, 0.00, 19.00, 0.30, 37.00, 0.22, 0.05, 0.07, 121.00, 33.00, 3.70, 0.20);
INSERT INTO `food` VALUES (86, '莴笋', 4, NULL, '每100g', 15.00, 1.00, 0.10, 2.80, 0.60, 13.00, 4.00, 0.19, 150.00, 0.02, 0.02, 0.50, 0.00, 19.00, 0.90, 23.00, 0.33, 0.07, 0.19, 212.00, 48.00, 36.50, 0.54);
INSERT INTO `food` VALUES (87, '芹菜', 4, NULL, '每100g', 13.00, 1.40, 0.20, 1.80, 0.90, 32.00, 5.00, 0.32, 380.00, 0.01, 0.19, 1.00, 0.00, 16.00, 6.90, 38.00, 0.38, 0.10, 0.79, 212.00, 32.00, 40.90, 0.81);
INSERT INTO `food` VALUES (88, '韭菜', 4, NULL, '每100g', 25.00, 2.40, 0.40, 0.40, 4.50, 2.40, 133.00, 2.00, 0.57, 1596.00, 0.04, 0.05, 0.86, 0.00, 44.00, 24.00, 0.70, 0.25, 0.05, 0.21, 241.00, 45.00, 5.80);
INSERT INTO `food` VALUES (89, '娃娃菜', 4, NULL, '每100g', 13.00, 1.90, 0.20, 0.20, 2.40, 1.00, 4.00, 12.00, 0.00, 48.00, 0.04, 0.03, 0.61, 0.00, 17.00, 78.00, 0.40, 0.35, 0.03, 0.13, 278.00, 58.00, 0.16);
INSERT INTO `food` VALUES (90, '红萝卜', 4, NULL, '每100g', 22.00, 1.00, 0.10, 0.10, 4.60, 0.80, 0.00, 3.00, 1.20, 0.00, 0.05, 0.02, 0.00, 16.00, 11.00, 2.80, 0.69, 0.00, 0.06, 110.00, 26.00, 62.70, 0.00);
INSERT INTO `food` VALUES (91, '苹果', 5, NULL, '每100g', 53.00, 0.40, 0.20, 13.70, 1.70, 4.00, 3.00, 0.43, 50.00, 0.02, 0.02, 0.20, 0.00, 4.00, 0.30, 4.00, 0.04, 0.07, 0.03, 83.00, 7.00, 1.30, 0.10);
INSERT INTO `food` VALUES (92, '香蕉', 5, NULL, '每100g', 93.00, 1.40, 0.20, 22.00, 1.20, 5.00, 8.00, 0.24, 60.00, 0.02, 0.04, 0.70, 0.00, 43.00, 0.40, 7.00, 0.18, 0.14, 0.65, 256.00, 28.00, 0.80, 0.87);
INSERT INTO `food` VALUES (93, '西瓜', 5, NULL, '每100g', 31.00, 0.50, 0.30, 6.80, 0.20, 14.00, 5.70, 0.11, 173.00, 0.02, 0.04, 0.30, 0.00, 14.00, 0.40, 7.00, 0.09, 0.03, 0.03, 97.00, 12.00, 3.30, 0.09);
INSERT INTO `food` VALUES (94, '桃子', 5, NULL, '每100g', 42.00, 0.60, 0.10, 10.10, 1.00, 2.00, 10.00, 0.71, 20.00, 0.01, 0.02, 0.30, 0.00, 8.00, 0.30, 6.00, 0.14, 0.06, 0.07, 127.00, 11.00, 1.70, 0.47);
INSERT INTO `food` VALUES (95, '橙子', 5, NULL, '每100g', 48.00, 0.80, 0.20, 11.10, 0.60, 13.00, 33.00, 0.56, 160.00, 0.05, 0.04, 0.30, 0.00, 14.00, 0.40, 20.00, 0.14, 0.03, 0.05, 159.00, 22.00, 1.20, 0.31);
INSERT INTO `food` VALUES (96, '柚子', 5, NULL, '每100g', 42.00, 0.80, 0.20, 9.50, 0.40, 1.00, 23.00, 0.00, 10.00, 0.00, 0.03, 0.30, 0.00, 4.00, 0.30, 4.00, 0.40, 0.18, 0.08, 119.00, 24.00, 3.00, 0.70);
INSERT INTO `food` VALUES (97, '梨', 5, '2021110716323872110f3.JPG', '每100g', 51.00, 0.30, 0.10, 13.10, 2.60, 2.00, 5.00, 0.46, 20.00, 0.03, 0.03, 0.20, 0.00, 8.00, 0.40, 7.00, 0.10, 0.10, 0.06, 85.00, 14.00, 1.70, 0.29);
INSERT INTO `food` VALUES (98, '猕猴桃', 5, '202111071632386d88441.JPG', '每100g', 61.00, 0.80, 0.60, 14.50, 2.60, 11.00, 62.00, 2.43, 130.00, 0.05, 0.02, 0.30, 0.00, 12.00, 1.20, 27.00, 0.57, 1.87, 0.73, 144.00, 26.00, 10.00, 0.28);
INSERT INTO `food` VALUES (99, '橘子', 5, NULL, '每100g', 44.00, 0.80, 0.10, 10.20, 0.50, 41.00, 35.00, 1.22, 490.00, 0.04, 0.03, 0.20, 0.00, 14.00, 0.20, 24.00, 0.13, 0.11, 0.03, 128.00, 18.00, 0.80, 0.70);
INSERT INTO `food` VALUES (100, '火龙果', 5, '2021110716323872542f1.JPG', '每100g', 55.00, 1.10, 0.20, 13.30, 1.60, 0.00, 3.00, 0.14, 0.00, 0.03, 0.02, 0.22, 0.00, 30.00, 0.30, 7.00, 0.29, 0.04, 0.19, 20.00, 35.00, 2.70, 0.03);
INSERT INTO `food` VALUES (101, '菠萝', 5, NULL, '每100g', 44.00, 0.50, 0.10, 10.80, 1.30, 2.00, 18.00, 0.00, 20.00, 0.04, 0.02, 0.20, 0.00, 8.00, 0.60, 12.00, 0.14, 0.07, 1.04, 113.00, 9.00, 0.80, 0.24);
INSERT INTO `food` VALUES (102, '芒果', 5, '20211107163239d4f1a4c.JPG', '每100g', 35.00, 0.60, 0.20, 8.30, 1.30, 75.00, 23.00, 1.21, 897.00, 0.01, 0.04, 0.30, 0.00, 14.00, 0.20, 0.00, 0.09, 0.06, 0.20, 138.00, 11.00, 2.80, 1.44);
INSERT INTO `food` VALUES (103, '荔枝', 5, '20211107163239cf753f7.JPG', '每100g', 71.00, 0.90, 0.20, 16.60, 0.50, 1.00, 41.00, 0.00, 10.00, 0.10, 0.04, 1.10, 0.00, 12.00, 0.40, 2.00, 0.17, 0.16, 0.09, 151.00, 24.00, 1.70, 0.14);
INSERT INTO `food` VALUES (104, '西柚', 5, NULL, '每100g', 33.00, 0.70, 0.30, 7.80, 0.00, 24.00, 38.00, 0.00, 282.00, 0.05, 0.01, 0.20, 0.00, 9.00, 0.10, 21.00, 0.10, 0.00, 0.00, 60.00, 17.00, 7.00, 0.00);
INSERT INTO `food` VALUES (105, '酸奶', 6, NULL, '每100g', 70.00, 3.20, 1.90, 10.00, 0.00, 19.00, 1.00, 0.13, 0.00, 0.03, 0.14, 0.10, 15.00, 11.00, 0.20, 140.00, 0.54, 0.01, 0.02, 135.00, 90.00, 32.50, 1.19);
INSERT INTO `food` VALUES (106, '牛奶', 6, NULL, '每100g', 65.00, 3.30, 3.60, 4.90, 0.00, 54.00, 1.00, 0.13, 0.00, 0.03, 0.12, 0.10, 15.00, 11.00, 0.30, 107.00, 0.28, 0.02, 0.03, 109.00, 73.00, 37.20, 1.94);
INSERT INTO `food` VALUES (107, '奶酪', 6, '202111071632391d72442.JPG', '每100g', 328.00, 25.70, 23.50, 3.50, NULL, 152.00, NULL, 0.60, NULL, 0.06, 0.91, 0.60, 11.00, 57.00, 2.40, 799.00, 6.97, 0.13, 0.16, 75.00, 326.00, 584.60, 1.50);
INSERT INTO `food` VALUES (108, '酸奶（中脂）', 6, NULL, '每100g', 64.00, 2.70, 1.90, 9.00, NULL, 32.00, 1.00, 0.13, 0.00, 0.02, 0.13, 0.10, 12.00, 10.00, 0.40, 81.00, 0.68, 0.01, 0.01, 130.00, 59.00, 13.00, 0.74);
INSERT INTO `food` VALUES (109, '脱脂奶粉', 6, NULL, '每100g', 360.70, 36.20, 0.91, 51.16, 0.00, 2.40, 7.81, 0.00, 0.00, 0.21, 3.44, 0.74, 23.00, 114.00, 0.17, 1406.00, 4.00, 0.00, 0.00, 1758.00, 1039.00, 337.00, 0.00);
INSERT INTO `food` VALUES (110, '酸奶（果料）', 6, NULL, '每100g', 67.00, 3.10, 1.40, 10.40, 0.00, 19.00, 2.00, 0.69, 0.00, 0.03, 0.19, 0.10, 15.00, 11.00, 0.40, 140.00, 0.56, 0.04, 0.03, 111.00, 90.00, 32.50, 0.98);
INSERT INTO `food` VALUES (111, '早餐奶', 6, NULL, '每100g', 68.00, 2.30, 3.10, 7.70, NULL, 24.00, 1.00, 0.21, 0.00, 0.03, 0.14, 0.10, NULL, 11.00, 0.30, 120.00, 0.30, 0.00, 0.00, 109.00, 73.00, NULL, 1.90);
INSERT INTO `food` VALUES (112, '芝麻油', 7, NULL, '每100g', 898.00, 0.00, 99.70, 0.20, 0.00, 0.00, 0.00, 68.53, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 2.20, 9.00, 0.17, 0.05, 0.76, 0.00, 4.00, 1.10, 0.00);
INSERT INTO `food` VALUES (113, '色拉油', 7, NULL, '每100g', 898.00, 0.00, 99.80, 0.00, 0.00, 0.00, 0.00, 24.01, 0.00, 0.00, 0.00, 0.00, 64.00, 1.00, 1.70, 18.00, 0.23, 0.05, 0.01, 3.00, 1.00, 5.10, 0.00);
INSERT INTO `food` VALUES (114, '花生油', 7, NULL, '每100g', 899.00, 0.00, 99.90, 0.00, 0.00, 0.00, 0.00, 42.06, 0.00, 0.00, 0.00, 0.00, 0.00, 2.00, 2.90, 12.00, 0.48, 0.15, 0.33, 1.00, 15.00, 3.50, 0.00);
INSERT INTO `food` VALUES (115, '豆油', 7, NULL, '每100g', 899.00, 0.00, 99.90, 0.00, 0.00, 0.00, 0.00, 93.08, 0.00, 0.00, 0.00, 0.00, 0.00, 3.00, 2.00, 13.00, 1.09, 0.16, 0.43, 3.00, 6.00, 4.90, 0.00);
INSERT INTO `food` VALUES (116, '葵花籽油', 7, NULL, '每100g', 899.00, 0.00, 99.90, 0.00, NULL, NULL, NULL, 54.60, NULL, NULL, NULL, NULL, NULL, 4.00, 1.00, 2.00, 0.11, NULL, 0.02, 1.00, 4.00, 2.80, NULL);
INSERT INTO `food` VALUES (117, '橄榄油', 7, NULL, '每100g', 899.00, 0.00, 99.90, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.56, 0.10, 0.00, 0.00, 0.00, 1.00, 0.00, 2.00, 0.00);
INSERT INTO `food` VALUES (118, '瓜子仁', 8, NULL, '每100g', 615.00, 19.10, 53.40, 16.70, 4.50, NULL, 0.00, 79.06, 0.00, 1.89, 0.16, 0.50, 0.00, 287.00, 2.90, 115.00, 0.50, 0.56, 0.07, 547.00, 604.00, 5.00, 5.78);
INSERT INTO `food` VALUES (119, '黑芝麻', 8, '2021110716324062ef54e.JPG', '每100g', 559.00, 19.10, 46.10, 24.00, 14.00, 0.00, 0.00, 50.40, 0.00, 0.66, 0.25, 0.59, 0.00, 290.00, 22.70, 780.00, 6.13, 1.77, 17.85, 358.00, 516.00, 8.30, 4.70);
INSERT INTO `food` VALUES (120, '核桃（干）', 8, NULL, '每100g', 646.00, 14.90, 58.80, 19.10, 58.80, 19.10, 9.50, 3.00, 1.00, 43.21, 30.00, 0.15, 0.14, 0.90, 131.00, 0.00, 56.00, 2.70, 2.17, 1.17, 3.44, 385.00, 4.62);
INSERT INTO `food` VALUES (121, '炒花生', 8, NULL, '每100g', 601.00, 21.70, 48.00, 23.80, 6.30, 0.00, 12.90, 60.00, 0.13, 0.12, 18.90, 0.00, 171.10, 47.00, 2.03, 1.50, 0.68, 1.44, 563.00, 326.00, 34.80, 1.44, 3.90);
INSERT INTO `food` VALUES (122, '花生米', 8, NULL, '每100g', 589.00, 23.90, 44.40, 25.70, 4.30, 0.00, 0.00, 14.97, 0.00, 0.12, 0.10, 18.90, 0.00, 176.00, 6.90, 284.00, 2.82, 0.89, 1.70, 674.00, 315.00, 445.10, 7.10);
INSERT INTO `food` VALUES (123, '杏仁', 8, NULL, '每100g', 578.00, 22.50, 45.50, 23.90, 8.00, 0.00, 26.00, 18.53, 0.00, 0.08, 0.56, 0.00, 0.00, 178.00, 2.20, 97.00, 4.30, 0.80, 0.77, 106.00, 27.00, 8.30, 15.65);
INSERT INTO `food` VALUES (124, '蜂蜜', 9, '20211107163240f8793fa.JPG', '每100g', 321.00, 0.40, 1.90, 75.60, 0.00, 0.00, 3.00, 0.00, 0.00, 0.00, 0.05, 0.10, 0.00, 2.00, 1.00, 4.00, 0.37, 0.03, 0.07, 28.00, 3.00, 0.30, 0.15);
INSERT INTO `food` VALUES (125, '白砂糖', 9, NULL, '每100g', 400.00, 0.00, 0.00, 99.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 3.00, 0.60, 20.00, 0.60, 0.04, 0.09, 5.00, 8.00, 0.40, NULL);
INSERT INTO `food` VALUES (126, '红糖', 9, NULL, '每100g', 389.00, 0.70, 0.00, 96.60, NULL, NULL, NULL, NULL, NULL, 0.01, NULL, 0.30, NULL, 54.00, 2.20, 157.00, 0.35, 0.15, 0.27, 240.00, 11.00, 18.30, 4.20);
INSERT INTO `food` VALUES (127, '榨菜', 9, NULL, '每100g', 33.00, 2.20, 0.30, 6.50, 2.10, 82.00, 2.00, NULL, 190.00, 0.03, 0.06, 0.50, NULL, 54.00, 3.90, 155.00, 0.63, 0.14, 0.35, 363.00, 41.00, 4252.60, 1.93);
INSERT INTO `food` VALUES (128, '酱油', 9, NULL, '每100g', 63.00, 5.60, 0.10, 10.10, 0.20, NULL, NULL, NULL, NULL, 0.05, 0.13, 1.70, NULL, 156.00, 1.17, 8.60, 0.06, 1.11, 337.00, 204.00, 5757.00, 1.39, NULL);
INSERT INTO `food` VALUES (129, '醋', 9, NULL, '每100g', 31.00, 2.10, 0.30, 4.90, NULL, NULL, NULL, NULL, NULL, 0.03, 0.05, 1.40, NULL, 13.00, 6.00, 17.00, 1.25, 0.04, 2.97, 351.00, 96.00, 262.10, 2.43);
INSERT INTO `food` VALUES (130, '饮用水', 10, NULL, '每100g', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `food` VALUES (131, '咖啡粉', 10, NULL, '每100g', 218.00, 12.20, 0.50, 41.10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `food` VALUES (132, '无糖美式咖啡', 10, NULL, '每100g', 1.00, 0.00, 0.00, 0.30, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.00, NULL);
INSERT INTO `food` VALUES (133, '矿泉水', 10, NULL, '每100g', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `food` VALUES (134, '啤酒', 10, '202111071632417300a0c.JPG', '每100g', 32.00, 0.40, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 0.15, 0.04, 1.10, 0.00, 6.00, 0.40, 13.00, 0.30, 0.01, 47.00, 12.00, 11.40, 0.64, 0.64);
INSERT INTO `food` VALUES (135, '柠檬汁', 10, NULL, '每100g', 27.00, 0.90, 0.20, 5.50, 0.00, NULL, 11.00, NULL, NULL, 0.01, 0.02, 0.10, NULL, 12.00, 0.10, 24.00, 0.09, 0.04, 0.06, 120.00, NULL, 1.20, 4.15);
INSERT INTO `food` VALUES (136, '枸杞', 12, NULL, '每100g', 258.00, 13.90, 1.50, 64.10, 16.90, 1625.00, 48.00, 1.86, 9750.00, 0.35, 0.46, 4.00, NULL, 96.00, 5.40, 60.00, 1.48, 0.98, 0.87, 434.00, 209.00, 252.10, 13.25);
INSERT INTO `food` VALUES (137, '葛根', 12, '2021110716324233d4e72.JPG', '每100g', 181.00, 1.50, 0.20, 45.60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `food` VALUES (138, '花粉（松油）', 12, '20211107163242a5c6515.JPG', '每100g', 379.70, 9.60, 7.70, 72.50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `food` VALUES (139, '花粉（荞麦）', 12, '20211107163243bb5da3a.JPG', '每100g', 353.00, 14.90, 4.20, 67.30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `food` VALUES (140, '冬虫夏草', 12, '20211107163243733a186.JPG', '每100g', 292.00, 20.90, 4.70, 61.60, 20.10, NULL, 2.00, NULL, NULL, 0.37, 0.70, 3.30, 84.00, 197.00, 4.87, 66.50, 1.54, 0.86, 595.00, 95.00, 264.00, 1.40, 0.56);

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
-- Table structure for sport
-- ----------------------------
DROP TABLE IF EXISTS `sport`;
CREATE TABLE `sport`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运动咨询' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sport
-- ----------------------------
INSERT INTO `sport` VALUES (1, '源于本', '<p><img src=\"http://vue.jierxm.com/20211209233423a9eb9b5773eb023580ca269efd81e5fa.jpeg\" alt=\"a9eb9b5773eb023580ca269efd81e5fa.jpeg\"></p>\n\n![7239e414a691cbdd53dc75030854c7d1.jpeg](http://vue.jierxm.com/202112092336267239e414a691cbdd53dc75030854c7d1.jpeg)![01bb58da69cf692038f4cdfd0889b406.jpeg](http://vue.jierxm.com/2021120923364501bb58da69cf692038f4cdfd0889b406.jpeg)![46d4a5d128c357e7018bd0d54fd78196.jpeg](http://vue.jierxm.com/2021120923384546d4a5d128c357e7018bd0d54fd78196.jpeg)', '2021-12-09 21:57:48', 'admin', '2021-12-09 23:39:02', 'admin', 0);
INSERT INTO `sport` VALUES (2, '源于“本质研究”的“未来生活”——花王以日式细腻美学融合尖端', '在连续几届的中国国际进口博览会（以下简称“进博会”）上，花王展台汇集尖端科技的新品首展都给观众留下了深刻的印象。今年花王依然不负众望，在展区的“未来生活”版块，集团最高端化妆品品牌“SENSAI丝光溢彩”将完成进博会的首秀。除此之外，凝聚集团最尖端科技的“Fine Fiber Technology”（超细纤维技术）的系列产品将再次带来新的惊喜。观众可在现场通过沉浸式的定制体验，领略在美妆领域花王基于“本质研究”创造“未来生活”的美丽智慧。\n![](http://img.danews.cc/upload/doc/20211103/618243ef7f557.png)\n“SENSAI丝光溢彩”以“THE SENSE AND SCIENCE OF JAPAN”为理念，融合日式细腻美学与尖端技术，打造水润、紧致而又光彩照人的丝柔美肌。品牌1983年诞生于欧洲，多年来“SENSAI丝光溢彩”以其独特配方受到40多个国家众多爱用者的青睐，品牌最具代表性的特色是其采用了源自日本的国宝级蚕丝——“小石丸蚕丝”中提取的精华。“小石丸蚕丝”这种高品质的名贵蚕丝质地非常纤细，轻盈却不失强韧感，拥有迷人的细腻美丽光泽。“SENSAI丝光溢彩”历经孜孜不倦的潜心研究，在不断的改良、融合、拓展中，最终开发了小石丸蚕丝EX*和小石丸蚕丝Royal™*等复合成分，让肌肤绽放如蚕丝般的丝柔光彩。此外，“SENSAI丝光溢彩”提倡日式内韧美学理念，采用日本独有的“Saho”护肤手法，实现“双重清洁、双重保湿”，在雅致的“美之仪式”中体验由内而外的细腻改变。\n\n　　*小石丸水解蚕丝等的复合成分\n![](http://img.danews.cc/upload/doc/20211103/618243ef9f890.png)\n### “Fine Fiber Technology”（超细纤维技术）再度重磅亮相，为中国消费者提供护肤新价值\n***往届进博会中备受瞩目的花王尖端技术——“Fine Fiber Technology”（超细纤维技术）打造全新护肤体验将再次亮相进博会，为中国消费者带来了基于此技术开创的更贴近现今日常生活习惯的护肤新价值。***', '2021-12-09 22:05:43', 'admin', NULL, NULL, 0);
INSERT INTO `sport` VALUES (3, 'vue引入markdown', '<h2 id=\"1、引入markdown\">1、引入markdown</h2>\n<pre><code class=\"language-js\">npm install mavon-editor --save\n</code></pre>\n<h2 id=\"2、在utils下创建markdownjs\">2、在utils下创建markdown.js</h2>\n<pre><code class=\"language-js\">// 引入markdown\nimport MarkDown from &quot;mavon-editor&quot;;\nimport Vue from &quot;vue&quot;;\nimport &#39;mavon-editor/dist/css/index.css&#39;;\n\nVue.use(MarkDown);\n</code></pre>\n<h2 id=\"3、在mainjs中引入markdownjs文件\">3、在main.js中引入markdown.js文件</h2>\n<pre><code class=\"language-js\">// 引入markdown\nimport &#39;@/utils/markdown&#39;;\n</code></pre>\n<h4 id=\"4、使用\">4、使用</h4>\n<pre><code class=\"language-html\">&lt;mavon-editor ref=&quot;md&quot; v-model=&quot;form.content&quot; :toolbars=&quot;toolbars&quot; @imgAdd=&quot;uploadImage&quot;/&gt;\n</code></pre>\n<pre><code class=\"language-js\">toolbars: {\n      bold: true, // 粗体\n      italic: true, // 斜体\n      header: true, // 标题\n      underline: true, // 下划线\n      quote: true, // 引用\n      ol: true, // 有序列表\n     ul: true, // 链接\n     imagelink: true, // 图片链接\n      code: true, // code\n      subfield: true, // 是否需要分栏\n     fullscreen: true, // 全屏编辑\n     /* 1.3.5 */\n     undo: true, // 上一步\n     trash: true, // 清空\n    /* 1.4.2 */\n    navigation: true // 导航目录\n};\n\nuploadImage(pos, $e) {\n    let formData = new FormData();\n    formData.append(&#39;file&#39;, $e);\n    this.$ajax.post(&#39;/tool/upload&#39;, formData).then((res) =&gt; {\n        this.$refs.md.$img2Url(pos, this.$qiniu + res.data.data);\n    });\n},\n</code></pre>\n<h5 id=\"5、内容回显\">5、内容回显</h5>\n<pre><code class=\"language-js\">cnpm install marked @^2.0.3 --s\n//在vue组件中引入\nimport marked from &#39;marked&#39;;\nthis.tableList = res.data.rows.filter(item =&gt; {\n    if (item.content &amp;&amp; item.content !== &#39;&#39;) {\n         item.content = marked(item.content);\n         item.remark = item.content;\n    }\n    return true;\n});\n\n// 内容会变成html格式\n&lt;template slot-scope=&quot;scope&quot;&gt;\n      &lt;div v-html=&quot;scope.row.content&quot;/&gt;\n&lt;/template&gt;\n</code></pre>\n## 6、代码高亮\n```js\ncnpm install highlight.js --save\n// 在utils下添加highlight.js\nimport Vue from \'vue\';\nimport hljs from \'highlight.js\';\n// 主题\nimport \'highlight.js/styles/atom-one-dark.css\';\n// 高亮指令\nVue.directive(\'hlzl\', (el) => {\n    let selectorAll = el.querySelectorAll(\'pre code\');\n    selectorAll.forEach((item) => {\n        hljs.highlightBlock(item);\n    });\n});\n// main.js中引入\n// 引入高亮\nimport \'@/utils/highlight\';\n\n/** html使用 */\n<div v-html=\"scope.row.content\" v-hlzl/>\n```', '2021-12-09 23:51:04', 'admin', '2021-12-10 00:24:45', 'admin', 0);

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
INSERT INTO `sys_menu` VALUES (7, '/sport/intorduction', 'fa fa-codepen', '运动咨询', 'sport/intorduction', 6, 1);
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
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$H4TnTlyPD6R/hvMj0sEzseqguWzt.GzI/TtJPLgXPdEDQRbUfPDde', '阿࿆杰࿆', 0, 'https://thirdwx.qlogo.cn/mmopen/vi_32/2WrOZ9pEI713zuYictHR3UtjicKPEkVXTpeQAGVBdRBtABR5Oe6wNuT4NMg6s7wgHTjxd70kiabibKM3klMn7nUT6g/132', '', 'ouZUv5NzKIFuaNNFYM0gRVozKEDU', 1, 1, '15523285128', NULL);
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
