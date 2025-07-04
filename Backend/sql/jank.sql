/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : jank

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 04/07/2025 20:49:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `address_id` int NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地址名称',
  `p_id` int NOT NULL COMMENT '父id',
  `level` int NULL DEFAULT NULL COMMENT '层级',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 480 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '北京市', 0, 1);
INSERT INTO `address` VALUES (2, '天津市', 0, 1);
INSERT INTO `address` VALUES (3, '河北省', 0, 1);
INSERT INTO `address` VALUES (4, '山西省', 0, 1);
INSERT INTO `address` VALUES (5, '内蒙古自治区', 0, 1);
INSERT INTO `address` VALUES (6, '辽宁省', 0, 1);
INSERT INTO `address` VALUES (7, '吉林省', 0, 1);
INSERT INTO `address` VALUES (8, '黑龙江省', 0, 1);
INSERT INTO `address` VALUES (9, '上海市', 0, 1);
INSERT INTO `address` VALUES (10, '江苏省', 0, 1);
INSERT INTO `address` VALUES (11, '浙江省', 0, 1);
INSERT INTO `address` VALUES (12, '安徽省', 0, 1);
INSERT INTO `address` VALUES (13, '福建省', 0, 1);
INSERT INTO `address` VALUES (14, '江西省', 0, 1);
INSERT INTO `address` VALUES (15, '山东省', 0, 1);
INSERT INTO `address` VALUES (16, '河南省', 0, 1);
INSERT INTO `address` VALUES (17, '湖北省', 0, 1);
INSERT INTO `address` VALUES (18, '湖南省', 0, 1);
INSERT INTO `address` VALUES (19, '广东省', 0, 1);
INSERT INTO `address` VALUES (20, '广西壮族自治区', 0, 1);
INSERT INTO `address` VALUES (21, '海南省', 0, 1);
INSERT INTO `address` VALUES (22, '重庆市', 0, 1);
INSERT INTO `address` VALUES (23, '四川省', 0, 1);
INSERT INTO `address` VALUES (24, '贵州省', 0, 1);
INSERT INTO `address` VALUES (25, '云南省', 0, 1);
INSERT INTO `address` VALUES (26, '西藏自治区', 0, 1);
INSERT INTO `address` VALUES (27, '陕西省', 0, 1);
INSERT INTO `address` VALUES (28, '甘肃省', 0, 1);
INSERT INTO `address` VALUES (29, '青海省', 0, 1);
INSERT INTO `address` VALUES (30, '宁夏回族自治区', 0, 1);
INSERT INTO `address` VALUES (31, '新疆维吾尔自治区', 0, 1);
INSERT INTO `address` VALUES (32, '台湾省', 0, 1);
INSERT INTO `address` VALUES (33, '香港特别行政区', 0, 1);
INSERT INTO `address` VALUES (34, '澳门特别行政区', 0, 1);
INSERT INTO `address` VALUES (35, '市辖区', 1, 2);
INSERT INTO `address` VALUES (36, '县', 1, 2);
INSERT INTO `address` VALUES (37, '市辖区', 2, 2);
INSERT INTO `address` VALUES (38, '县', 2, 2);
INSERT INTO `address` VALUES (39, '石家庄市', 3, 2);
INSERT INTO `address` VALUES (40, '唐山市', 3, 2);
INSERT INTO `address` VALUES (41, '秦皇岛市', 3, 2);
INSERT INTO `address` VALUES (42, '邯郸市', 3, 2);
INSERT INTO `address` VALUES (43, '邢台市', 3, 2);
INSERT INTO `address` VALUES (44, '保定市', 3, 2);
INSERT INTO `address` VALUES (45, '张家口市', 3, 2);
INSERT INTO `address` VALUES (46, '承德市', 3, 2);
INSERT INTO `address` VALUES (47, '沧州市', 3, 2);
INSERT INTO `address` VALUES (48, '廊坊市', 3, 2);
INSERT INTO `address` VALUES (49, '衡水市', 3, 2);
INSERT INTO `address` VALUES (50, '太原市', 4, 2);
INSERT INTO `address` VALUES (51, '大同市', 4, 2);
INSERT INTO `address` VALUES (52, '阳泉市', 4, 2);
INSERT INTO `address` VALUES (53, '长治市', 4, 2);
INSERT INTO `address` VALUES (54, '晋城市', 4, 2);
INSERT INTO `address` VALUES (55, '朔州市', 4, 2);
INSERT INTO `address` VALUES (56, '晋中市', 4, 2);
INSERT INTO `address` VALUES (57, '运城市', 4, 2);
INSERT INTO `address` VALUES (58, '忻州市', 4, 2);
INSERT INTO `address` VALUES (59, '临汾市', 4, 2);
INSERT INTO `address` VALUES (60, '吕梁市', 4, 2);
INSERT INTO `address` VALUES (61, '呼和浩特市', 5, 2);
INSERT INTO `address` VALUES (62, '包头市', 5, 2);
INSERT INTO `address` VALUES (63, '乌海市', 5, 2);
INSERT INTO `address` VALUES (64, '赤峰市', 5, 2);
INSERT INTO `address` VALUES (65, '通辽市', 5, 2);
INSERT INTO `address` VALUES (66, '鄂尔多斯市', 5, 2);
INSERT INTO `address` VALUES (67, '呼伦贝尔市', 5, 2);
INSERT INTO `address` VALUES (68, '巴彦淖尔市', 5, 2);
INSERT INTO `address` VALUES (69, '乌兰察布市', 5, 2);
INSERT INTO `address` VALUES (70, '兴安盟', 5, 2);
INSERT INTO `address` VALUES (71, '锡林郭勒盟', 5, 2);
INSERT INTO `address` VALUES (72, '阿拉善盟', 5, 2);
INSERT INTO `address` VALUES (73, '沈阳市', 6, 2);
INSERT INTO `address` VALUES (74, '大连市', 6, 2);
INSERT INTO `address` VALUES (75, '鞍山市', 6, 2);
INSERT INTO `address` VALUES (76, '抚顺市', 6, 2);
INSERT INTO `address` VALUES (77, '本溪市', 6, 2);
INSERT INTO `address` VALUES (78, '丹东市', 6, 2);
INSERT INTO `address` VALUES (79, '锦州市', 6, 2);
INSERT INTO `address` VALUES (80, '营口市', 6, 2);
INSERT INTO `address` VALUES (81, '阜新市', 6, 2);
INSERT INTO `address` VALUES (82, '辽阳市', 6, 2);
INSERT INTO `address` VALUES (83, '盘锦市', 6, 2);
INSERT INTO `address` VALUES (84, '铁岭市', 6, 2);
INSERT INTO `address` VALUES (85, '朝阳市', 6, 2);
INSERT INTO `address` VALUES (86, '葫芦岛市', 6, 2);
INSERT INTO `address` VALUES (87, '长春市', 7, 2);
INSERT INTO `address` VALUES (88, '吉林市', 7, 2);
INSERT INTO `address` VALUES (89, '四平市', 7, 2);
INSERT INTO `address` VALUES (90, '辽源市', 7, 2);
INSERT INTO `address` VALUES (91, '通化市', 7, 2);
INSERT INTO `address` VALUES (92, '白山市', 7, 2);
INSERT INTO `address` VALUES (93, '松原市', 7, 2);
INSERT INTO `address` VALUES (94, '白城市', 7, 2);
INSERT INTO `address` VALUES (95, '延边朝鲜族自治州', 7, 2);
INSERT INTO `address` VALUES (96, '哈尔滨市', 8, 2);
INSERT INTO `address` VALUES (97, '齐齐哈尔市', 8, 2);
INSERT INTO `address` VALUES (98, '鸡西市', 8, 2);
INSERT INTO `address` VALUES (99, '鹤岗市', 8, 2);
INSERT INTO `address` VALUES (100, '双鸭山市', 8, 2);
INSERT INTO `address` VALUES (101, '大庆市', 8, 2);
INSERT INTO `address` VALUES (102, '伊春市', 8, 2);
INSERT INTO `address` VALUES (103, '佳木斯市', 8, 2);
INSERT INTO `address` VALUES (104, '七台河市', 8, 2);
INSERT INTO `address` VALUES (105, '牡丹江市', 8, 2);
INSERT INTO `address` VALUES (106, '黑河市', 8, 2);
INSERT INTO `address` VALUES (107, '绥化市', 8, 2);
INSERT INTO `address` VALUES (108, '大兴安岭地区', 8, 2);
INSERT INTO `address` VALUES (109, '市辖区', 9, 2);
INSERT INTO `address` VALUES (110, '县', 9, 2);
INSERT INTO `address` VALUES (111, '南京市', 10, 2);
INSERT INTO `address` VALUES (112, '无锡市', 10, 2);
INSERT INTO `address` VALUES (113, '徐州市', 10, 2);
INSERT INTO `address` VALUES (114, '常州市', 10, 2);
INSERT INTO `address` VALUES (115, '苏州市', 10, 2);
INSERT INTO `address` VALUES (116, '南通市', 10, 2);
INSERT INTO `address` VALUES (117, '连云港市', 10, 2);
INSERT INTO `address` VALUES (118, '淮安市', 10, 2);
INSERT INTO `address` VALUES (119, '盐城市', 10, 2);
INSERT INTO `address` VALUES (120, '扬州市', 10, 2);
INSERT INTO `address` VALUES (121, '镇江市', 10, 2);
INSERT INTO `address` VALUES (122, '泰州市', 10, 2);
INSERT INTO `address` VALUES (123, '宿迁市', 10, 2);
INSERT INTO `address` VALUES (124, '杭州市', 11, 2);
INSERT INTO `address` VALUES (125, '宁波市', 11, 2);
INSERT INTO `address` VALUES (126, '温州市', 11, 2);
INSERT INTO `address` VALUES (127, '嘉兴市', 11, 2);
INSERT INTO `address` VALUES (128, '湖州市', 11, 2);
INSERT INTO `address` VALUES (129, '绍兴市', 11, 2);
INSERT INTO `address` VALUES (130, '金华市', 11, 2);
INSERT INTO `address` VALUES (131, '衢州市', 11, 2);
INSERT INTO `address` VALUES (132, '舟山市', 11, 2);
INSERT INTO `address` VALUES (133, '台州市', 11, 2);
INSERT INTO `address` VALUES (134, '丽水市', 11, 2);
INSERT INTO `address` VALUES (135, '合肥市', 12, 2);
INSERT INTO `address` VALUES (136, '芜湖市', 12, 2);
INSERT INTO `address` VALUES (137, '蚌埠市', 12, 2);
INSERT INTO `address` VALUES (138, '淮南市', 12, 2);
INSERT INTO `address` VALUES (139, '马鞍山市', 12, 2);
INSERT INTO `address` VALUES (140, '淮北市', 12, 2);
INSERT INTO `address` VALUES (141, '铜陵市', 12, 2);
INSERT INTO `address` VALUES (142, '安庆市', 12, 2);
INSERT INTO `address` VALUES (143, '黄山市', 12, 2);
INSERT INTO `address` VALUES (144, '滁州市', 12, 2);
INSERT INTO `address` VALUES (145, '阜阳市', 12, 2);
INSERT INTO `address` VALUES (146, '宿州市', 12, 2);
INSERT INTO `address` VALUES (147, '六安市', 12, 2);
INSERT INTO `address` VALUES (148, '亳州市', 12, 2);
INSERT INTO `address` VALUES (149, '池州市', 12, 2);
INSERT INTO `address` VALUES (150, '宣城市', 12, 2);
INSERT INTO `address` VALUES (151, '福州市', 13, 2);
INSERT INTO `address` VALUES (152, '厦门市', 13, 2);
INSERT INTO `address` VALUES (153, '莆田市', 13, 2);
INSERT INTO `address` VALUES (154, '三明市', 13, 2);
INSERT INTO `address` VALUES (155, '泉州市', 13, 2);
INSERT INTO `address` VALUES (156, '漳州市', 13, 2);
INSERT INTO `address` VALUES (157, '南平市', 13, 2);
INSERT INTO `address` VALUES (158, '龙岩市', 13, 2);
INSERT INTO `address` VALUES (159, '宁德市', 13, 2);
INSERT INTO `address` VALUES (160, '南昌市', 14, 2);
INSERT INTO `address` VALUES (161, '景德镇市', 14, 2);
INSERT INTO `address` VALUES (162, '萍乡市', 14, 2);
INSERT INTO `address` VALUES (163, '九江市', 14, 2);
INSERT INTO `address` VALUES (164, '新余市', 14, 2);
INSERT INTO `address` VALUES (165, '鹰潭市', 14, 2);
INSERT INTO `address` VALUES (166, '赣州市', 14, 2);
INSERT INTO `address` VALUES (167, '吉安市', 14, 2);
INSERT INTO `address` VALUES (168, '宜春市', 14, 2);
INSERT INTO `address` VALUES (169, '抚州市', 14, 2);
INSERT INTO `address` VALUES (170, '上饶市', 14, 2);
INSERT INTO `address` VALUES (171, '济南市', 15, 2);
INSERT INTO `address` VALUES (172, '青岛市', 15, 2);
INSERT INTO `address` VALUES (173, '淄博市', 15, 2);
INSERT INTO `address` VALUES (174, '枣庄市', 15, 2);
INSERT INTO `address` VALUES (175, '东营市', 15, 2);
INSERT INTO `address` VALUES (176, '烟台市', 15, 2);
INSERT INTO `address` VALUES (177, '潍坊市', 15, 2);
INSERT INTO `address` VALUES (178, '济宁市', 15, 2);
INSERT INTO `address` VALUES (179, '泰安市', 15, 2);
INSERT INTO `address` VALUES (180, '威海市', 15, 2);
INSERT INTO `address` VALUES (181, '日照市', 15, 2);
INSERT INTO `address` VALUES (182, '莱芜市', 15, 2);
INSERT INTO `address` VALUES (183, '临沂市', 15, 2);
INSERT INTO `address` VALUES (184, '德州市', 15, 2);
INSERT INTO `address` VALUES (185, '聊城市', 15, 2);
INSERT INTO `address` VALUES (186, '滨州市', 15, 2);
INSERT INTO `address` VALUES (187, '菏泽市', 15, 2);
INSERT INTO `address` VALUES (188, '郑州市', 16, 2);
INSERT INTO `address` VALUES (189, '开封市', 16, 2);
INSERT INTO `address` VALUES (190, '洛阳市', 16, 2);
INSERT INTO `address` VALUES (191, '平顶山市', 16, 2);
INSERT INTO `address` VALUES (192, '安阳市', 16, 2);
INSERT INTO `address` VALUES (193, '鹤壁市', 16, 2);
INSERT INTO `address` VALUES (194, '新乡市', 16, 2);
INSERT INTO `address` VALUES (195, '焦作市', 16, 2);
INSERT INTO `address` VALUES (196, '濮阳市', 16, 2);
INSERT INTO `address` VALUES (197, '许昌市', 16, 2);
INSERT INTO `address` VALUES (198, '漯河市', 16, 2);
INSERT INTO `address` VALUES (199, '三门峡市', 16, 2);
INSERT INTO `address` VALUES (200, '南阳市', 16, 2);
INSERT INTO `address` VALUES (201, '商丘市', 16, 2);
INSERT INTO `address` VALUES (202, '信阳市', 16, 2);
INSERT INTO `address` VALUES (203, '周口市', 16, 2);
INSERT INTO `address` VALUES (204, '驻马店市', 16, 2);
INSERT INTO `address` VALUES (205, '济源市', 16, 2);
INSERT INTO `address` VALUES (206, '武汉市', 17, 2);
INSERT INTO `address` VALUES (207, '黄石市', 17, 2);
INSERT INTO `address` VALUES (208, '十堰市', 17, 2);
INSERT INTO `address` VALUES (209, '宜昌市', 17, 2);
INSERT INTO `address` VALUES (210, '襄阳市', 17, 2);
INSERT INTO `address` VALUES (211, '鄂州市', 17, 2);
INSERT INTO `address` VALUES (212, '荆门市', 17, 2);
INSERT INTO `address` VALUES (213, '孝感市', 17, 2);
INSERT INTO `address` VALUES (214, '荆州市', 17, 2);
INSERT INTO `address` VALUES (215, '黄冈市', 17, 2);
INSERT INTO `address` VALUES (216, '咸宁市', 17, 2);
INSERT INTO `address` VALUES (217, '随州市', 17, 2);
INSERT INTO `address` VALUES (218, '恩施土家族苗族自治州', 17, 2);
INSERT INTO `address` VALUES (219, '省直辖县级行政区划', 17, 2);
INSERT INTO `address` VALUES (220, '长沙市', 18, 2);
INSERT INTO `address` VALUES (221, '株洲市', 18, 2);
INSERT INTO `address` VALUES (222, '湘潭市', 18, 2);
INSERT INTO `address` VALUES (223, '衡阳市', 18, 2);
INSERT INTO `address` VALUES (224, '邵阳市', 18, 2);
INSERT INTO `address` VALUES (225, '岳阳市', 18, 2);
INSERT INTO `address` VALUES (226, '常德市', 18, 2);
INSERT INTO `address` VALUES (227, '张家界市', 18, 2);
INSERT INTO `address` VALUES (228, '益阳市', 18, 2);
INSERT INTO `address` VALUES (229, '郴州市', 18, 2);
INSERT INTO `address` VALUES (230, '永州市', 18, 2);
INSERT INTO `address` VALUES (231, '怀化市', 18, 2);
INSERT INTO `address` VALUES (232, '娄底市', 18, 2);
INSERT INTO `address` VALUES (233, '湘西土家族苗族自治州', 18, 2);
INSERT INTO `address` VALUES (234, '广州市', 19, 2);
INSERT INTO `address` VALUES (235, '韶关市', 19, 2);
INSERT INTO `address` VALUES (236, '深圳市', 19, 2);
INSERT INTO `address` VALUES (237, '珠海市', 19, 2);
INSERT INTO `address` VALUES (238, '汕头市', 19, 2);
INSERT INTO `address` VALUES (239, '佛山市', 19, 2);
INSERT INTO `address` VALUES (240, '江门市', 19, 2);
INSERT INTO `address` VALUES (241, '湛江市', 19, 2);
INSERT INTO `address` VALUES (242, '茂名市', 19, 2);
INSERT INTO `address` VALUES (243, '肇庆市', 19, 2);
INSERT INTO `address` VALUES (244, '惠州市', 19, 2);
INSERT INTO `address` VALUES (245, '梅州市', 19, 2);
INSERT INTO `address` VALUES (246, '汕尾市', 19, 2);
INSERT INTO `address` VALUES (247, '河源市', 19, 2);
INSERT INTO `address` VALUES (248, '阳江市', 19, 2);
INSERT INTO `address` VALUES (249, '清远市', 19, 2);
INSERT INTO `address` VALUES (250, '东莞市', 19, 2);
INSERT INTO `address` VALUES (251, '中山市', 19, 2);
INSERT INTO `address` VALUES (252, '潮州市', 19, 2);
INSERT INTO `address` VALUES (253, '揭阳市', 19, 2);
INSERT INTO `address` VALUES (254, '云浮市', 19, 2);
INSERT INTO `address` VALUES (255, '南宁市', 20, 2);
INSERT INTO `address` VALUES (256, '柳州市', 20, 2);
INSERT INTO `address` VALUES (257, '桂林市', 20, 2);
INSERT INTO `address` VALUES (258, '梧州市', 20, 2);
INSERT INTO `address` VALUES (259, '北海市', 20, 2);
INSERT INTO `address` VALUES (260, '防城港市', 20, 2);
INSERT INTO `address` VALUES (261, '钦州市', 20, 2);
INSERT INTO `address` VALUES (262, '贵港市', 20, 2);
INSERT INTO `address` VALUES (263, '玉林市', 20, 2);
INSERT INTO `address` VALUES (264, '百色市', 20, 2);
INSERT INTO `address` VALUES (265, '贺州市', 20, 2);
INSERT INTO `address` VALUES (266, '河池市', 20, 2);
INSERT INTO `address` VALUES (267, '来宾市', 20, 2);
INSERT INTO `address` VALUES (268, '崇左市', 20, 2);
INSERT INTO `address` VALUES (269, '海口市', 21, 2);
INSERT INTO `address` VALUES (270, '三亚市', 21, 2);
INSERT INTO `address` VALUES (271, '三沙市', 21, 2);
INSERT INTO `address` VALUES (272, '儋州市', 21, 2);
INSERT INTO `address` VALUES (273, '省直辖县级行政区划', 21, 2);
INSERT INTO `address` VALUES (274, '市辖区', 22, 2);
INSERT INTO `address` VALUES (275, '县', 22, 2);
INSERT INTO `address` VALUES (276, '成都市', 23, 2);
INSERT INTO `address` VALUES (277, '自贡市', 23, 2);
INSERT INTO `address` VALUES (278, '攀枝花市', 23, 2);
INSERT INTO `address` VALUES (279, '泸州市', 23, 2);
INSERT INTO `address` VALUES (280, '德阳市', 23, 2);
INSERT INTO `address` VALUES (281, '绵阳市', 23, 2);
INSERT INTO `address` VALUES (282, '广元市', 23, 2);
INSERT INTO `address` VALUES (283, '遂宁市', 23, 2);
INSERT INTO `address` VALUES (284, '内江市', 23, 2);
INSERT INTO `address` VALUES (285, '乐山市', 23, 2);
INSERT INTO `address` VALUES (286, '南充市', 23, 2);
INSERT INTO `address` VALUES (287, '眉山市', 23, 2);
INSERT INTO `address` VALUES (288, '宜宾市', 23, 2);
INSERT INTO `address` VALUES (289, '广安市', 23, 2);
INSERT INTO `address` VALUES (290, '达州市', 23, 2);
INSERT INTO `address` VALUES (291, '雅安市', 23, 2);
INSERT INTO `address` VALUES (292, '巴中市', 23, 2);
INSERT INTO `address` VALUES (293, '资阳市', 23, 2);
INSERT INTO `address` VALUES (294, '阿坝藏族羌族自治州', 23, 2);
INSERT INTO `address` VALUES (295, '甘孜藏族自治州', 23, 2);
INSERT INTO `address` VALUES (296, '凉山彝族自治州', 23, 2);
INSERT INTO `address` VALUES (297, '贵阳市', 24, 2);
INSERT INTO `address` VALUES (298, '六盘水市', 24, 2);
INSERT INTO `address` VALUES (299, '遵义市', 24, 2);
INSERT INTO `address` VALUES (300, '安顺市', 24, 2);
INSERT INTO `address` VALUES (301, '毕节市', 24, 2);
INSERT INTO `address` VALUES (302, '铜仁市', 24, 2);
INSERT INTO `address` VALUES (303, '黔西南布依族苗族自治州', 24, 2);
INSERT INTO `address` VALUES (304, '黔东南苗族侗族自治州', 24, 2);
INSERT INTO `address` VALUES (305, '黔南布依族苗族自治州', 24, 2);
INSERT INTO `address` VALUES (306, '昆明市', 25, 2);
INSERT INTO `address` VALUES (307, '曲靖市', 25, 2);
INSERT INTO `address` VALUES (308, '玉溪市', 25, 2);
INSERT INTO `address` VALUES (309, '保山市', 25, 2);
INSERT INTO `address` VALUES (310, '昭通市', 25, 2);
INSERT INTO `address` VALUES (311, '丽江市', 25, 2);
INSERT INTO `address` VALUES (312, '普洱市', 25, 2);
INSERT INTO `address` VALUES (313, '临沧市', 25, 2);
INSERT INTO `address` VALUES (314, '楚雄彝族自治州', 25, 2);
INSERT INTO `address` VALUES (315, '红河哈尼族彝族自治州', 25, 2);
INSERT INTO `address` VALUES (316, '文山壮族苗族自治州', 25, 2);
INSERT INTO `address` VALUES (317, '西双版纳傣族自治州', 25, 2);
INSERT INTO `address` VALUES (318, '大理白族自治州', 25, 2);
INSERT INTO `address` VALUES (319, '德宏傣族景颇族自治州', 25, 2);
INSERT INTO `address` VALUES (320, '怒江傈僳族自治州', 25, 2);
INSERT INTO `address` VALUES (321, '迪庆藏族自治州', 25, 2);
INSERT INTO `address` VALUES (322, '拉萨市', 26, 2);
INSERT INTO `address` VALUES (323, '日喀则市', 26, 2);
INSERT INTO `address` VALUES (324, '昌都市', 26, 2);
INSERT INTO `address` VALUES (325, '林芝市', 26, 2);
INSERT INTO `address` VALUES (326, '山南市', 26, 2);
INSERT INTO `address` VALUES (327, '那曲市', 26, 2);
INSERT INTO `address` VALUES (328, '阿里地区', 26, 2);
INSERT INTO `address` VALUES (329, '西安市', 27, 2);
INSERT INTO `address` VALUES (330, '铜川市', 27, 2);
INSERT INTO `address` VALUES (331, '宝鸡市', 27, 2);
INSERT INTO `address` VALUES (332, '咸阳市', 27, 2);
INSERT INTO `address` VALUES (333, '渭南市', 27, 2);
INSERT INTO `address` VALUES (334, '延安市', 27, 2);
INSERT INTO `address` VALUES (335, '汉中市', 27, 2);
INSERT INTO `address` VALUES (336, '榆林市', 27, 2);
INSERT INTO `address` VALUES (337, '安康市', 27, 2);
INSERT INTO `address` VALUES (338, '商洛市', 27, 2);
INSERT INTO `address` VALUES (339, '兰州市', 28, 2);
INSERT INTO `address` VALUES (340, '嘉峪关市', 28, 2);
INSERT INTO `address` VALUES (341, '金昌市', 28, 2);
INSERT INTO `address` VALUES (342, '白银市', 28, 2);
INSERT INTO `address` VALUES (343, '天水市', 28, 2);
INSERT INTO `address` VALUES (344, '武威市', 28, 2);
INSERT INTO `address` VALUES (345, '张掖市', 28, 2);
INSERT INTO `address` VALUES (346, '平凉市', 28, 2);
INSERT INTO `address` VALUES (347, '酒泉市', 28, 2);
INSERT INTO `address` VALUES (348, '庆阳市', 28, 2);
INSERT INTO `address` VALUES (349, '定西市', 28, 2);
INSERT INTO `address` VALUES (350, '陇南市', 28, 2);
INSERT INTO `address` VALUES (351, '临夏回族自治州', 28, 2);
INSERT INTO `address` VALUES (352, '甘南藏族自治州', 28, 2);
INSERT INTO `address` VALUES (353, '西宁市', 29, 2);
INSERT INTO `address` VALUES (354, '海东市', 29, 2);
INSERT INTO `address` VALUES (355, '海北藏族自治州', 29, 2);
INSERT INTO `address` VALUES (356, '黄南藏族自治州', 29, 2);
INSERT INTO `address` VALUES (357, '海南藏族自治州', 29, 2);
INSERT INTO `address` VALUES (358, '果洛藏族自治州', 29, 2);
INSERT INTO `address` VALUES (359, '玉树藏族自治州', 29, 2);
INSERT INTO `address` VALUES (360, '海西蒙古族藏族自治州', 29, 2);
INSERT INTO `address` VALUES (361, '银川市', 30, 2);
INSERT INTO `address` VALUES (362, '石嘴山市', 30, 2);
INSERT INTO `address` VALUES (363, '吴忠市', 30, 2);
INSERT INTO `address` VALUES (364, '固原市', 30, 2);
INSERT INTO `address` VALUES (365, '中卫市', 30, 2);
INSERT INTO `address` VALUES (366, '乌鲁木齐市', 31, 2);
INSERT INTO `address` VALUES (367, '克拉玛依市', 31, 2);
INSERT INTO `address` VALUES (368, '吐鲁番市', 31, 2);
INSERT INTO `address` VALUES (369, '哈密市', 31, 2);
INSERT INTO `address` VALUES (370, '昌吉回族自治州', 31, 2);
INSERT INTO `address` VALUES (371, '博尔塔拉蒙古自治州', 31, 2);
INSERT INTO `address` VALUES (372, '巴音郭楞蒙古自治州', 31, 2);
INSERT INTO `address` VALUES (373, '阿克苏地区', 31, 2);
INSERT INTO `address` VALUES (374, '克孜勒苏柯尔克孜自治州', 31, 2);
INSERT INTO `address` VALUES (375, '喀什地区', 31, 2);
INSERT INTO `address` VALUES (376, '和田地区', 31, 2);
INSERT INTO `address` VALUES (377, '伊犁哈萨克自治州', 31, 2);
INSERT INTO `address` VALUES (378, '塔城地区', 31, 2);
INSERT INTO `address` VALUES (379, '阿勒泰地区', 31, 2);
INSERT INTO `address` VALUES (380, '自治区直辖县级行政区划', 31, 2);
INSERT INTO `address` VALUES (381, '台北市', 32, 2);
INSERT INTO `address` VALUES (382, '高雄市', 32, 2);
INSERT INTO `address` VALUES (383, '新北市', 32, 2);
INSERT INTO `address` VALUES (384, '台中市', 32, 2);
INSERT INTO `address` VALUES (385, '台南市', 32, 2);
INSERT INTO `address` VALUES (386, '新竹市', 32, 2);
INSERT INTO `address` VALUES (387, '嘉义市', 32, 2);
INSERT INTO `address` VALUES (388, '新竹县', 32, 2);
INSERT INTO `address` VALUES (389, '苗栗县', 32, 2);
INSERT INTO `address` VALUES (390, '彰化县', 32, 2);
INSERT INTO `address` VALUES (391, '南投县', 32, 2);
INSERT INTO `address` VALUES (392, '云林县', 32, 2);
INSERT INTO `address` VALUES (393, '嘉义县', 32, 2);
INSERT INTO `address` VALUES (394, '屏东县', 32, 2);
INSERT INTO `address` VALUES (395, '宜兰县', 32, 2);
INSERT INTO `address` VALUES (396, '花莲县', 32, 2);
INSERT INTO `address` VALUES (397, '台东县', 32, 2);
INSERT INTO `address` VALUES (398, '澎湖县', 32, 2);
INSERT INTO `address` VALUES (399, '金门县', 32, 2);
INSERT INTO `address` VALUES (400, '连江县', 32, 2);
INSERT INTO `address` VALUES (401, '香港岛', 33, 2);
INSERT INTO `address` VALUES (402, '九龙', 33, 2);
INSERT INTO `address` VALUES (403, '新界', 33, 2);
INSERT INTO `address` VALUES (404, '澳门半岛', 34, 2);
INSERT INTO `address` VALUES (405, '凼仔', 34, 2);
INSERT INTO `address` VALUES (406, '路环', 34, 2);
INSERT INTO `address` VALUES (407, '东城区', 35, 3);
INSERT INTO `address` VALUES (408, '西城区', 35, 3);
INSERT INTO `address` VALUES (409, '朝阳区', 35, 3);
INSERT INTO `address` VALUES (410, '丰台区', 35, 3);
INSERT INTO `address` VALUES (411, '石景山区', 35, 3);
INSERT INTO `address` VALUES (412, '海淀区', 35, 3);
INSERT INTO `address` VALUES (413, '门头沟区', 35, 3);
INSERT INTO `address` VALUES (414, '房山区', 35, 3);
INSERT INTO `address` VALUES (415, '通州区', 35, 3);
INSERT INTO `address` VALUES (416, '顺义区', 35, 3);
INSERT INTO `address` VALUES (417, '昌平区', 35, 3);
INSERT INTO `address` VALUES (418, '大兴区', 35, 3);
INSERT INTO `address` VALUES (419, '怀柔区', 35, 3);
INSERT INTO `address` VALUES (420, '平谷区', 35, 3);
INSERT INTO `address` VALUES (421, '密云区', 35, 3);
INSERT INTO `address` VALUES (422, '延庆区', 35, 3);
INSERT INTO `address` VALUES (423, '密云县', 36, 3);
INSERT INTO `address` VALUES (424, '延庆县', 36, 3);
INSERT INTO `address` VALUES (425, '和平区', 37, 3);
INSERT INTO `address` VALUES (426, '河东区', 37, 3);
INSERT INTO `address` VALUES (427, '河西区', 37, 3);
INSERT INTO `address` VALUES (428, '南开区', 37, 3);
INSERT INTO `address` VALUES (429, '河北区', 37, 3);
INSERT INTO `address` VALUES (430, '红桥区', 37, 3);
INSERT INTO `address` VALUES (431, '东丽区', 37, 3);
INSERT INTO `address` VALUES (432, '西青区', 37, 3);
INSERT INTO `address` VALUES (433, '津南区', 37, 3);
INSERT INTO `address` VALUES (434, '北辰区', 37, 3);
INSERT INTO `address` VALUES (435, '武清区', 37, 3);
INSERT INTO `address` VALUES (436, '宝坻区', 37, 3);
INSERT INTO `address` VALUES (437, '滨海新区', 37, 3);
INSERT INTO `address` VALUES (438, '宁河区', 37, 3);
INSERT INTO `address` VALUES (439, '静海区', 37, 3);
INSERT INTO `address` VALUES (440, '蓟州区', 37, 3);
INSERT INTO `address` VALUES (441, '宁河县', 38, 3);
INSERT INTO `address` VALUES (442, '静海县', 38, 3);
INSERT INTO `address` VALUES (443, '蓟县', 38, 3);
INSERT INTO `address` VALUES (444, '长安区', 39, 3);
INSERT INTO `address` VALUES (445, '桥西区', 39, 3);
INSERT INTO `address` VALUES (446, '新华区', 39, 3);
INSERT INTO `address` VALUES (447, '井陉矿区', 39, 3);
INSERT INTO `address` VALUES (448, '裕华区', 39, 3);
INSERT INTO `address` VALUES (449, '藁城区', 39, 3);
INSERT INTO `address` VALUES (450, '鹿泉区', 39, 3);
INSERT INTO `address` VALUES (451, '栾城区', 39, 3);
INSERT INTO `address` VALUES (452, '井陉县', 39, 3);
INSERT INTO `address` VALUES (453, '正定县', 39, 3);
INSERT INTO `address` VALUES (454, '行唐县', 39, 3);
INSERT INTO `address` VALUES (455, '灵寿县', 39, 3);
INSERT INTO `address` VALUES (456, '高邑县', 39, 3);
INSERT INTO `address` VALUES (457, '深泽县', 39, 3);
INSERT INTO `address` VALUES (458, '赞皇县', 39, 3);
INSERT INTO `address` VALUES (459, '无极县', 39, 3);
INSERT INTO `address` VALUES (460, '平山县', 39, 3);
INSERT INTO `address` VALUES (461, '元氏县', 39, 3);
INSERT INTO `address` VALUES (462, '赵县', 39, 3);
INSERT INTO `address` VALUES (463, '辛集市', 39, 3);
INSERT INTO `address` VALUES (464, '晋州市', 39, 3);
INSERT INTO `address` VALUES (465, '新乐市', 39, 3);
INSERT INTO `address` VALUES (466, '路南区', 40, 3);
INSERT INTO `address` VALUES (467, '路北区', 40, 3);
INSERT INTO `address` VALUES (468, '古冶区', 40, 3);
INSERT INTO `address` VALUES (469, '开平区', 40, 3);
INSERT INTO `address` VALUES (470, '丰南区', 40, 3);
INSERT INTO `address` VALUES (471, '丰润区', 40, 3);
INSERT INTO `address` VALUES (472, '曹妃甸区', 40, 3);
INSERT INTO `address` VALUES (473, '滦南县', 40, 3);
INSERT INTO `address` VALUES (474, '乐亭县', 40, 3);
INSERT INTO `address` VALUES (475, '迁西县', 40, 3);
INSERT INTO `address` VALUES (476, '玉田县', 40, 3);
INSERT INTO `address` VALUES (477, '遵化市', 40, 3);
INSERT INTO `address` VALUES (478, '迁安市', 40, 3);
INSERT INTO `address` VALUES (479, '滦州市', 40, 3);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '类目唯一标识',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类目名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '类目描述',
  `post_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子ID',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类目图标路径',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '类目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '前端', '对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...', 'post_001', NULL, '2025-06-25 14:42:29', '2025-07-04 19:33:53', 0);
INSERT INTO `category` VALUES (2, '后端', '振臂一呼，把真情实感大声说出来，让人振作从困境脱离，也是非常受欢迎的类型。', 'post_002', NULL, '2025-06-25 14:42:29', '2025-06-28 19:26:22', 0);
INSERT INTO `category` VALUES (3, '算法', '打鸡血，补鸡汤。 这是激情类文章良性的类型。', 'post_003', NULL, '2025-06-25 14:42:29', '2025-06-28 19:26:22', 0);
INSERT INTO `category` VALUES (4, '运维', '在博客写作早期，我写了研究为主的文章，探讨如何博客写作的不同方向。', 'post_004', NULL, '2025-06-25 14:42:30', '2025-06-28 19:26:22', 0);
INSERT INTO `category` VALUES (5, 'AI', '这是一种结合上述研究类和链接类的类型。', 'post_005', NULL, '2025-06-25 14:42:30', '2025-06-28 19:26:22', 0);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论唯一标识',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论所属用户ID',
  `post_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论所属文章ID',
  `root_parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复的目标评论ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_name` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reply_to_comment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复的目标评论ID',
  `goodorbad` int NULL DEFAULT NULL COMMENT '评分信息',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '第一个评论', '1937794761217912834', '1', NULL, '2025-06-27 16:39:19', '2025-07-04 11:07:12', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `comment` VALUES ('2', '第二个评论', '1937794761217912834', '2', NULL, '2025-06-27 16:39:19', '2025-07-04 11:07:12', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `comment` VALUES ('21', '111', '1941066004178776066', '1938503279516438530', NULL, '2025-06-28 15:13:33', '2025-07-04 19:18:09', 0, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `comment` VALUES ('22', '555', '1938852475338047500', '1938503279516438530', NULL, '2025-06-28 15:14:23', '2025-07-03 17:08:59', 0, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `comment` VALUES ('23', '333', '1938852475338047500', '1938503279516438530', NULL, '2025-06-28 15:14:27', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `comment` VALUES ('24', '888', '1938852475338047500', '1938503279516438500', NULL, '2025-06-28 15:14:37', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `comment` VALUES ('25', '123123', '1938852475338047500', '1938503279516438500', NULL, '2025-06-28 15:19:38', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `comment` VALUES ('26', '这很好了', '1938852475338047500', '1938503279516438500', NULL, '2025-06-28 15:20:03', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `comment` VALUES ('27', '这是杨旭的评论', '1938852475338047500', '1938503279516438500', NULL, '2025-06-28 15:33:19', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `comment` VALUES ('28', '你好', '1938852475338047500', '1938503279516438500', NULL, '2025-06-28 15:33:27', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `comment` VALUES ('2893221d-f5da-49dc-9825-6a2557f101c9', 'ordinary', '1937794761217912834', '1938503279516438530', NULL, '2025-07-04 10:49:48', '2025-07-04 10:49:48', 0, NULL, NULL, 'zhaoxin', NULL, NULL, 1);
INSERT INTO `comment` VALUES ('29', '8585', '1937794761217912834', '1938503279516438500', NULL, '2025-06-28 17:55:10', '2025-07-04 11:07:12', 0, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `comment` VALUES ('30', '9696', '1937794761217912834', '1938503279516438500', NULL, '2025-06-28 17:55:20', '2025-07-04 11:07:12', 0, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `comment` VALUES ('31', '12', '1937794761217912834', '1938503279516438500', NULL, '2025-06-28 17:55:45', '2025-07-04 11:07:12', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `comment` VALUES ('32', '1231231', '1938852475338047490', '1938503279516438530', NULL, '2025-07-02 08:44:26', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `comment` VALUES ('33', '杨旭', '1938852475338047490', '1938503279516438530', NULL, '2025-07-02 08:44:31', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `comment` VALUES ('34', '杨旭的评论', '1938852475338047490', '1938503279516438530', NULL, '2025-07-02 08:50:03', '2025-07-03 17:08:59', 0, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `comment` VALUES ('35', '你好啊\n', '1938852475338047490', '1938965350989176834', NULL, '2025-07-02 08:50:39', '2025-07-04 20:00:58', 0, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `comment` VALUES ('36', 'zhaoxin的评论', '1937794761217912834', 'post_001', NULL, '2025-07-02 08:56:29', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `comment` VALUES ('37', 'hello,world!', '1938852475338047490', '1938503279516438530', NULL, '2025-07-02 09:43:35', '2025-07-03 17:08:59', 0, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `comment` VALUES ('38', 'lkjn', '1937794761217912834', '1938503279516438530', NULL, '2025-07-02 09:57:08', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `comment` VALUES ('39', '哇哇哇哇哇哇哇哇', '1938852475338047490', '1938503279516438530', NULL, '2025-07-03 08:50:37', '2025-07-03 17:08:59', 0, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `comment` VALUES ('39112fb7-f971-45ea-a65f-a8db15bb3ef6', '差评水军', '1937794761217912834', '1938503279516438530', NULL, '2025-07-04 10:49:23', '2025-07-04 10:49:23', 0, NULL, NULL, 'zhaoxin', NULL, NULL, 2);
INSERT INTO `comment` VALUES ('40', '新评论', '1938852475338047490', '1938503279516438530', NULL, '2025-07-03 08:54:44', '2025-07-03 17:08:59', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `comment` VALUES ('41', 'yc', '1938852475338047490', '1938503279516438530', NULL, '2025-07-03 13:26:21', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `comment` VALUES ('42', '7777', '1938852475338047490', '1938503279516438530', NULL, '2025-07-03 13:26:41', '2025-07-03 17:08:59', 0, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `comment` VALUES ('43', '123', '1938852475338047490', '1938503279516438530', NULL, '2025-07-03 14:59:56', '2025-07-03 17:08:58', 0, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `comment` VALUES ('4f87add1-0a77-4ea8-bfbd-c5176dcc72c9', '写的不太好', '1937794761217912834', '1938503279516438530', NULL, '2025-07-04 10:49:07', '2025-07-04 10:49:07', 0, NULL, NULL, 'zhaoxin', NULL, NULL, 1);
INSERT INTO `comment` VALUES ('9c376166-579f-4c33-8378-eea19e7296c5', '时间2121', '1937794761217912834', '1938503279516438530', NULL, '2025-07-04 18:51:03', '2025-07-04 18:51:03', 0, NULL, NULL, 'zhaoxin', NULL, NULL, 0);
INSERT INTO `comment` VALUES ('e1ebf5a2-6617-4f9e-93d4-50cf56536c55', '是 ', '32131221312', '1938503279516438530', NULL, '2025-07-04 18:51:24', '2025-07-04 18:51:24', 0, NULL, NULL, 'YoyuEN', NULL, NULL, 4);
INSERT INTO `comment` VALUES ('e2d1c1d6-200d-4e4a-a5b9-7414e15d8657', '五星好评', '32131221312', 'post_001', NULL, '2025-07-04 17:04:12', '2025-07-04 17:04:12', 0, NULL, NULL, 'YoyuEN', NULL, NULL, 5);
INSERT INTO `comment` VALUES ('eaa6f30e-aaa0-4658-8190-5c7ebb303fe6', '水军冲锋', '1937794761217912834', '1938503279516438530', NULL, '2025-07-04 10:49:36', '2025-07-04 10:49:36', 0, NULL, NULL, 'zhaoxin', NULL, NULL, 1);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'user', '账户表', NULL, NULL, 'CommonUser', 'crud', 'element-ui', 'com.ruoyi.jank', 'commonuser', 'commonuser', '用户管理', 'ruoyi', '0', '/', '{\"parentMenuId\":2018}', 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37', NULL);
INSERT INTO `gen_table` VALUES (2, 'post', '帖子表', NULL, NULL, 'Post', 'crud', 'element-ui', 'com.ruoyi.jank', 'postlist', 'postlist', '帖子', 'wuyinai', '0', '/', '{\"parentMenuId\":1}', 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20', NULL);
INSERT INTO `gen_table` VALUES (3, 'comment', '评论表', NULL, NULL, 'Comment', 'crud', 'element-ui', 'com.ruoyi.jank', 'comment', 'comment', '评论管理', 'yx', '0', '/', '{}', 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59', NULL);
INSERT INTO `gen_table` VALUES (4, 'category', '类目表', NULL, NULL, 'Category', 'crud', 'element-ui', 'com.ruoyi.jank', 'category', 'category', '类目管理', 'yx', '0', '/', '{}', 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'user_id', '主键ID', 'varchar(64)', 'String', 'userId', '1', '0', '0', '0', NULL, NULL, '0', 'EQ', 'input', '', 1, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (2, 1, 'nickname', '用户昵称', 'varchar(100)', 'String', 'nickname', '0', '0', '1', '0', '1', '1', '0', 'LIKE', 'input', '', 2, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (3, 1, 'email', '用户邮箱', 'varchar(255)', 'String', 'email', '0', '0', '1', '0', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (4, 1, 'username', '用户名', 'varchar(50)', 'String', 'username', '0', '0', '0', '0', '0', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (5, 1, 'password', '密码', 'varchar(50)', 'String', 'password', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 5, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (6, 1, 'phone', '用户手机号', 'varchar(20)', 'String', 'phone', '0', '0', '1', '0', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (7, 1, 'access_token', '访问令牌', 'text', 'String', 'accessToken', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 7, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (8, 1, 'refresh_token', '刷新令牌', 'text', 'String', 'refreshToken', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'textarea', '', 8, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:37');
INSERT INTO `gen_table_column` VALUES (9, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:38');
INSERT INTO `gen_table_column` VALUES (10, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:38');
INSERT INTO `gen_table_column` VALUES (11, 1, 'deleted', '是否删除', 'int', 'Long', 'deleted', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 11, 'admin', '2025-06-25 11:04:19', '', '2025-06-25 14:43:38');
INSERT INTO `gen_table_column` VALUES (12, 2, 'post_id', '帖子唯一标识', 'varchar(64)', 'String', 'postId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (13, 2, 'title', '帖子标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (14, 2, 'image', '帖子封面图片URL', 'varchar(500)', 'String', 'image', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 3, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (15, 2, 'visibility', '帖子可见性状态', 'tinyint(1)', 'Integer', 'visibility', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (16, 2, 'content_html', '帖子HTML格式内容', 'mediumtext', 'String', 'contentHtml', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (17, 2, 'category_ids', '帖子所属分类ID', 'varchar(64)', 'String', 'categoryIds', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (18, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (19, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (20, 2, 'deleted', '是否删除', 'int', 'Long', 'deleted', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-25 11:09:22', '', '2025-06-25 11:12:20');
INSERT INTO `gen_table_column` VALUES (21, 3, 'comment_id', '评论唯一标识', 'int', 'Long', 'commentId', '1', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (22, 3, 'content', '评论内容', 'text', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 2, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (23, 3, 'user_id', '评论所属用户ID', 'varchar(64)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (24, 3, 'post_id', '评论所属文章ID', 'varchar(64)', 'String', 'postId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (25, 3, 'reply_to_comment_id', '回复的目标评论ID', 'varchar(64)', 'String', 'replyToCommentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (26, 3, 'created_at', '创建时间', 'datetime', 'Date', 'createdAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (27, 3, 'updated_at', '更新时间', 'datetime', 'Date', 'updatedAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (28, 3, 'deleted', '是否删除', 'int', 'Long', 'deleted', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-25 11:10:09', '', '2025-06-25 11:10:59');
INSERT INTO `gen_table_column` VALUES (29, 4, 'category_id', '类目唯一标识', 'int', 'Long', 'categoryId', '1', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');
INSERT INTO `gen_table_column` VALUES (30, 4, 'name', '类目名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');
INSERT INTO `gen_table_column` VALUES (31, 4, 'description', '类目描述', 'text', 'String', 'description', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');
INSERT INTO `gen_table_column` VALUES (32, 4, 'parent_id', '父类目ID', 'varchar(64)', 'String', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');
INSERT INTO `gen_table_column` VALUES (33, 4, 'path', '类目图标路径', 'varchar(255)', 'String', 'path', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');
INSERT INTO `gen_table_column` VALUES (34, 4, 'created_at', '创建时间', 'datetime', 'Date', 'createdAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');
INSERT INTO `gen_table_column` VALUES (35, 4, 'updated_at', '更新时间', 'datetime', 'Date', 'updatedAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');
INSERT INTO `gen_table_column` VALUES (36, 4, 'deleted', '是否删除', 'int', 'Long', 'deleted', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-25 11:10:13', '', '2025-06-25 11:11:52');

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `moment_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '朋友圈ID（UUID）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文字内容',
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发布用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `like_count` int NULL DEFAULT 0 COMMENT '点赞数量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除状态（0:未删除, 1:已删除）',
  `liked_by_user` tinyint(1) NULL DEFAULT 0 COMMENT '当前用户是否已点赞',
  PRIMARY KEY (`moment_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '朋友圈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES ('2123123213', '今天天气不好，去跑个步吧', '1937794761217912834', 'zhaoxin', '趣事', 5, '2025-06-28 17:08:17', 0, 0);
INSERT INTO `moment` VALUES ('5f40d7a8-1d7e-40c4-b2e6-b246d84519cd', '这一刻的想法', '32131221312', 'YoyuEN', '全部', 0, '2025-07-04 18:53:15', 0, 0);
INSERT INTO `moment` VALUES ('a19b53b6-53bd-11f0-ac13-005056c00001', '今天天气真好！出去踏青啦～', '32131221312', '小明', '生活', 8, '2025-06-28 09:17:17', 0, 0);

-- ----------------------------
-- Table structure for moment_comment
-- ----------------------------
DROP TABLE IF EXISTS `moment_comment`;
CREATE TABLE `moment_comment`  (
  `comment_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论ID（UUID）',
  `moment_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对应的朋友圈ID',
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论用户ID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论用户名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除状态（0:未删除, 1:已删除）',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `idx_moment_id`(`moment_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '朋友圈评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment_comment
-- ----------------------------
INSERT INTO `moment_comment` VALUES ('123123', 'a19b53b6-53bd-11f0-ac13-005056c00001', '32131221312', '杨旭', '不带我', '2025-06-28 09:19:57', 0);
INSERT INTO `moment_comment` VALUES ('213123123', '2123123213', '32131221312', '浮迹', '待', '2025-07-02 14:54:41', 0);
INSERT INTO `moment_comment` VALUES ('32123', 'a19b53b6-53bd-11f0-ac13-005056c00001', '32131221312', '浮迹', '带我', '2025-06-28 17:20:08', 0);
INSERT INTO `moment_comment` VALUES ('df586a1a-b027-41d5-af8e-cca17948df16', '2123123213', '32131221312', 'YoyuEN', '你是？', '2025-07-02 15:54:53', 0);

-- ----------------------------
-- Table structure for moment_image
-- ----------------------------
DROP TABLE IF EXISTS `moment_image`;
CREATE TABLE `moment_image`  (
  `image_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片ID（UUID）',
  `moment_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对应的朋友圈ID',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片链接',
  `sort_order` int NULL DEFAULT 0 COMMENT '图片排序顺序（0~8）',
  PRIMARY KEY (`image_id`) USING BTREE,
  INDEX `idx_moment_id`(`moment_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '朋友圈图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moment_image
-- ----------------------------
INSERT INTO `moment_image` VALUES ('0271f408-2e42-4392-9dc7-03f737596d29', 'cf29846a-8ccb-47f5-882f-cfc9069a08cc', 'Snipaste_2024-04-11_20-30-23.jpg', 2);
INSERT INTO `moment_image` VALUES ('121231232', '2123123213', 'YoyuEN.png', 0);
INSERT INTO `moment_image` VALUES ('1c7869ab-7c37-46de-ba72-efe1d977c181', 'cf29846a-8ccb-47f5-882f-cfc9069a08cc', 'Snipaste_2024-04-11_20-26-36.jpg', 6);
INSERT INTO `moment_image` VALUES ('21312312312', '2123123213', 'huawei.png', 0);
INSERT INTO `moment_image` VALUES ('21af08a8-92fa-4774-bf2a-7c7282480e43', 'cf29846a-8ccb-47f5-882f-cfc9069a08cc', 'foot-logo-xg.png', 5);
INSERT INTO `moment_image` VALUES ('6cb4d526-a99c-4f1c-a3b3-3b42f4b17b36', '07703e92-6231-4450-8807-d502c065e9ba', 'OIP-C.png', 0);
INSERT INTO `moment_image` VALUES ('9d0bd99f-f363-4ae8-ba45-d52aac60deb7', 'cf29846a-8ccb-47f5-882f-cfc9069a08cc', 'huawei.png', 3);
INSERT INTO `moment_image` VALUES ('a1a04c45-53bd-11f0-ac13-005056c00001', 'a19b53b6-53bd-11f0-ac13-005056c00001', '8787.jpg', 0);
INSERT INTO `moment_image` VALUES ('a1a0537b-53bd-11f0-ac13-005056c00001', 'a19b53b6-53bd-11f0-ac13-005056c00001', 'YoyuEN.png', 1);
INSERT INTO `moment_image` VALUES ('bf316cec-b314-49ba-a422-c4c51d11a803', '11fe6cff-1f3b-491c-9cd9-e89a72d57104', 'huawei.png', 1);
INSERT INTO `moment_image` VALUES ('c12cea02-fb1d-49fb-9b67-d548dd2cc57b', '5f40d7a8-1d7e-40c4-b2e6-b246d84519cd', 'YU.jpg', 0);
INSERT INTO `moment_image` VALUES ('da291dca-7f56-435e-9a2f-3debb3d9ed7b', '7eff365b-46ba-4a67-b8e9-3594d977c476', 'Snipaste_2024-04-12_17-03-22.jpg', 0);
INSERT INTO `moment_image` VALUES ('e9085dfb-2f45-4f41-9b1f-b7683606dd1b', 'cf29846a-8ccb-47f5-882f-cfc9069a08cc', 'OIP-C.png', 1);
INSERT INTO `moment_image` VALUES ('e93c2b15-3bfb-49ef-9849-ff28d4a1f1f0', 'cf29846a-8ccb-47f5-882f-cfc9069a08cc', 'sc.jpg', 4);
INSERT INTO `moment_image` VALUES ('f89fc9a2-6286-43f4-8ffa-dfef6e8fe70a', '3af0db0a-7c9b-455e-bfa4-d19aa7fad1c9', 'OIP-C.png', 0);
INSERT INTO `moment_image` VALUES ('fbbe76d7-e074-4e18-a08f-10377fa1e2b5', 'cf29846a-8ccb-47f5-882f-cfc9069a08cc', 'logo.png', 0);
INSERT INTO `moment_image` VALUES ('fc47efaa-e609-4178-a9f8-1fd90a1c8a10', '11fe6cff-1f3b-491c-9cd9-e89a72d57104', 'logo.png', 0);

-- ----------------------------
-- Table structure for per_message
-- ----------------------------
DROP TABLE IF EXISTS `per_message`;
CREATE TABLE `per_message`  (
  `mess_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言id',
  `message` varchar(260) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '留言内容',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id',
  `create_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`mess_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '个人留言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of per_message
-- ----------------------------
INSERT INTO `per_message` VALUES ('0d718110-ea6d-4f01-8f19-3efa53fe84a2', '我是大聪明', '1937794761217912834', '2025-07-02 09:40:30', '2025-07-02 09:40:30', 0);
INSERT INTO `per_message` VALUES ('1243543546576899', '真是太好了', '1937794761217912834', '2025-07-01 16:48:38', '2025-07-01 16:48:38', 0);
INSERT INTO `per_message` VALUES ('1246776985', 'vue真难学', '1938899140111585281', '2025-07-01 16:49:58', '2025-07-01 16:49:58', 0);
INSERT INTO `per_message` VALUES ('1343567898', '谁教教我怎么写', '1938852475338047490', '2025-07-01 16:49:59', '2025-07-01 16:49:59', 0);
INSERT INTO `per_message` VALUES ('21556475', '这是一个非常好的博客', '1937794761217912834', '2025-07-01 16:49:58', '2025-07-01 16:49:58', 0);
INSERT INTO `per_message` VALUES ('2345678988765', '谁是大神', '1938852475338047490', '2025-07-01 16:49:59', '2025-07-01 16:49:59', 0);
INSERT INTO `per_message` VALUES ('2e669ccb-db17-4b1d-a2d5-6f7af42f52cc', '是大神，我们有救了', '1938852475338047490', '2025-07-02 09:44:22', '2025-07-02 09:44:22', 0);
INSERT INTO `per_message` VALUES ('3245657890898756', '有好多志同道合的朋友', '1938899140111585281', '2025-07-01 16:49:58', '2025-07-01 16:49:58', 0);
INSERT INTO `per_message` VALUES ('619db5da-d63c-43a9-b3ef-233178e6288e', '新增两条弹幕', '1937794761217912834', '2025-07-02 09:33:24', '2025-07-02 09:33:24', 0);
INSERT INTO `per_message` VALUES ('68599c9d-4bd7-4fc8-b8c6-7e7662dcc838', '超级飞侠', '1938852475338047490', '2025-07-02 09:42:19', '2025-07-02 09:42:19', 0);
INSERT INTO `per_message` VALUES ('6bbc59c3-7b9e-4fff-a89e-975c14517be0', '超级无敌秀', '1938852475338047490', '2025-07-02 09:42:06', '2025-07-02 09:42:06', 0);
INSERT INTO `per_message` VALUES ('7a5cce5f-a22e-4823-98ab-8c528dea313a', '谁与我一战', '1938852475338047490', '2025-07-02 09:42:24', '2025-07-02 09:42:24', 0);
INSERT INTO `per_message` VALUES ('82f34a02-32ca-443b-9567-f075a9e4a26e', '我是卧龙', '1937794761217912834', '2025-07-02 09:40:39', '2025-07-02 09:40:39', 0);
INSERT INTO `per_message` VALUES ('84e7a24b-85e1-42d5-86c2-b85e0429cff9', '怎么才能学号计算机', '1938852475338047490', '2025-07-02 09:42:31', '2025-07-02 09:42:31', 0);
INSERT INTO `per_message` VALUES ('8b69c8f4-b515-4182-ab86-6c25ee093e00', '你是？', '32131221312', '2025-07-02 21:29:46', '2025-07-02 21:29:46', 0);
INSERT INTO `per_message` VALUES ('b1953ac8-34ed-468e-8288-078d219678bc', '超级飞升', '1938852475338047490', '2025-07-02 09:42:14', '2025-07-02 09:42:14', 0);
INSERT INTO `per_message` VALUES ('c15e32f5-caa2-428d-8137-cb05ac183442', '我是凤雏', '1937794761217912834', '2025-07-02 09:40:44', '2025-07-02 09:40:44', 0);
INSERT INTO `per_message` VALUES ('cf52f4e1-83b8-4167-9dd1-8d359104dfab', '我是谁', '1937794761217912834', '2025-07-02 09:33:44', '2025-07-02 09:33:44', 0);
INSERT INTO `per_message` VALUES ('eb6ef684-88a4-4b78-8387-9efb07f7293c', '新增一条弹幕', '1937794761217912834', '2025-07-02 09:20:37', '2025-07-02 09:20:37', 0);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `post_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帖子唯一标识',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帖子用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '帖子标题',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子封面图片URL',
  `visibility` tinyint(1) NULL DEFAULT 1 COMMENT '帖子可见性状态',
  `content_html` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '帖子HTML格式内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1938503279516438530', '1937794761217912834', '北民大', '北方民族大学.jpg', 1, '[![neac.gov.cn/seac/mwjs/20...](https://images.openai.com/thumbnails/url/s0wDHHicu1mUUVJSUGylr5-al1xUWVCSmqJbkpRnoJdeXJJYkpmsl5yfq5-Zm5ieWmxfaAuUsXL0S7F0Tw4KLkwxNHZzs8zzKPEODI93dstOLA8trUg1KjOK8nb21A3xjXD3zM7JrDJPzqzKMQnwCsmsDNYtcnVSKwYAu-gpAg)](https://www.neac.gov.cn/seac/mwjs/201504/1009156.shtml)\n\n北方民族大学（North Minzu University，简称 NMU，中文常简称“北民大”）是一所直属于国家民族事务委员会的中央部委高校，位于宁夏回族自治区首府银川市，是全国唯一设在少数民族自治区的部委综合性民族类大学([neac.gov.cn][1])。\n\n---\n\n## 🎓 基本概况\n\n* **成立背景**：1984 年创建，原为“西北第二民族学院”，2008 年正式更名为北方民族大学；2018 年获博士学位授予权([neac.gov.cn][1])。\n* **办学层次**：具备本科、硕士、博士完整学位体系，涵盖 10 个学科门类、72 个本科专业，以及多个一级、二级学位点([neac.gov.cn][1])。\n* **师生规模**：约 1,300 名教职工，学生总数约 2.1 万人，来自全国 31 个省市、56 个民族，其中 60% 以上为少数民族([zh.wikipedia.org][2])。\n\n---\n\n## 🔬 办学特色与定位\n\n* **民族教育重镇**：秉承“四个服务”办学理念，致力于为少数民族及其地区培养高素质人才，促进民族理论与政策研究，传承民族文化，服务国家战略([neac.gov.cn][1])。\n* **学科与科研实力**：拥有民族学一级学科博士点，16 个省部级重点学科，4 个国家级特色专业，并设有国家级与省级实验教学示范中心及重点实验室([neac.gov.cn][1])。\n* **产学研结合**：近年承担省部级以上科研项目超 500 项，在粉体材料与特种陶瓷、葡萄酒工程、生态移民与精准扶贫、北方语言研究等领域具备特色优势([neac.gov.cn][1])。\n* **“双创”教育**：推进“创新创业团队+实践+校企合作”模式，获得全国“双创”示范高校、自治区创业孵化示范基地等多项荣誉([neac.gov.cn][1])。\n\n---\n\n## 🌐 国际合作与社会服务\n\n* **对口支援与共建**：由国家民委、教育部与宁夏自治区三方共建，合肥工业大学为指定支援高校，并与北大、西交大、兰大等多所高校保持合作关系([neac.gov.cn][1])。\n* **国际教育**：2014 年设立国际教育学院，入选丝路大学联盟；与全球 28 个国家的 60 多所高校建立合作，接收留学生逾 80 人([neac.gov.cn][1])。\n\n---\n\n## 🌳 校园环境与文化\n\n* **校园绿化**：校园占地约 1,082,667 平米（约 1624 亩），环境优美，被评为“全国部门绿化 400 强”和银川市“花园式单位”([zh.wikipedia.org][2])。\n* **民族文化氛围**：学生来自多民族背景，校园民族文化氛围浓厚，通过各种课程、实践与活动增强中华民族共同体认同。\n\n---\n\n## 💫 办学定位与未来愿景\n\n* **发展使命**：坚持服务民族地区、服务国家战略和民族团结进步事业，推动内涵式发展与特色建设，致力成为有“民族特色的现代高水平大学”([smenx.com.cn][3])。\n* **发展战略**：实施“四大战略”——质量立校、人才强校、科技强校、管理兴校，围绕提升教育质量与服务能力持续改革创新([smenx.com.cn][3])。\n\n---\n\n### 📍 学校信息一览\n\n| 项目   | 内容                           |\n| ---- | ---------------------------- |\n| 所属关系 | 国家民族事务委员会直属，教育部与宁夏自治区共建      |\n| 校址   | 宁夏回族自治区银川市西夏区文昌北街 204 号      |\n| 校长   | 李俊杰（党委书记兼）([neac.gov.cn][1]) |\n| 师生人数 | 教职工约 1,332 人，学生约 21,000 人    |\n\n---\n\n**总结**：北方民族大学作为我国民族类高水平院校的重要代表，凭借深厚的民族教育底蕴、扎实的学科实力与日益显著的科研与创新成果，正在培育具备民族情怀与综合才干的高素质人才，稳步迈向中国特色、民族特色鲜明的现代大学愿景。\n\n如你想进一步了解招生专业、入学要求或具体科研项目，欢迎继续提问！\n\n[1]: https://www.neac.gov.cn/seac/mwjs/201504/1009156.shtml?utm_source=chatgpt.com \"北方民族大学\"\n[2]: https://zh.wikipedia.org/wiki/%E5%8C%97%E6%96%B9%E6%B0%91%E6%97%8F%E5%A4%A7%E5%AD%A6?utm_source=chatgpt.com \"北方民族大学\"\n[3]: https://www.smenx.com.cn/rcgnk/yxxx/375347.shtml?utm_source=chatgpt.com \"北方民族大学\"\n', '2025-06-27 15:42:52', '2025-06-29 18:23:20', 0);
INSERT INTO `post` VALUES ('1938503494189305857', '1937794761217912834', '华为', 'huawei.png', 1, '## 十五岁', '2025-06-27 15:43:43', '2025-06-28 22:31:10', 0);
INSERT INTO `post` VALUES ('1938965350989176834', '32131221312', '浮迹', '时间.jpg', 1, '时间', '2025-06-28 22:18:58', '2025-07-03 14:40:05', 1);
INSERT INTO `post` VALUES ('post_001', '1937794761217912834', '前端框架对比：React vs Vue', 'huawei.png', 1, '<p>React和Vue是前端开发中极具影响力的技术，在2025年的技术生态里，它们各有特点，以下从多方面对比分析：\n   \n   ### 一、基础背景\n   - **Vue**：2014年由前谷歌员工Evan You创建，最新版本Vue 3.4 （2023年底发布 ），是专注于构建Web界面的开源JavaScript框架，以简洁、灵活著称 。\n   - **React**：2011年由Meta（原Facebook）开发，最初用于内部，后发展为热门UI构建工具，也可借助React Native进行跨平台移动开发 。\n   \n   ### 二、优势对比\n   #### Vue的优势\n   - **易用性**：编码方式直接，语法简洁、结构不复杂，对开发者友好，很多开发者认为比React更容易上手，开发简单项目时效率高。比如小型官网类项目，快速搭建页面组件。\n   - **学习曲线**：对新手友好，简单易掌握，中小型项目团队青睐，能加快开发流程。像刚入门前端的学生开发课程设计类小应用，Vue更容易快速出成果。\n   - **插件与集成**：原生JavaScript库有实用插件，方便扩展功能；易与其他项目、库集成，无需完全重构就能融入现有应用，还有大量现成组件可快速复用。例如给传统后端渲染项目添加前端交互模块，Vue能相对轻松集成。\n   - **性能表现**：不少开发者反馈其性能速度有优势，在渲染等操作上高效。 \n   \n   #### React的优势\n   - **跨平台能力（React Native）**：借助React Native，能用与React相同语法、模式开发iOS和Android移动应用，学了React再学React Native门槛低，方便构建多端应用。比如要同时开发Web和移动App项目，一套知识体系可复用。\n   - **JSX语法**：JSX扩展让创建自定义UI组件更直观，能清晰可视化组件结构，复杂UI构建时优势明显。像大型后台管理系统的复杂表格、弹窗组件等，JSX能清晰描述结构和逻辑。\n   - **开发者工具**：Chrome和Firefox浏览器的React开发者工具扩展好用，便于理解应用结构、定位性能问题、加速调试。\n   - **生态与灵活性**：生态成熟，社区活跃，有丰富第三方库、工具和资源；能构建单页应用（SPAs）、服务端应用、移动应用等多种类型，适配不同平台和应用场景需求。 \n   \n   ### 三、适用场景\n   - **选Vue**：若项目是中小型Web应用，追求开发简单、快速上手，或需轻松集成到现有系统，Vue是好选择。比如企业内部管理系统（功能模块相对独立、交互不极端复杂 ）、小型电商展示页等。 \n   - **选React**：若要开发跨平台（Web + 移动）应用，构建复杂交互的大型单页应用，或看重成熟生态、灵活适配多种场景，React更合适。像大型社交平台（多端适配、复杂交互逻辑 ）、高复杂度的在线协作工具等。 \n   \n   二者都有庞大社区和丰富资源，具体选谁，要结合项目需求（规模、复杂度、是否跨端等 ）、团队技术储备（成员对语法、生态熟悉度 ）来决定，都能高效构建优质前端应用。 </p>', '2025-06-24 16:41:49', '2025-06-28 22:30:52', 0);
INSERT INTO `post` VALUES ('post_002', '32131221312', '后端API设计最佳实践', 'YU.jpg', 1, '<p>介绍RESTful API设计原则、版本控制、错误处理等内容...</p>', '2025-06-24 16:41:49', '2025-07-03 14:40:05', 0);
INSERT INTO `post` VALUES ('post_003', '32131221312', '数据库索引优化技巧', 'YU.jpg', 1, '<p>数据库索引优化是数据库性能调优中最关键的一环，尤其在 **大数据量、高并发** 场景下，合理使用索引可以成倍提升查询性能，但使用不当反而会造成写入变慢、索引失效等问题。\n   \n   下面是数据库索引优化的 **实战技巧大全**，适用于常见关系型数据库（如 MySQL、PostgreSQL、SQL Server）。\n   \n   ---\n   \n   ## 🔍 一、基本概念回顾\n   \n   | 概念       | 描述             |\n   | -------- | -------------- |\n   | **主键索引** | 自动创建、唯一、聚簇索引   |\n   | **唯一索引** | 不允许重复值         |\n   | **普通索引** | 允许重复值          |\n   | **联合索引** | 多列组成的复合索引      |\n   | **覆盖索引** | 查询列全部在索引中，避免回表 |\n   | **前缀索引** | 只索引字符字段前缀，节省空间 |\n   \n   ---\n   \n   ## 🚀 二、索引优化技巧实战\n   \n   ### ✅ 1. 创建索引的时机\n   \n   适合加索引的字段：\n   \n   * `WHERE` 子句中频繁使用的列\n   * `JOIN` 的关联字段\n   * `ORDER BY`、`GROUP BY` 的字段\n   * 唯一性约束字段（如用户ID、邮箱等）\n   \n   避免给以下字段加索引：\n   \n   * 高频更新的字段（加索引会拖慢写入）\n   * 低选择度字段（如性别、布尔值）\n   * 超长字段（如大文本、JSON）\n   \n   ---\n   \n   ### ✅ 2. 索引类型选择技巧\n   \n   | 场景       | 推荐索引               |\n   | -------- | ------------------ |\n   | 单字段查询频繁  | 单列索引               |\n   | 多字段组合查询  | 联合索引（注意字段顺序）       |\n   | 查询只涉及索引列 | 覆盖索引（提高性能）         |\n   | 模糊搜索     | 前缀索引 或 使用全文索引      |\n   | 范围查询     | 将范围字段放在联合索引 **最后** |\n   \n   ---\n   \n   ### ✅ 3. 索引失效常见原因（MySQL 举例）\n   \n   | 写法                            | 是否能用索引      |\n   | ----------------------------- | ----------- |\n   | `WHERE age = 30`              | ✅ 能         |\n   | `WHERE age + 1 = 31`          | ❌ 不能（使用了函数） |\n   | `WHERE LEFT(name,3) = \'Tom\'`  | ❌（前缀函数）     |\n   | `WHERE age BETWEEN 20 AND 30` | ✅ 能         |\n   | `OR` 多条件                      | ❌（可能失效，视情况） |\n   | `%张三%` 模糊匹配                   | ❌（用全文索引）    |\n   | `ORDER BY 非索引字段`              | ❌ 需要排序操作    |\n   | `联合索引不按最左前缀`                  | ❌ 索引失效      |\n   \n   📌 **最左前缀原则**：联合索引如 `(a, b, c)`，以下查询能用索引：\n   \n   * `WHERE a = ?`\n   * `WHERE a = ? AND b = ?`\n   * `WHERE a = ? AND b = ? AND c = ?`\n   \n   ---\n   \n   ### ✅ 4. 使用 EXPLAIN 分析 SQL\n   \n   使用 `EXPLAIN SELECT ...` 查看执行计划：\n   \n   重点关注字段：\n   \n   * `type`：访问类型，最好是 `const`、`ref`、`range`，`ALL` 表示全表扫描。\n   * `key`：是否使用了索引\n   * `rows`：扫描的行数，越小越好\n   * `extra`：注意是否出现 `\"Using filesort\"`、`\"Using temporary\"`\n   \n   ---\n   \n   ## 🧠 三、索引优化进阶技巧\n   \n   ### ✅ 1. 覆盖索引（索引字段包含查询字段）\n   \n   ```sql\n   -- 覆盖索引：查询字段都在索引中\n   SELECT name, age FROM users WHERE age = 30;\n   -- 建立组合索引 (age, name)\n   ```\n   \n   ### ✅ 2. 延迟关联（适合分页大表）\n   \n   ```sql\n   -- 先查主键，再关联获取完整记录\n   SELECT * FROM users WHERE id IN (\n       SELECT id FROM users WHERE status = 1 LIMIT 1000\n   );\n   ```\n   \n   ### ✅ 3. 分区表 + 局部索引（大表拆分）\n   \n   * 使用 MySQL 分区表功能，可按日期、范围等分区。\n   * 配合局部索引提升查询效率。\n   \n   ---\n   \n   ## 🧪 四、常用优化工具和命令\n   \n   | 工具/命令                   | 说明               |\n   | ----------------------- | ---------------- |\n   | `EXPLAIN`               | 查看 SQL 执行计划      |\n   | `SHOW INDEX FROM table` | 查看表的索引情况         |\n   | `slow_query_log`        | MySQL 慢查询日志      |\n   | `pt-query-digest`       | 慢查询分析工具（Percona） |\n   | `MySQL Workbench`       | 图形化分析            |\n   \n   ---\n   \n   ## 📝 五、实际开发建议\n   \n   * **每张表不要加太多索引**：写入成本会升高（每次 insert/update 都要维护索引）\n   * **定期审查索引**：删除冗余、无效索引\n   * **结合业务查询场景建索引**：不要盲目加“可能会用到”的索引\n   * **不要依赖 ORM 自动建索引**，需要人工设计\n   \n   ---\n   \n   如果你使用的是具体数据库（如 MySQL 8、PostgreSQL、SQL Server），我可以给出具体命令和案例示范。要不要来一份对应你项目的索引优化建议？\n</p>', '2025-06-24 16:41:49', '2025-07-03 14:40:04', 0);
INSERT INTO `post` VALUES ('post_004', '32131221312', '云计算架构演进史', '兰博基尼.jpg', 0, '<p>从传统IDC到容器云、Serverless的技术演进过程...</p>', '2025-06-24 16:41:50', '2025-07-03 14:40:05', 0);
INSERT INTO `post` VALUES ('post_005', '32131221312', '移动端性能优化实战', 'DarkGirl.jpg', 1, '<p>移动端性能优化是一个系统性的工程，既要关注前端加载、渲染效率，也要兼顾网络、内存和用户体验。以下是一份系统性的 **移动端性能优化实战指南**，包括常见问题、优化策略和工具建议。\n   \n   ---\n   \n   ## 🚀 一、页面加载性能优化\n   \n   ### ✅ 1. 资源体积优化\n   \n   * **图片压缩**：使用 WebP、AVIF 格式，压缩体积；小图用 Base64 结合 `lazyload`。\n   * **懒加载（Lazy Load）**：按需加载图片、视频、模块（如 Vue 的路由懒加载）。\n   * **Tree-shaking**：确保打包时移除未使用代码（Webpack、Vite 默认支持）。\n   * **压缩 JS/CSS**：使用 Terser、cssnano 等工具。\n   \n   ### ✅ 2. 网络请求优化\n   \n   * **开启 Gzip / Brotli 压缩**：减少传输体积。\n   * **开启 HTTP/2**：多路复用，加快资源加载。\n   * **缓存策略（强缓存 + 协商缓存）**：\n   \n     * `Cache-Control`, `ETag`，合理设置版本号。\n   \n   ---\n   \n   ## ⚡ 二、渲染性能优化\n   \n   ### ✅ 1. 减少重排重绘\n   \n   * **批量 DOM 操作**：使用 `DocumentFragment`、Vue 的 `v-show` 替代 `v-if`。\n   * **合并动画帧**：使用 `requestAnimationFrame` 替代 `setInterval`。\n   \n   ### ✅ 2. 虚拟列表 / 无限滚动\n   \n   * 如 `vue-virtual-scroller` 实现高性能长列表。\n   * 避免一次性渲染大量元素。\n   \n   ---\n   \n   ## 📱 三、移动端适配与体验优化\n   \n   ### ✅ 1. 响应式布局\n   \n   * 使用 `viewport`、媒体查询（Media Queries）、REM/VW 单位适配。\n   * 使用 Flexbox / Grid 做自适应布局。\n   \n   ### ✅ 2. 触摸响应优化\n   \n   * 移除 `300ms` 延迟：使用 `FastClick`（旧方案）或设置：\n   \n     ```html\n     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, user-scalable=no\">\n     ```\n   \n   * 使用 `passive` 事件监听提高滑动性能：\n   \n     ```js\n     window.addEventListener(\'touchmove\', handler, { passive: true });\n     ```\n   \n   ---\n   \n   ## 🧠 四、内存与资源管理\n   \n   ### ✅ 1. 避免内存泄漏\n   \n   * 清除定时器、事件监听器、全局变量。\n   * Vue 中使用 `beforeUnmount()` 做清理操作。\n   \n   ### ✅ 2. 限制资源占用\n   \n   * 避免一次性加载大图、长文本、复杂 SVG。\n   * 使用 `IntersectionObserver` 替代滚动监听。\n   \n   ---\n   \n   ## 🔧 五、构建优化工具链\n   \n   ### Webpack / Vite 配置优化：\n   \n   * 按需引入组件（如 Element Plus 的 `unplugin-vue-components`）\n   * 代码分包（SplitChunks）\n   * 使用 CDN 加速第三方库（如 Vue、Lodash）\n   \n   ### 图片工具：\n   \n   * `imagemin`、`tinypng`、`squoosh` 压图\n   * `vite-plugin-imagemin` 自动压缩\n   \n   ---\n   \n   ## 📊 六、性能监控和测试工具\n   \n   | 工具名称                             | 用途                |\n   | -------------------------------- | ----------------- |\n   | Lighthouse                       | 全面性能分析（加载、交互、SEO） |\n   | Chrome DevTools                  | 查看资源、性能瓶颈、内存泄漏    |\n   | WebPageTest / PageSpeed Insights | 网络和加载优化建议         |\n   | VConsole / eruda                 | 移动端调试控制台          |\n   | Performance API                  | 自定义性能监控点          |\n   \n   ---\n   \n   ## 🧩 七、进阶：PWA / 离线优化\n   \n   * 使用 **Service Worker** 缓存静态资源，提高二次加载速度。\n   * 安装 Web App Manifest，支持“添加到主屏幕”。\n   \n   ---\n   \n   ## ✅ 实战建议总结\n   \n   | 优化方向 | 推荐实践              |\n   | ---- | ----------------- |\n   | 加载速度 | Gzip、懒加载、资源压缩     |\n   | 渲染效率 | 虚拟列表、DOM 操作合并     |\n   | 体验流畅 | 触摸优化、异步动画         |\n   | 构建优化 | Tree-shaking、按需加载 |\n   | 数据处理 | 防抖节流、分页加载         |\n   | 监控预警 | 接入日志和性能监控 SDK     |\n   \n   ---\n   \n   如你有特定的技术栈（Vue、React、小程序、Hybrid、Flutter 等），我可以提供更定制化的优化策略或实战案例，要不要来一份针对你的项目的优化清单？\n</p>', '2025-06-24 16:41:50', '2025-07-03 14:40:05', 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-06-23 15:57:20', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-06-23 15:57:20', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-06-23 15:57:20', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-06-23 15:57:20', 'admin', '2025-06-25 14:38:35', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-06-23 15:57:20', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-06-23 15:57:20', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:10', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-06-23 15:57:11', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:20', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-23 15:57:20', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:20', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-06-23 15:57:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-06-23 15:57:20', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-06-23 15:57:19', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-06-23 15:57:20', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-06-23 15:57:20', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-06-23 15:57:20', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-23 16:06:44');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 11:06:28');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 11:07:53');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 11:08:51');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 11:09:51');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 11:20:58');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-25 11:21:02');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 11:21:06');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 11:25:26');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 14:37:38');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-25 14:38:40');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 14:38:44');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 14:38:50');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 15:07:45');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 15:50:00');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-25 15:51:05');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-27 17:16:52');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-28 08:37:35');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 10:12:24');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 10:13:59');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 14:42:23');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 15:20:25');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 17:08:36');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 17:38:31');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-02 17:41:45');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 17:41:47');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 18:16:06');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 18:34:29');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-02 18:38:26');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:22:59');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:57:16');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-03 08:59:42');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 08:59:44');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 09:03:19');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 10:11:13');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 10:45:38');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 11:12:51');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 11:17:38');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 14:20:03');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 15:11:24');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 15:25:20');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 15:27:56');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 15:29:34');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 16:21:19');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 17:16:37');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 17:40:02');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-03 19:41:21');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 08:36:24');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 10:07:37');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 13:38:29');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 13:52:53');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 13:56:19');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 13:56:48');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 14:03:29');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 14:22:56');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 14:37:52');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 14:53:01');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 15:17:29');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 16:04:48');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 16:51:10');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 17:21:30');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 17:21:52');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 17:22:20');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-04 17:22:26');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 17:23:12');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 18:20:31');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 18:29:09');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 18:36:41');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 19:00:10');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 19:06:13');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-04 19:59:12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2026 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-06-23 15:57:12', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-06-23 15:57:12', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-06-23 15:57:12', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-06-23 15:57:12', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-06-23 15:57:12', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-06-23 15:57:12', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-06-23 15:57:12', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-06-23 15:57:12', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-06-23 15:57:12', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-06-23 15:57:12', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-06-23 15:57:12', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-06-23 15:57:12', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-06-23 15:57:12', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-06-23 15:57:12', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-06-23 15:57:12', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-06-23 15:57:12', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-06-23 15:57:12', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-06-23 15:57:12', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-06-23 15:57:12', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-06-23 15:57:13', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-06-23 15:57:13', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-06-23 15:57:13', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-06-23 15:57:13', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-06-23 15:57:13', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-06-23 15:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-06-23 15:57:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-06-23 15:57:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-06-23 15:57:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-06-23 15:57:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-06-23 15:57:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-06-23 15:57:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-06-23 15:57:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-06-23 15:57:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '用户管理', 2018, 1, 'commonuser', 'commonuser/commonuser/index', NULL, '', 1, 0, 'C', '0', '0', 'commonuser:commonuser:list', 'user', 'admin', '2025-06-25 11:08:54', 'admin', '2025-06-25 11:19:45', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (2001, '用户管理查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'commonuser:commonuser:query', '#', 'admin', '2025-06-25 11:08:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '用户管理新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'commonuser:commonuser:add', '#', 'admin', '2025-06-25 11:08:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '用户管理修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'commonuser:commonuser:edit', '#', 'admin', '2025-06-25 11:08:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '用户管理删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'commonuser:commonuser:remove', '#', 'admin', '2025-06-25 11:08:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '用户管理导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'commonuser:commonuser:export', '#', 'admin', '2025-06-25 11:08:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '评论管理', 2018, 1, 'comment', 'jank/comment/index', NULL, '', 1, 0, 'C', '0', '0', 'jank:comment:list', 'message', 'admin', '2025-06-25 11:11:11', 'admin', '2025-06-25 11:19:57', '评论管理菜单');
INSERT INTO `sys_menu` VALUES (2007, '评论管理查询', 2006, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'comment:comment:query', '#', 'admin', '2025-06-25 11:11:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '评论管理新增', 2006, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'comment:comment:add', '#', 'admin', '2025-06-25 11:11:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '评论管理修改', 2006, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'comment:comment:edit', '#', 'admin', '2025-06-25 11:11:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '评论管理删除', 2006, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'comment:comment:remove', '#', 'admin', '2025-06-25 11:11:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '评论管理导出', 2006, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'comment:comment:export', '#', 'admin', '2025-06-25 11:11:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '类目管理', 2018, 1, 'category', 'jank/category/index', NULL, '', 1, 0, 'C', '1', '0', 'jank:category:list', 'tree', 'admin', '2025-06-25 11:12:04', 'admin', '2025-07-04 19:05:44', '类目管理菜单');
INSERT INTO `sys_menu` VALUES (2013, '类目管理查询', 2012, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'category:category:query', '#', 'admin', '2025-06-25 11:12:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '类目管理新增', 2012, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'category:category:add', '#', 'admin', '2025-06-25 11:12:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '类目管理修改', 2012, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'category:category:edit', '#', 'admin', '2025-06-25 11:12:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '类目管理删除', 2012, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'category:category:remove', '#', 'admin', '2025-06-25 11:12:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '类目管理导出', 2012, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'category:category:export', '#', 'admin', '2025-06-25 11:12:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '博客系统', 0, 0, 'jank', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'dict', 'admin', '2025-06-25 11:12:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '帖子管理', 2018, 1, 'postlist', 'postlist/postlist/index', NULL, '', 1, 0, 'C', '0', '0', 'postlist:postlist:list', 'documentation', 'admin', '2025-06-25 11:12:57', 'admin', '2025-07-03 08:28:11', '帖子菜单');
INSERT INTO `sys_menu` VALUES (2020, '帖子查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'postlist:postlist:query', '#', 'admin', '2025-06-25 11:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '帖子新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'postlist:postlist:add', '#', 'admin', '2025-06-25 11:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '帖子修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'postlist:postlist:edit', '#', 'admin', '2025-06-25 11:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '帖子删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'postlist:postlist:remove', '#', 'admin', '2025-06-25 11:12:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '帖子导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'postlist:postlist:export', '#', 'admin', '2025-06-25 11:12:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-06-23 15:57:20', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-06-23 15:57:20', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 427 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/06/23/YoyuEN_20250623160705A001.png\",\"code\":200}', 0, NULL, '2025-06-23 16:07:05', 505);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:04:19', 459);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"commonuser\",\"className\":\"CommonUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"用户昵称\",\"columnId\":2,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"用户邮箱\",\"columnId\":3,\"columnName\":\"email\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"email\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":4,\"columnName\":\"username\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isR', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:07:39', 297);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"post\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:09:22', 199);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"comment\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:10:09', 334);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"category\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:10:13', 217);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comment\",\"className\":\"Comment\",\"columns\":[{\"capJavaField\":\"CommentId\",\"columnComment\":\"评论唯一标识\",\"columnId\":21,\"columnName\":\"comment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"commentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"评论内容\",\"columnId\":22,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"content\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"评论所属用户ID\",\"columnId\":23,\"columnName\":\"user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PostId\",\"columnComment\":\"评论所属文章ID\",\"columnId\":24,\"columnName\":\"post_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:10:59', 239);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"Category\",\"columns\":[{\"capJavaField\":\"CategoryId\",\"columnComment\":\"类目唯一标识\",\"columnId\":29,\"columnName\":\"category_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"类目名称\",\"columnId\":30,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"类目描述\",\"columnId\":31,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父类目ID\",\"columnId\":32,\"columnName\":\"parent_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:10:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequir', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:11:52', 459);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"post\",\"className\":\"Post\",\"columns\":[{\"capJavaField\":\"PostId\",\"columnComment\":\"帖子唯一标识\",\"columnId\":12,\"columnName\":\"post_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"postId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"帖子标题\",\"columnId\":13,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"帖子封面图片URL\",\"columnId\":14,\"columnName\":\"image\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"image\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Visibility\",\"columnComment\":\"帖子可见性状态\",\"columnId\":15,\"columnName\":\"visibility\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:11:52', 309);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"postlist\",\"className\":\"Post\",\"columns\":[{\"capJavaField\":\"PostId\",\"columnComment\":\"帖子唯一标识\",\"columnId\":12,\"columnName\":\"post_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"postId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:11:52\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"帖子标题\",\"columnId\":13,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:11:52\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"帖子封面图片URL\",\"columnId\":14,\"columnName\":\"image\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"image\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:11:52\",\"usableColumn\":false},{\"capJavaField\":\"Visibility\",\"columnComment\":\"帖子可见性状态\",\"columnId\":15,\"columnName\":\"visibility\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:09:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:12:20', 192);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"jank\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:12:56', 132);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"zip\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评论管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2018,\"path\":\"comment\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:13:56', 51);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:15:05', 108);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"comment/comment/index\",\"createTime\":\"2025-06-25 11:11:11\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"comment\",\"perms\":\"comment:comment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:15:18', 80);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"category/category/index\",\"createTime\":\"2025-06-25 11:12:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"类目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"category\",\"perms\":\"category:category:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:15:24', 50);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"commonuser/commonuser/index\",\"createTime\":\"2025-06-25 11:08:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"commonuser\",\"perms\":\"commonuser:commonuser:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:15:31', 47);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"postlist/postlist/index\",\"createTime\":\"2025-06-25 11:12:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"帖子\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"postlist\",\"perms\":\"postlist:postlist:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:15:36', 60);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"jank/comment/index\",\"createTime\":\"2025-06-25 11:11:11\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"comment\",\"perms\":\"jank:comment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:16:28', 49);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"jank/category/index\",\"createTime\":\"2025-06-25 11:12:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"类目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"category\",\"perms\":\"jank:category:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:16:43', 83);
INSERT INTO `sys_oper_log` VALUES (119, '评论功能', 5, 'com.ruoyi.jank.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/jank/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-25 11:19:05', 526);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"jank/category/index\",\"createTime\":\"2025-06-25 11:12:04\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"类目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"category\",\"perms\":\"jank:category:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:19:25', 35);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"jank/comment/index\",\"createTime\":\"2025-06-25 11:11:11\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"comment\",\"perms\":\"jank:comment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:19:32', 44);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"commonuser/commonuser/index\",\"createTime\":\"2025-06-25 11:08:54\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"commonuser\",\"perms\":\"commonuser:commonuser:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:19:45', 69);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"postlist/postlist/index\",\"createTime\":\"2025-06-25 11:12:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"帖子\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"postlist\",\"perms\":\"postlist:postlist:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:19:51', 48);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"jank/comment/index\",\"createTime\":\"2025-06-25 11:11:11\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"comment\",\"perms\":\"jank:comment:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:19:57', 30);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"commonuser\",\"className\":\"CommonUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:07:39\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"用户昵称\",\"columnId\":2,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:07:39\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"用户邮箱\",\"columnId\":3,\"columnName\":\"email\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"email\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:07:39\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":4,\"columnName\":\"username\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":fals', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 11:26:30', 320);
INSERT INTO `sys_oper_log` VALUES (126, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2025-06-23 15:57:20\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:38:35', 102);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1937762479140515841\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:39:00', 33);
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1937762479140515841', '127.0.0.1', '内网IP', '[\"1937762479140515841\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:39:08', 58);
INSERT INTO `sys_oper_log` VALUES (129, '类目管理', 3, 'com.ruoyi.jank.controller.CategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/category/1,2,3,4,5,6', '127.0.0.1', '内网IP', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.ruoyi.jank.mapper.CategoryMapper.deleteById\r\n### Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.ruoyi.jank.mapper.CategoryMapper.deleteById', '2025-06-25 14:39:59', 36);
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1937762915301994498\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:40:44', 235);
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 2, 'com.ruoyi.jank.controller.CommonUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-06-25 14:40:44\",\"deleted\":0,\"updateTime\":\"2025-06-25 14:40:44\",\"userId\":\"1937762915301994498\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:40:53', 87);
INSERT INTO `sys_oper_log` VALUES (132, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1937762915301994498', '127.0.0.1', '内网IP', '[\"1937762915301994498\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:41:10', 55);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"commonuser\",\"className\":\"CommonUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"主键ID\",\"columnId\":1,\"columnName\":\"user_id\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:26:30\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"用户昵称\",\"columnId\":2,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:26:30\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"用户邮箱\",\"columnId\":3,\"columnName\":\"email\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"email\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-06-25 11:26:30\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名\",\"columnId\":4,\"columnName\":\"username\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-06-25 11:04:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"inc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:43:38', 686);
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1937763773909577729\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:44:08', 39);
INSERT INTO `sys_oper_log` VALUES (135, '用户管理', 2, 'com.ruoyi.jank.controller.CommonUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-06-25 14:44:08\",\"deleted\":0,\"updateTime\":\"2025-06-25 14:44:08\",\"userId\":\"1937763773909577729\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:44:11', 140);
INSERT INTO `sys_oper_log` VALUES (136, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1937763773909577729', '127.0.0.1', '内网IP', '[\"1937763773909577729\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:44:16', 110);
INSERT INTO `sys_oper_log` VALUES (137, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"4516@163.com\",\"nickname\":\"五大\",\"userId\":\"1937764412848877570\",\"username\":\"1324354657898\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:46:41', 21);
INSERT INTO `sys_oper_log` VALUES (138, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1937764412848877570', '127.0.0.1', '内网IP', '[\"1937764412848877570\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:47:08', 105);
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"4568@163.com\",\"nickname\":\"五大\",\"phone\":\"134567\",\"userId\":\"1937764592482529282\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:47:24', 42);
INSERT INTO `sys_oper_log` VALUES (140, '用户管理', 2, 'com.ruoyi.jank.controller.CommonUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-06-25 14:47:24\",\"deleted\":0,\"email\":\"4568@163.com\",\"nickname\":\"五大\",\"phone\":\"134567876543223456\",\"updateTime\":\"2025-06-25 14:47:24\",\"userId\":\"1937764592482529282\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:47:49', 80);
INSERT INTO `sys_oper_log` VALUES (141, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1937764592482529282', '127.0.0.1', '内网IP', '[\"1937764592482529282\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:47:53', 134);
INSERT INTO `sys_oper_log` VALUES (142, '类目管理', 1, 'com.ruoyi.jank.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"description\":\"<p><span style=\\\"background-color: rgb(255, 255, 255); color: rgb(25, 27, 31);\\\">我记得吸引我写博客的想法是源于有次我读到几个博主用讽刺手法在评论某个政客，辛辣的讽刺或者诙谐的描述都能引起极大的反响并吸引大量的引用链接。</span></p>\",\"name\":\"讽刺类\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:48:20', 381);
INSERT INTO `sys_oper_log` VALUES (143, '类目管理', 1, 'com.ruoyi.jank.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"description\":\"<p><span style=\\\"background-color: rgb(255, 255, 255); color: rgb(25, 27, 31);\\\">我记得吸引我写博客的想法是源于有次我读到几个博主用讽刺手法在评论某个政客，辛辣的讽刺或者诙谐的描述都能引起极大的反响并吸引大量的引用链接。</span></p>\",\"name\":\"讽刺类\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 14:51:07', 27);
INSERT INTO `sys_oper_log` VALUES (144, '类目管理', 5, 'com.ruoyi.jank.controller.CategoryController.export()', 'POST', 1, 'admin', '研发部门', '/jank/category/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-25 14:52:06', 609);
INSERT INTO `sys_oper_log` VALUES (145, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...\",\"name\":\"对比类1\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.jank.mapper.CategoryMapper.updateById', '2025-06-25 15:10:02', 4);
INSERT INTO `sys_oper_log` VALUES (146, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...\",\"name\":\"对比类1\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'name\' not found. Available parameters are [param1, et]', '2025-06-25 15:12:25', 7);
INSERT INTO `sys_oper_log` VALUES (147, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"对比类1\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'name\' not found. Available parameters are [param1, et]', '2025-06-25 15:13:53', 3);
INSERT INTO `sys_oper_log` VALUES (148, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'description\' not found. Available parameters are [param1, et]', '2025-06-25 15:15:08', 5);
INSERT INTO `sys_oper_log` VALUES (149, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'name\' not found. Available parameters are [param1, et]', '2025-06-25 15:18:37', 5);
INSERT INTO `sys_oper_log` VALUES (150, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'name\' not found. Available parameters are [param1, et]', '2025-06-25 15:19:51', 5);
INSERT INTO `sys_oper_log` VALUES (151, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'name\' not found. Available parameters are [param1, et]', '2025-06-25 15:26:22', 5);
INSERT INTO `sys_oper_log` VALUES (152, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'category_id\' in \'class com.ruoyi.jank.domain.Category\'', '2025-06-25 15:27:19', 6);
INSERT INTO `sys_oper_log` VALUES (153, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'category_id\' not found. Available parameters are [param1, et]', '2025-06-25 15:27:37', 8);
INSERT INTO `sys_oper_log` VALUES (154, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'category_id\' in \'class com.ruoyi.jank.domain.Category\'', '2025-06-25 15:27:57', 8);
INSERT INTO `sys_oper_log` VALUES (155, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>1对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"1对比类\",\"updatedAt\":\"2025-06-25 14:42:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:28:49', 34);
INSERT INTO `sys_oper_log` VALUES (156, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createdAt\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"<p>对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...</p>\",\"name\":\"对比类\",\"updatedAt\":\"2025-06-25 15:28:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:28:57', 28);
INSERT INTO `sys_oper_log` VALUES (157, '类目管理', 1, 'com.ruoyi.jank.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"description\":\"<p>11</p>\",\"name\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:33:38', 27);
INSERT INTO `sys_oper_log` VALUES (158, '类目管理', 3, 'com.ruoyi.jank.controller.CategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/category/11', '127.0.0.1', '内网IP', '[\"11\"]', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.ruoyi.jank.mapper.CategoryMapper.deleteById\r\n### Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.ruoyi.jank.mapper.CategoryMapper.deleteById', '2025-06-25 15:33:42', 33);
INSERT INTO `sys_oper_log` VALUES (159, '类目管理', 3, 'com.ruoyi.jank.controller.CategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/category/11', '127.0.0.1', '内网IP', '[\"11\"]', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.ruoyi.jank.mapper.CategoryMapper.deleteById\r\n### Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.ruoyi.jank.mapper.CategoryMapper.deleteById', '2025-06-25 15:34:33', 20);
INSERT INTO `sys_oper_log` VALUES (160, '类目管理', 3, 'com.ruoyi.jank.controller.CategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/category/11', '127.0.0.1', '内网IP', '[\"11\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:35:33', 97);
INSERT INTO `sys_oper_log` VALUES (161, '类目管理', 1, 'com.ruoyi.jank.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"description\":\"<p>12</p>\",\"name\":\"12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:35:55', 51);
INSERT INTO `sys_oper_log` VALUES (162, '类目管理', 5, 'com.ruoyi.jank.controller.CategoryController.export()', 'POST', 1, 'admin', '研发部门', '/jank/category/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-25 15:36:19', 94);
INSERT INTO `sys_oper_log` VALUES (163, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>1</p>\",\"postId\":\"1\",\"userId\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:51:24', 40);
INSERT INTO `sys_oper_log` VALUES (164, '评论功能', 5, 'com.ruoyi.jank.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/jank/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-25 15:51:27', 444);
INSERT INTO `sys_oper_log` VALUES (165, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/7', '127.0.0.1', '内网IP', '[\"7\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:52:32', 133);
INSERT INTO `sys_oper_log` VALUES (166, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/7', '127.0.0.1', '内网IP', '[\"7\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:52:35', 86);
INSERT INTO `sys_oper_log` VALUES (167, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>2</p>\",\"postId\":\"2\",\"userId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:55:13', 37);
INSERT INTO `sys_oper_log` VALUES (168, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/8', '127.0.0.1', '内网IP', '[\"8\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:55:20', 48);
INSERT INTO `sys_oper_log` VALUES (169, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>1</p>\",\"postId\":\"1\",\"userId\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:55:49', 19);
INSERT INTO `sys_oper_log` VALUES (170, '评论功能', 5, 'com.ruoyi.jank.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/jank/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-25 15:55:51', 58);
INSERT INTO `sys_oper_log` VALUES (171, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/9', '127.0.0.1', '内网IP', '[\"9\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:56:01', 44);
INSERT INTO `sys_oper_log` VALUES (172, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>4</p>\",\"postId\":\"4\",\"userId\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:58:10', 34);
INSERT INTO `sys_oper_log` VALUES (173, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>5</p>\",\"createdAt\":\"2025-06-25 15:58:10\",\"deleted\":0,\"postId\":\"5\",\"updatedAt\":\"2025-06-25 15:58:10\",\"userId\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:58:16', 56);
INSERT INTO `sys_oper_log` VALUES (174, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>6</p>\",\"createdAt\":\"2025-06-25 15:58:10\",\"deleted\":0,\"postId\":\"6\",\"updatedAt\":\"2025-06-25 15:58:10\",\"userId\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 15:58:22', 23);
INSERT INTO `sys_oper_log` VALUES (175, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>1</p>\",\"postId\":\"1\",\"userId\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 16:02:30', 53);
INSERT INTO `sys_oper_log` VALUES (176, '评论功能', 5, 'com.ruoyi.jank.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/jank/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-25 16:02:32', 103);
INSERT INTO `sys_oper_log` VALUES (177, '评论功能', 2, 'com.ruoyi.jank.controller.CommentController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"commentId\":13,\"content\":\"<p>1</p>\",\"createdAt\":\"2025-06-25 16:02:30\",\"deleted\":0,\"postId\":\"1\",\"updatedAt\":\"2025-06-25 16:02:30\",\"userId\":\"12\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.jank.domain.Comment\'', '2025-06-25 16:02:45', 5);
INSERT INTO `sys_oper_log` VALUES (178, '评论功能', 2, 'com.ruoyi.jank.controller.CommentController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"commentId\":13,\"content\":\"<p>1</p>\",\"createdAt\":\"2025-06-25 16:02:30\",\"deleted\":0,\"postId\":\"1\",\"updatedAt\":\"2025-06-25 16:02:30\",\"userId\":\"123\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.jank.domain.Comment\'', '2025-06-25 16:02:51', 2);
INSERT INTO `sys_oper_log` VALUES (179, '评论功能', 2, 'com.ruoyi.jank.controller.CommentController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"commentId\":13,\"content\":\"<p>1</p>\",\"createdAt\":\"2025-06-25 16:02:30\",\"deleted\":0,\"postId\":\"1\",\"updatedAt\":\"2025-06-25 16:02:30\",\"userId\":\"12\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'user_id\' in \'class com.ruoyi.jank.domain.Comment\'', '2025-06-25 16:03:15', 9);
INSERT INTO `sys_oper_log` VALUES (180, '评论功能', 1, 'com.ruoyi.jank.controller.CommentController.add()', 'POST', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"content\":\"<p>3</p>\",\"postId\":\"3\",\"userId\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 16:04:31', 39);
INSERT INTO `sys_oper_log` VALUES (181, '评论功能', 2, 'com.ruoyi.jank.controller.CommentController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"commentId\":14,\"content\":\"<p>3</p>\",\"createdAt\":\"2025-06-25 16:04:31\",\"deleted\":0,\"postId\":\"32\",\"updatedAt\":\"2025-06-25 16:04:31\",\"userId\":\"32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 16:04:38', 37);
INSERT INTO `sys_oper_log` VALUES (182, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/14', '127.0.0.1', '内网IP', '[\"14\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-25 16:04:42', 99);
INSERT INTO `sys_oper_log` VALUES (183, '评论功能', 5, 'com.ruoyi.jank.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/jank/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-06-25 16:04:43', 92);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"2149923113@qq.com\",\"userId\":\"1940353951864541186\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-02 18:16:19', 35);
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"214992311@qq.com\",\"userId\":\"1940354029555634178\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-02 18:16:37', 28);
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940353951864541186', '127.0.0.1', '内网IP', '[\"1940353951864541186\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-02 18:16:54', 58);
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940354029555634178', '127.0.0.1', '内网IP', '[\"1940354029555634178\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-02 18:16:56', 32);
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"2149923113@qq.com\",\"userId\":\"1940359283663810562\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommonUserMapper.java (best guess)\r\n### The error may involve com.ruoyi.jank.mapper.CommonUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO user  ( user_id,  email )  VALUES  ( ?,  ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\n; Duplicate entry \'2149923113@qq.com\' for key \'user.email\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'', '2025-07-02 18:37:30', 136);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"postlist/postlist/index\",\"createTime\":\"2025-06-25 11:12:57\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"帖子管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"postlist\",\"perms\":\"postlist:postlist:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 08:28:11', 45);
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"2149923113@qq.com\",\"userId\":\"1940576705318576129\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommonUserMapper.java (best guess)\r\n### The error may involve com.ruoyi.jank.mapper.CommonUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO user  ( user_id,  email )  VALUES  ( ?,  ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\n; Duplicate entry \'2149923113@qq.com\' for key \'user.email\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'', '2025-07-03 09:01:26', 95);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"2149923113@qq.com\",\"userId\":\"1940576924026363906\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommonUserMapper.java (best guess)\r\n### The error may involve com.ruoyi.jank.mapper.CommonUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO user  ( user_id,  email )  VALUES  ( ?,  ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\n; Duplicate entry \'2149923113@qq.com\' for key \'user.email\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'', '2025-07-03 09:02:18', 30);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940577360347250690\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:04:02', 46);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940577360347250690', '127.0.0.1', '内网IP', '[\"1940577360347250690\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:07:03', 192);
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"nickname\":\"8888\",\"userId\":\"1940578664704491521\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:09:13', 55);
INSERT INTO `sys_oper_log` VALUES (195, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940579163021361153\",\"username\":\"7777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:11:12', 22);
INSERT INTO `sys_oper_log` VALUES (196, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/西夏区\",\"userId\":\"1940582829325402114\",\"username\":\"77\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:25:46', 93);
INSERT INTO `sys_oper_log` VALUES (197, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940582829325402114,1940579163021361153,1940578664704491521,1938899140111585281', '127.0.0.1', '内网IP', '[\"1940582829325402114\",\"1940579163021361153\",\"1940578664704491521\",\"1938899140111585281\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:26:13', 134);
INSERT INTO `sys_oper_log` VALUES (198, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/西夏区\",\"email\":\"2149923113@qq.com\",\"userId\":\"1940583013874778114\",\"username\":\"yx\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommonUserMapper.java (best guess)\r\n### The error may involve com.ruoyi.jank.mapper.CommonUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO user  ( user_id,  email, username,         address )  VALUES  ( ?,  ?, ?,         ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'\n; Duplicate entry \'2149923113@qq.com\' for key \'user.email\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2149923113@qq.com\' for key \'user.email\'', '2025-07-03 09:26:30', 147);
INSERT INTO `sys_oper_log` VALUES (199, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/西夏区\",\"email\":\"149923113@qq.com\",\"userId\":\"1940583382742843394\",\"username\":\"yx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:27:58', 31);
INSERT INTO `sys_oper_log` VALUES (200, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"\",\"email\":\"1423113@qq.com\",\"userId\":\"1940583453924376577\",\"username\":\"yc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:28:15', 42);
INSERT INTO `sys_oper_log` VALUES (201, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"\",\"email\":\"14233@qq.com\",\"userId\":\"1940583528276803585\",\"username\":\"yc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:28:33', 200);
INSERT INTO `sys_oper_log` VALUES (202, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940583453924376577,1940583528276803585', '127.0.0.1', '内网IP', '[\"1940583453924376577\",\"1940583528276803585\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:28:48', 97);
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/兴庆区\",\"email\":\"14233@qq.com\",\"userId\":\"1940583653812322305\",\"username\":\"yc\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14233@qq.com\' for key \'user.email\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommonUserMapper.java (best guess)\r\n### The error may involve com.ruoyi.jank.mapper.CommonUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO user  ( user_id,  email, username,         address )  VALUES  ( ?,  ?, ?,         ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14233@qq.com\' for key \'user.email\'\n; Duplicate entry \'14233@qq.com\' for key \'user.email\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'14233@qq.com\' for key \'user.email\'', '2025-07-03 09:29:02', 43);
INSERT INTO `sys_oper_log` VALUES (204, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/兴庆区\",\"email\":\"142@qq.com\",\"userId\":\"1940583680379043842\",\"username\":\"yc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:29:09', 40);
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/西夏区\",\"email\":\"2@qq.com\",\"userId\":\"1940585490867142657\",\"username\":\"7777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:36:21', 195);
INSERT INTO `sys_oper_log` VALUES (206, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/西夏区\",\"email\":\"2149923@qq.com\",\"phone\":\"154894151\",\"userId\":\"1940587853942210561\",\"username\":\"999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:45:44', 67);
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/兴庆区\",\"email\":\"2123@qq.com\",\"phone\":\"21311515\",\"userId\":\"1940587946925735937\",\"username\":\"984849\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 09:46:06', 147);
INSERT INTO `sys_oper_log` VALUES (208, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"email\":\"223@qq.com\",\"phone\":\"1727252\",\"userId\":\"1940591464193572866\",\"username\":\"77777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:00:05', 109);
INSERT INTO `sys_oper_log` VALUES (209, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940591634641698818\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:00:45', 32);
INSERT INTO `sys_oper_log` VALUES (210, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏回族自治区/石嘴山市\",\"userId\":\"1940593397801271297\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:07:46', 85);
INSERT INTO `sys_oper_log` VALUES (211, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940602996411404289\",\"username\":\"777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:45:54', 56);
INSERT INTO `sys_oper_log` VALUES (212, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940603048877953026\",\"username\":\"7777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:46:06', 43);
INSERT INTO `sys_oper_log` VALUES (213, '用户管理', 2, 'com.ruoyi.jank.controller.CommonUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"宁夏自治区/银川市/西夏区\",\"createTime\":\"2025-07-03 09:36:20\",\"deleted\":0,\"email\":\"2@qq.com\",\"freeze\":1,\"updateTime\":\"2025-07-03 09:36:20\",\"userId\":\"1940585490867142657\",\"username\":\"77777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:46:15', 40);
INSERT INTO `sys_oper_log` VALUES (214, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940603739700793345\",\"username\":\"杨旭\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:48:51', 30);
INSERT INTO `sys_oper_log` VALUES (215, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940603762345840642\",\"username\":\"777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:48:57', 27);
INSERT INTO `sys_oper_log` VALUES (216, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940603790976159745\",\"username\":\"777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 10:49:03', 29);
INSERT INTO `sys_oper_log` VALUES (217, '类目管理', 5, 'com.ruoyi.jank.controller.CategoryController.export()', 'POST', 1, 'admin', '研发部门', '/jank/category/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-03 15:35:48', 819);
INSERT INTO `sys_oper_log` VALUES (218, '评论功能', 5, 'com.ruoyi.jank.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/jank/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-03 15:35:55', 126);
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 5, 'com.ruoyi.jank.controller.CommonUserController.export()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-03 15:43:56', 105);
INSERT INTO `sys_oper_log` VALUES (220, '用户管理', 5, 'com.ruoyi.jank.controller.CommonUserController.export()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-03 15:45:50', 141);
INSERT INTO `sys_oper_log` VALUES (221, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938887603814252546\"}', NULL, 1, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'userId\', mode=IN, javaType=class java.lang.Integer, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #2 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.lang.ClassCastException: class java.lang.String cannot be cast to class java.lang.Integer (java.lang.String and java.lang.Integer are in module java.base of loader \'bootstrap\')', '2025-07-03 16:41:51', 23);
INSERT INTO `sys_oper_log` VALUES (222, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938887603814252546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 16:46:11', 73);
INSERT INTO `sys_oper_log` VALUES (223, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938887603814252546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 16:46:14', 47);
INSERT INTO `sys_oper_log` VALUES (224, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938887603814252546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 16:46:29', 24);
INSERT INTO `sys_oper_log` VALUES (225, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 16:46:45', 23);
INSERT INTO `sys_oper_log` VALUES (226, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0}', '{\"msg\":\"状态更新失败\",\"code\":500}', 0, NULL, '2025-07-03 16:48:42', 124);
INSERT INTO `sys_oper_log` VALUES (227, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 16:53:26', 165);
INSERT INTO `sys_oper_log` VALUES (228, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0}', '{\"msg\":\"状态更新失败\",\"code\":500}', 0, NULL, '2025-07-03 16:54:34', 45);
INSERT INTO `sys_oper_log` VALUES (229, '用户管理', 2, 'com.ruoyi.jank.controller.CommonUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"avatar\":\"YoyuEN.png\",\"createTime\":\"2025-06-28 14:50:07\",\"deleted\":0,\"freeze\":0,\"updateTime\":\"2025-07-03 16:53:26\",\"userId\":\"1938852475338047490\",\"username\":\"杨旭\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 16:55:41', 141);
INSERT INTO `sys_oper_log` VALUES (230, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 16:55:51', 71);
INSERT INTO `sys_oper_log` VALUES (231, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0}', '{\"msg\":\"状态更新失败\",\"code\":500}', 0, NULL, '2025-07-03 16:55:54', 72);
INSERT INTO `sys_oper_log` VALUES (232, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938887603814252546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:10:40', 38);
INSERT INTO `sys_oper_log` VALUES (233, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938887603814252546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:10:47', 42);
INSERT INTO `sys_oper_log` VALUES (234, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0}', '{\"msg\":\"状态更新失败\",\"code\":500}', 0, NULL, '2025-07-03 17:11:42', 40);
INSERT INTO `sys_oper_log` VALUES (235, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/西城区\",\"email\":\"22000003@qq.com\",\"phone\":\"154485\",\"userId\":\"1940700748147408898\",\"username\":\"yx\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:14:19', 85);
INSERT INTO `sys_oper_log` VALUES (236, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940700748147408898', '127.0.0.1', '内网IP', '[\"1940700748147408898\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:14:36', 153);
INSERT INTO `sys_oper_log` VALUES (237, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1937794761217912834', '127.0.0.1', '内网IP', '[\"1937794761217912834\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:15:22', 125);
INSERT INTO `sys_oper_log` VALUES (238, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:15:28', 37);
INSERT INTO `sys_oper_log` VALUES (239, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:15:34', 93);
INSERT INTO `sys_oper_log` VALUES (240, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:21:41', 122);
INSERT INTO `sys_oper_log` VALUES (241, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938076012868915202\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:21:43', 104);
INSERT INTO `sys_oper_log` VALUES (242, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938076012868915202\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:21:45', 83);
INSERT INTO `sys_oper_log` VALUES (243, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:21:57', 64);
INSERT INTO `sys_oper_log` VALUES (244, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"email\":\"2149923113@qq.com\",\"phone\":\"15148261811\",\"userId\":\"1940708052309725185\",\"username\":\"yc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:43:21', 45);
INSERT INTO `sys_oper_log` VALUES (245, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"email\":\"2149923114@qq.com\",\"userId\":\"1940708427569909761\",\"username\":\"789\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:44:50', 25);
INSERT INTO `sys_oper_log` VALUES (246, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940708442761678849\",\"username\":\"777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:44:54', 18);
INSERT INTO `sys_oper_log` VALUES (247, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940708453750755330\",\"username\":\"888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:44:56', 20);
INSERT INTO `sys_oper_log` VALUES (248, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940708465658384386\",\"username\":\"999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:44:59', 18);
INSERT INTO `sys_oper_log` VALUES (249, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940708481051480065\",\"username\":\"1010\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:45:03', 25);
INSERT INTO `sys_oper_log` VALUES (250, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940708496926920706\",\"username\":\"01111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:45:07', 22);
INSERT INTO `sys_oper_log` VALUES (251, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938887603814252546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:47:18', 28);
INSERT INTO `sys_oper_log` VALUES (252, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940708465658384386\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-03 17:47:20', 27);
INSERT INTO `sys_oper_log` VALUES (253, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940708442761678849\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:09:16', 113);
INSERT INTO `sys_oper_log` VALUES (254, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940708465658384386\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:13:04', 60);
INSERT INTO `sys_oper_log` VALUES (255, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940708442761678849\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:13:05', 37);
INSERT INTO `sys_oper_log` VALUES (256, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940708453750755330\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:13:08', 20);
INSERT INTO `sys_oper_log` VALUES (257, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940708427569909761\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 09:13:09', 20);
INSERT INTO `sys_oper_log` VALUES (258, '类目管理', 1, 'com.ruoyi.jank.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"description\":\"<p>999</p>\",\"name\":\"888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:00:26', 38);
INSERT INTO `sys_oper_log` VALUES (259, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":13,\"createTime\":\"2025-07-04 10:00:26\",\"deleted\":0,\"description\":\"<p>999</p>\",\"name\":\"后端\",\"updateTime\":\"2025-07-04 10:00:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:04:57', 28);
INSERT INTO `sys_oper_log` VALUES (260, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":13,\"createTime\":\"2025-07-04 10:00:26\",\"deleted\":0,\"description\":\"<p>999</p>\",\"name\":\"后端\",\"updateTime\":\"2025-07-04 10:04:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:05:06', 24);
INSERT INTO `sys_oper_log` VALUES (261, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":13,\"createTime\":\"2025-07-04 10:00:26\",\"deleted\":0,\"description\":\"<p>999</p>\",\"name\":\"算法\",\"updateTime\":\"2025-07-04 10:05:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:05:39', 23);
INSERT INTO `sys_oper_log` VALUES (262, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940708465658384386', '127.0.0.1', '内网IP', '[\"1940708465658384386\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:08:42', 91);
INSERT INTO `sys_oper_log` VALUES (263, '用户管理', 5, 'com.ruoyi.jank.controller.CommonUserController.export()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-04 10:08:44', 934);
INSERT INTO `sys_oper_log` VALUES (264, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940708496926920706', '127.0.0.1', '内网IP', '[\"1940708496926920706\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:11:44', 314);
INSERT INTO `sys_oper_log` VALUES (265, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940708481051480065,1940708442761678849', '127.0.0.1', '内网IP', '[\"1940708481051480065\",\"1940708442761678849\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:11:50', 327);
INSERT INTO `sys_oper_log` VALUES (266, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940708453750755330', '127.0.0.1', '内网IP', '[\"1940708453750755330\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:11:57', 71);
INSERT INTO `sys_oper_log` VALUES (267, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940708427569909761', '127.0.0.1', '内网IP', '[\"1940708427569909761\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:12:53', 66);
INSERT INTO `sys_oper_log` VALUES (268, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957150103293954\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:08', 21);
INSERT INTO `sys_oper_log` VALUES (269, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957161042038785\",\"username\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:11', 43);
INSERT INTO `sys_oper_log` VALUES (270, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957170546331649\",\"username\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:13', 21);
INSERT INTO `sys_oper_log` VALUES (271, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957185490636802\",\"username\":\"444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:17', 21);
INSERT INTO `sys_oper_log` VALUES (272, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957197419237378\",\"username\":\"555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:19', 29);
INSERT INTO `sys_oper_log` VALUES (273, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957207246491649\",\"username\":\"666\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:22', 28);
INSERT INTO `sys_oper_log` VALUES (274, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940957161042038785\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:24', 226);
INSERT INTO `sys_oper_log` VALUES (275, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940957150103293954\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:25', 57);
INSERT INTO `sys_oper_log` VALUES (276, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940957207246491649', '127.0.0.1', '内网IP', '[\"1940957207246491649\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:35', 81);
INSERT INTO `sys_oper_log` VALUES (277, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940957197419237378,1940957185490636802', '127.0.0.1', '内网IP', '[\"1940957197419237378\",\"1940957185490636802\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:39', 159);
INSERT INTO `sys_oper_log` VALUES (278, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940957161042038785', '127.0.0.1', '内网IP', '[\"1940957161042038785\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:13:44', 244);
INSERT INTO `sys_oper_log` VALUES (279, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957818109120514\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:15:47', 24);
INSERT INTO `sys_oper_log` VALUES (280, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940957858810646529\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:15:57', 23);
INSERT INTO `sys_oper_log` VALUES (281, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940957858810646529', '127.0.0.1', '内网IP', '[\"1940957858810646529\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:17:43', 67);
INSERT INTO `sys_oper_log` VALUES (282, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940957818109120514,1940957170546331649', '127.0.0.1', '内网IP', '[\"1940957818109120514\",\"1940957170546331649\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:17:47', 318);
INSERT INTO `sys_oper_log` VALUES (283, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940708052309725185\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:17:53', 97);
INSERT INTO `sys_oper_log` VALUES (284, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940957150103293954', '127.0.0.1', '内网IP', '[\"1940957150103293954\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:17:56', 43);
INSERT INTO `sys_oper_log` VALUES (285, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940958694630576129\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:19:16', 19);
INSERT INTO `sys_oper_log` VALUES (286, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940958707981045762\",\"username\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:19:20', 19);
INSERT INTO `sys_oper_log` VALUES (287, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940958718965927937\",\"username\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:19:22', 36);
INSERT INTO `sys_oper_log` VALUES (288, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940958730701590530\",\"username\":\"4444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:19:25', 23);
INSERT INTO `sys_oper_log` VALUES (289, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940958740495290370\",\"username\":\"5555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:19:27', 32);
INSERT INTO `sys_oper_log` VALUES (290, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940958751354343425\",\"username\":\"666\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:19:30', 39);
INSERT INTO `sys_oper_log` VALUES (291, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940958751354343425', '127.0.0.1', '内网IP', '[\"1940958751354343425\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:20:23', 62);
INSERT INTO `sys_oper_log` VALUES (292, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940958740495290370,1940958730701590530', '127.0.0.1', '内网IP', '[\"1940958740495290370\",\"1940958730701590530\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:20:27', 112);
INSERT INTO `sys_oper_log` VALUES (293, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940958718965927937\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:20:30', 37);
INSERT INTO `sys_oper_log` VALUES (294, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940958707981045762\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:20:32', 39);
INSERT INTO `sys_oper_log` VALUES (295, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940958694630576129\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:20:33', 43);
INSERT INTO `sys_oper_log` VALUES (296, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940958694630576129', '127.0.0.1', '内网IP', '[\"1940958694630576129\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:20:37', 117);
INSERT INTO `sys_oper_log` VALUES (297, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940958718965927937,1940958707981045762', '127.0.0.1', '内网IP', '[\"1940958718965927937\",\"1940958707981045762\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:20:41', 118);
INSERT INTO `sys_oper_log` VALUES (298, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940959621299130370\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:22:57', 52);
INSERT INTO `sys_oper_log` VALUES (299, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940959633638772738\",\"username\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:23:00', 18);
INSERT INTO `sys_oper_log` VALUES (300, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940959643537330178\",\"username\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:23:03', 72);
INSERT INTO `sys_oper_log` VALUES (301, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940959654849368066\",\"username\":\"444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:23:05', 74);
INSERT INTO `sys_oper_log` VALUES (302, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940959665242853378\",\"username\":\"555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:23:08', 40);
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940959674902335489\",\"username\":\"666\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:23:10', 35);
INSERT INTO `sys_oper_log` VALUES (304, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940959674902335489', '127.0.0.1', '内网IP', '[\"1940959674902335489\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:28:46', 69);
INSERT INTO `sys_oper_log` VALUES (305, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940959665242853378,1940959654849368066', '127.0.0.1', '内网IP', '[\"1940959665242853378\",\"1940959654849368066\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:28:49', 106);
INSERT INTO `sys_oper_log` VALUES (306, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940959643537330178\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:28:54', 22);
INSERT INTO `sys_oper_log` VALUES (307, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940959633638772738\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:28:56', 25);
INSERT INTO `sys_oper_log` VALUES (308, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940959621299130370\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:28:57', 19);
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940959643537330178', '127.0.0.1', '内网IP', '[\"1940959643537330178\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:30:11', 65);
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940962125558665217\",\"username\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:32:54', 37);
INSERT INTO `sys_oper_log` VALUES (311, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940962144323981314\",\"username\":\"444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:32:59', 24);
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940962159079542786\",\"username\":\"655\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:33:02', 27);
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940962159079542786', '127.0.0.1', '内网IP', '[\"1940962159079542786\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:53:58', 53);
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940962144323981314,1940962125558665217', '127.0.0.1', '内网IP', '[\"1940962144323981314\",\"1940962125558665217\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:54:02', 50);
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940959633638772738', '127.0.0.1', '内网IP', '[\"1940959633638772738\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 10:54:12', 934);
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940708052309725185', '127.0.0.1', '内网IP', '[\"1940708052309725185\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:04:28', 43);
INSERT INTO `sys_oper_log` VALUES (317, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938887603814252546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:08:22', 23);
INSERT INTO `sys_oper_log` VALUES (318, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:08:26', 34);
INSERT INTO `sys_oper_log` VALUES (319, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1938887603814252546', '127.0.0.1', '内网IP', '[\"1938887603814252546\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:08:45', 50);
INSERT INTO `sys_oper_log` VALUES (320, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972038338990081\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:18', 20);
INSERT INTO `sys_oper_log` VALUES (321, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972049189654529\",\"username\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:20', 21);
INSERT INTO `sys_oper_log` VALUES (322, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972059398590465\",\"username\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:23', 16);
INSERT INTO `sys_oper_log` VALUES (323, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972068273737729\",\"username\":\"444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:25', 17);
INSERT INTO `sys_oper_log` VALUES (324, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972080378499074\",\"username\":\"555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:28', 52);
INSERT INTO `sys_oper_log` VALUES (325, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972089366892546\",\"username\":\"666\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:30', 20);
INSERT INTO `sys_oper_log` VALUES (326, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972102713167873\",\"username\":\"777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:33', 42);
INSERT INTO `sys_oper_log` VALUES (327, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972112666251265\",\"username\":\"888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:35', 22);
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940972122371870722\",\"username\":\"999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:12:38', 21);
INSERT INTO `sys_oper_log` VALUES (329, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940972112666251265\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:14:16', 28);
INSERT INTO `sys_oper_log` VALUES (330, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940972102713167873\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:15:48', 30);
INSERT INTO `sys_oper_log` VALUES (331, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940972089366892546\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:15:49', 22);
INSERT INTO `sys_oper_log` VALUES (332, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940972080378499074', '127.0.0.1', '内网IP', '[\"1940972080378499074\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:16:37', 42);
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940972068273737729', '127.0.0.1', '内网IP', '[\"1940972068273737729\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:16:43', 42);
INSERT INTO `sys_oper_log` VALUES (334, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940972122371870722\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:16:53', 15);
INSERT INTO `sys_oper_log` VALUES (335, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"天津市/县/静海县\",\"userId\":\"1940973358156435457\",\"username\":\"yx1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:17:33', 137);
INSERT INTO `sys_oper_log` VALUES (336, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"天津市/县/静海县\",\"userId\":\"1940973772402675713\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:19:11', 50);
INSERT INTO `sys_oper_log` VALUES (337, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940973783937011714\",\"username\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:19:14', 28);
INSERT INTO `sys_oper_log` VALUES (338, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940973793441304577\",\"username\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:19:16', 28);
INSERT INTO `sys_oper_log` VALUES (339, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1940973803574743042\",\"username\":\"444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:19:19', 35);
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"userId\":\"1940974401305006081\",\"username\":\"555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:21:41', 31);
INSERT INTO `sys_oper_log` VALUES (341, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940973772402675713', '127.0.0.1', '内网IP', '[\"1940973772402675713\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:21:52', 53);
INSERT INTO `sys_oper_log` VALUES (342, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"天津市/县/静海县\",\"userId\":\"1940974529910755330\",\"username\":\"777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:22:12', 44);
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"天津市/县/宁河县\",\"userId\":\"1940974725424041986\",\"username\":\"888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:22:58', 30);
INSERT INTO `sys_oper_log` VALUES (344, '用户管理', 5, 'com.ruoyi.jank.controller.CommonUserController.export()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-04 11:23:05', 86);
INSERT INTO `sys_oper_log` VALUES (345, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940974725424041986', '127.0.0.1', '内网IP', '[\"1940974725424041986\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:23:14', 55);
INSERT INTO `sys_oper_log` VALUES (346, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940974529910755330\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:23:19', 26);
INSERT INTO `sys_oper_log` VALUES (347, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940974529910755330\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:24:30', 20);
INSERT INTO `sys_oper_log` VALUES (348, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940974529910755330\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:24:34', 19);
INSERT INTO `sys_oper_log` VALUES (349, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940974529910755330\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:25:40', 26);
INSERT INTO `sys_oper_log` VALUES (350, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940974401305006081\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:25:41', 25);
INSERT INTO `sys_oper_log` VALUES (351, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940973803574743042\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:25:44', 17);
INSERT INTO `sys_oper_log` VALUES (352, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"userId\":\"1940979668411305985\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:42:37', 21);
INSERT INTO `sys_oper_log` VALUES (353, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"userId\":\"1940980183115321346\",\"username\":\"888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:44:40', 16);
INSERT INTO `sys_oper_log` VALUES (354, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"天津市/市辖区/河东区\",\"userId\":\"1940980903763857410\",\"username\":\"999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:47:31', 22);
INSERT INTO `sys_oper_log` VALUES (355, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"userId\":\"1940982590754869250\",\"username\":\"11111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 11:54:14', 72);
INSERT INTO `sys_oper_log` VALUES (356, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"山西省/长治市\",\"userId\":\"1940987367421202434\",\"username\":\"7878\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 12:13:13', 24);
INSERT INTO `sys_oper_log` VALUES (357, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"userId\":\"1940996858413928449\",\"username\":\"75757\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 12:50:55', 45);
INSERT INTO `sys_oper_log` VALUES (358, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940996858413928449\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:48:17', 34);
INSERT INTO `sys_oper_log` VALUES (359, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940987367421202434\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:48:20', 36);
INSERT INTO `sys_oper_log` VALUES (360, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940982590754869250\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:48:21', 19);
INSERT INTO `sys_oper_log` VALUES (361, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940980903763857410\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:53:02', 29);
INSERT INTO `sys_oper_log` VALUES (362, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区\",\"email\":\"\",\"phone\":\"\",\"userId\":\"1941012523799650305\",\"username\":\"111111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:53:42', 24);
INSERT INTO `sys_oper_log` VALUES (363, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/西城区\",\"userId\":\"1941013430486540290\",\"username\":\"7787878\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:57:18', 20);
INSERT INTO `sys_oper_log` VALUES (364, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941013430486540290', '127.0.0.1', '内网IP', '[\"1941013430486540290\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:57:24', 54);
INSERT INTO `sys_oper_log` VALUES (365, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1941012523799650305\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:57:26', 30);
INSERT INTO `sys_oper_log` VALUES (366, '用户管理', 5, 'com.ruoyi.jank.controller.CommonUserController.export()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-04 13:57:33', 554);
INSERT INTO `sys_oper_log` VALUES (367, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1940980183115321346', '127.0.0.1', '内网IP', '[\"1940980183115321346\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:58:35', 38);
INSERT INTO `sys_oper_log` VALUES (368, '评论功能', 2, 'com.ruoyi.jank.controller.CommentController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/comment', '127.0.0.1', '内网IP', '{\"commentId\":\"10be2b15-bc0b-488a-b811-191393d6e6b0\",\"content\":\"<p>我是大好人！</p>\",\"createTime\":\"2025-07-04 13:52:23\",\"deleted\":0,\"postId\":\"1938503494189305857\",\"updateTime\":\"2025-07-04 13:52:23\",\"userId\":\"1937794761217912834\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:59:12', 24);
INSERT INTO `sys_oper_log` VALUES (369, '评论功能', 5, 'com.ruoyi.jank.controller.CommentController.export()', 'POST', 1, 'admin', '研发部门', '/jank/comment/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-04 13:59:14', 56);
INSERT INTO `sys_oper_log` VALUES (370, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/10be2b15-bc0b-488a-b811-191393d6e6b0,1009e5f6-1829-4140-8e75-2f2c5d6f38f2', '127.0.0.1', '内网IP', '[\"10be2b15-bc0b-488a-b811-191393d6e6b0\",\"1009e5f6-1829-4140-8e75-2f2c5d6f38f2\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 13:59:28', 45);
INSERT INTO `sys_oper_log` VALUES (371, '类目管理', 5, 'com.ruoyi.jank.controller.CategoryController.export()', 'POST', 1, 'admin', '研发部门', '/jank/category/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-07-04 14:00:07', 55);
INSERT INTO `sys_oper_log` VALUES (372, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createTime\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...\",\"name\":\"前端\",\"postId\":\"post_001\",\"updateTime\":\"2025-07-03 14:42:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:00:23', 22);
INSERT INTO `sys_oper_log` VALUES (373, '类目管理', 2, 'com.ruoyi.jank.controller.CategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"createTime\":\"2025-06-25 14:42:29\",\"deleted\":0,\"description\":\"对二个或者更多的解决方案进行对比分析。 对二个供选择的产品或服务列出各自的优点和缺点...\",\"name\":\"ddddd\",\"postId\":\"post_001\",\"updateTime\":\"2025-07-04 14:00:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:00:36', 25);
INSERT INTO `sys_oper_log` VALUES (374, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1940979668411305985\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:53', 29);
INSERT INTO `sys_oper_log` VALUES (375, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:54', 17);
INSERT INTO `sys_oper_log` VALUES (376, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1938076012868915202\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:55', 20);
INSERT INTO `sys_oper_log` VALUES (377, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"32131221312\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:55', 24);
INSERT INTO `sys_oper_log` VALUES (378, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"32131221312\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:56', 37);
INSERT INTO `sys_oper_log` VALUES (379, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938076012868915202\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:56', 24);
INSERT INTO `sys_oper_log` VALUES (380, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1938852475338047490\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:56', 16);
INSERT INTO `sys_oper_log` VALUES (381, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940979668411305985\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:57', 19);
INSERT INTO `sys_oper_log` VALUES (382, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940980903763857410\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:57', 18);
INSERT INTO `sys_oper_log` VALUES (383, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940982590754869250\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:58', 62);
INSERT INTO `sys_oper_log` VALUES (384, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940987367421202434\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:58', 17);
INSERT INTO `sys_oper_log` VALUES (385, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1941012523799650305\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:11:59', 20);
INSERT INTO `sys_oper_log` VALUES (386, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1940996858413928449\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:12:00', 49);
INSERT INTO `sys_oper_log` VALUES (387, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/07/04/微信头像_20250704141235A001.jpg\",\"code\":200}', 0, NULL, '2025-07-04 14:12:35', 72);
INSERT INTO `sys_oper_log` VALUES (388, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区/150号\",\"userId\":\"1941019942843965441\",\"username\":\"7171717\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:23:11', 40);
INSERT INTO `sys_oper_log` VALUES (389, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/西城区/789号\",\"userId\":\"1941023034192814082\",\"username\":\"75757575\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:35:28', 40);
INSERT INTO `sys_oper_log` VALUES (390, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区/789号\",\"userId\":\"1941023285834276865\",\"username\":\"757575\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:36:28', 82);
INSERT INTO `sys_oper_log` VALUES (391, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1941023285834276865\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:36:31', 28);
INSERT INTO `sys_oper_log` VALUES (392, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1941023285834276865\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 14:36:33', 25);
INSERT INTO `sys_oper_log` VALUES (393, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941045601133735938\",\"username\":\"757575\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 16:05:08', 99);
INSERT INTO `sys_oper_log` VALUES (394, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941045809582256129\",\"username\":\"757575\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 16:05:58', 143);
INSERT INTO `sys_oper_log` VALUES (395, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941045809582256129', '127.0.0.1', '内网IP', '[\"1941045809582256129\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 16:06:03', 164);
INSERT INTO `sys_oper_log` VALUES (396, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941045601133735938', '127.0.0.1', '内网IP', '[\"1941045601133735938\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 16:06:05', 116);
INSERT INTO `sys_oper_log` VALUES (397, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941050557806940162\",\"username\":\"test2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 16:24:50', 151);
INSERT INTO `sys_oper_log` VALUES (398, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1941050557806940162\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:25:35', 30);
INSERT INTO `sys_oper_log` VALUES (399, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941065950885949441\",\"username\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:26:00', 37);
INSERT INTO `sys_oper_log` VALUES (400, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941065961145217026\",\"username\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:26:02', 31);
INSERT INTO `sys_oper_log` VALUES (401, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941065971245101058\",\"username\":\"333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:26:05', 27);
INSERT INTO `sys_oper_log` VALUES (402, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941065982058016769\",\"username\":\"444\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:26:07', 22);
INSERT INTO `sys_oper_log` VALUES (403, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941065993672044546\",\"username\":\"555\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:26:10', 40);
INSERT INTO `sys_oper_log` VALUES (404, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941066004178776066\",\"username\":\"666\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:26:13', 38);
INSERT INTO `sys_oper_log` VALUES (405, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"userId\":\"1941066013540462593\",\"username\":\"777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:26:15', 51);
INSERT INTO `sys_oper_log` VALUES (406, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/市辖区/东城区/180号\",\"email\":\"21499231@cc.com\",\"phone\":\"15148261811\",\"userId\":\"1941067297802792962\",\"username\":\"杨旭1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:31:21', 31);
INSERT INTO `sys_oper_log` VALUES (407, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":0,\"userId\":\"1941067297802792962\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:35:21', 23);
INSERT INTO `sys_oper_log` VALUES (408, '用户状态', 2, 'com.ruoyi.jank.controller.CommonUserController.updateStatus()', 'PUT', 1, 'admin', '研发部门', '/commonuser/commonuser/updateStatus', '127.0.0.1', '内网IP', '{\"freeze\":1,\"userId\":\"1941067297802792962\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:36:07', 23);
INSERT INTO `sys_oper_log` VALUES (409, '类目管理', 1, 'com.ruoyi.jank.controller.CategoryController.add()', 'POST', 1, 'admin', '研发部门', '/jank/category', '127.0.0.1', '内网IP', '{\"description\":\"<p>1515151给他让你</p>\",\"name\":\"后端\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 17:38:59', 30);
INSERT INTO `sys_oper_log` VALUES (410, '帖子', 1, 'com.ruoyi.jank.controller.PostController.add()', 'POST', 1, 'admin', '研发部门', '/postlist/postlist', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2025/07/04/微信头像_20250704175635A003.jpg\",\"postId\":\"1941073652227878913\",\"title\":\"175751\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in com/ruoyi/jank/mapper/PostMapper.java (best guess)\r\n### The error may involve com.ruoyi.jank.mapper.PostMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO post  ( post_id, title, image )  VALUES  ( ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2025-07-04 17:56:36', 27);
INSERT INTO `sys_oper_log` VALUES (411, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1938076012868915202', '127.0.0.1', '内网IP', '[\"1938076012868915202\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 18:29:36', 67);
INSERT INTO `sys_oper_log` VALUES (412, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1938076012868915202', '127.0.0.1', '内网IP', '[\"1938076012868915202\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 18:35:14', 6823);
INSERT INTO `sys_oper_log` VALUES (413, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1938076012868915202', '127.0.0.1', '内网IP', '[\"1938076012868915202\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 18:39:38', 82592);
INSERT INTO `sys_oper_log` VALUES (414, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1938076012868915202', '127.0.0.1', '内网IP', '[\"1938076012868915202\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 19:02:22', 5801);
INSERT INTO `sys_oper_log` VALUES (415, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941066004178776066', '127.0.0.1', '内网IP', '[\"1941066004178776066\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 19:03:02', 86);
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"jank/category/index\",\"createTime\":\"2025-06-25 11:12:04\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"类目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2018,\"path\":\"category\",\"perms\":\"jank:category:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 19:05:44', 39);
INSERT INTO `sys_oper_log` VALUES (417, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/,', '127.0.0.1', '内网IP', '[\"\",\"\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 19:07:26', 60);
INSERT INTO `sys_oper_log` VALUES (418, '评论功能', 3, 'com.ruoyi.jank.controller.CommentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/jank/comment/,', '127.0.0.1', '内网IP', '[\"\",\"\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 19:07:32', 35);
INSERT INTO `sys_oper_log` VALUES (419, '用户管理', 1, 'com.ruoyi.jank.controller.CommonUserController.add()', 'POST', 1, 'admin', '研发部门', '/commonuser/commonuser', '127.0.0.1', '内网IP', '{\"address\":\"北京市/县/无\",\"email\":\"158@163.com\",\"phone\":\"14332323232\",\"userId\":\"1941091885311193090\",\"username\":\"时间\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 19:09:03', 35);
INSERT INTO `sys_oper_log` VALUES (420, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941091885311193090', '127.0.0.1', '内网IP', '[\"1941091885311193090\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 19:09:11', 14);
INSERT INTO `sys_oper_log` VALUES (421, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941091885311193090', '127.0.0.1', '内网IP', '[\"1941091885311193090\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 19:10:09', 12);
INSERT INTO `sys_oper_log` VALUES (422, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941091885311193090', '127.0.0.1', '内网IP', '[\"1941091885311193090\"]', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\r\n### The error may exist in com/ruoyi/jank/mapper/CommentMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  comment_id,content,user_id,post_id,create_time,update_time,deleted,user,post  FROM comment     WHERE (user_id = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user\' in \'field list\'', '2025-07-04 19:12:26', 114);
INSERT INTO `sys_oper_log` VALUES (423, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941091885311193090', '127.0.0.1', '内网IP', '[\"1941091885311193090\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 19:17:16', 63);
INSERT INTO `sys_oper_log` VALUES (424, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1941066004178776066', '127.0.0.1', '内网IP', '[\"1941066004178776066\"]', NULL, 1, '用户下有评论，无法删除', '2025-07-04 19:18:18', 17);
INSERT INTO `sys_oper_log` VALUES (425, '用户管理', 3, 'com.ruoyi.jank.controller.CommonUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/commonuser/commonuser/1938076012868915202', '127.0.0.1', '内网IP', '[\"1938076012868915202\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 19:18:30', 29);
INSERT INTO `sys_oper_log` VALUES (426, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-04 19:49:30', 61);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-06-23 15:57:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-06-23 15:57:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-06-23 15:57:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-06-23 15:57:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-06-23 15:57:12', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-06-23 15:57:12', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2025/07/04/微信头像_20250704141235A001.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-04 19:59:13', 'admin', '2025-06-23 15:57:11', '', '2025-07-04 19:59:12', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-23 15:57:11', 'admin', '2025-06-23 15:57:11', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
DROP TABLE IF EXISTS `t_like`;
CREATE TABLE `t_like`  (
  `id` char(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `comment_id` char(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_id` char(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_like
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '访问令牌',
  `refresh_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '刷新令牌',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `freeze` int NOT NULL DEFAULT 1 COMMENT '用户冻结',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1937794761217912834', '我的', 'ZJ.jpg', '4516@163.com', 'zhaoxin', '123456', NULL, NULL, NULL, '2025-06-25 16:47:16', '2025-07-04 19:59:40', 0, 1, '河北省/唐山市/路北区');
INSERT INTO `user` VALUES ('1938076012868915202', NULL, NULL, NULL, 'wuyinai', '123123', NULL, NULL, NULL, '2025-06-26 11:24:53', '2025-07-04 19:18:30', 1, 1, NULL);
INSERT INTO `user` VALUES ('1938852475338047490', NULL, 'YX.jpg', NULL, '杨旭', 'Yx049999', NULL, NULL, NULL, '2025-06-28 14:50:07', '2025-07-04 14:11:56', 0, 1, NULL);
INSERT INTO `user` VALUES ('1938887603814252546', NULL, NULL, NULL, 'wodefa', '123123', NULL, NULL, NULL, '2025-06-28 17:09:43', '2025-07-04 11:08:45', 1, 0, NULL);
INSERT INTO `user` VALUES ('1941023285834276865', NULL, NULL, NULL, '757575', NULL, NULL, NULL, NULL, '2025-07-04 14:36:28', '2025-07-04 14:36:33', 0, 1, '北京市/市辖区/东城区/789号');
INSERT INTO `user` VALUES ('1941045601133735938', NULL, NULL, NULL, '757575', NULL, NULL, NULL, NULL, '2025-07-04 16:05:08', '2025-07-04 16:06:05', 1, 1, NULL);
INSERT INTO `user` VALUES ('1941045809582256129', NULL, NULL, NULL, '757575', NULL, NULL, NULL, NULL, '2025-07-04 16:05:58', '2025-07-04 16:06:03', 1, 1, NULL);
INSERT INTO `user` VALUES ('1941050557806940162', NULL, NULL, NULL, 'test2', NULL, NULL, NULL, NULL, '2025-07-04 16:24:50', '2025-07-04 17:25:35', 0, 0, NULL);
INSERT INTO `user` VALUES ('1941065950885949441', NULL, NULL, NULL, '111', NULL, NULL, NULL, NULL, '2025-07-04 17:26:00', '2025-07-04 17:26:00', 0, 1, NULL);
INSERT INTO `user` VALUES ('1941065961145217026', NULL, NULL, NULL, '222', NULL, NULL, NULL, NULL, '2025-07-04 17:26:02', '2025-07-04 17:26:02', 0, 1, NULL);
INSERT INTO `user` VALUES ('1941065971245101058', NULL, NULL, NULL, '333', NULL, NULL, NULL, NULL, '2025-07-04 17:26:05', '2025-07-04 17:26:05', 0, 1, NULL);
INSERT INTO `user` VALUES ('1941065982058016769', NULL, NULL, NULL, '444', NULL, NULL, NULL, NULL, '2025-07-04 17:26:07', '2025-07-04 17:26:07', 0, 1, NULL);
INSERT INTO `user` VALUES ('1941065993672044546', NULL, NULL, NULL, '555', NULL, NULL, NULL, NULL, '2025-07-04 17:26:10', '2025-07-04 17:26:10', 0, 1, NULL);
INSERT INTO `user` VALUES ('1941066004178776066', NULL, NULL, NULL, '666', NULL, NULL, NULL, NULL, '2025-07-04 17:26:13', '2025-07-04 17:26:13', 0, 1, NULL);
INSERT INTO `user` VALUES ('1941066013540462593', NULL, NULL, NULL, '777', NULL, NULL, NULL, NULL, '2025-07-04 17:26:15', '2025-07-04 17:26:15', 0, 1, NULL);
INSERT INTO `user` VALUES ('1941067297802792962', NULL, NULL, '21499231@cc.com', '杨旭1', NULL, '15148261811', NULL, NULL, '2025-07-04 17:31:21', '2025-07-04 17:36:07', 0, 1, '北京市/市辖区/东城区/180号');
INSERT INTO `user` VALUES ('1941091885311193090', NULL, NULL, '158@163.com', '时间', NULL, '14332323232', NULL, NULL, '2025-07-04 19:09:03', '2025-07-04 19:17:16', 1, 1, '北京市/县/无');
INSERT INTO `user` VALUES ('32131221312', '浮迹', 'YoyuEN.png', '15839393171@163.com', 'YoyuEN', '123123', NULL, '212121', NULL, '2025-06-24 15:39:22', '2025-07-04 14:11:56', 0, 1, '山西省/长治市');

-- ----------------------------
-- Table structure for verification
-- ----------------------------
DROP TABLE IF EXISTS `verification`;
CREATE TABLE `verification`  (
  `verification_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `img_base64` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片的Base64编码',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`verification_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '验证码图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of verification
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
