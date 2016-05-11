/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : gdesign

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2016-05-11 10:34:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `AUDIT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AUDIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audit
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(255) DEFAULT NULL,
  `CATEGORY_DESCRIPTION` varchar(255) DEFAULT NULL,
  `CATEGORY_CT` datetime DEFAULT NULL,
  `CATEGORY_LMT` datetime DEFAULT NULL,
  `CATEGORY_titleCount` int(11) DEFAULT NULL,
  `CATEGORY_JOBPERCENT` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `CATEGORY_STATUE` int(11) DEFAULT NULL,
  `audit_ID` int(11) DEFAULT NULL,
  `CATEGORY_JOBPTYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `FKC419223C5AD31C3B` (`department_id`),
  KEY `FKC419223CB313425B` (`user_id`),
  KEY `FKC419223CF846C779` (`audit_ID`),
  CONSTRAINT `FKC419223C5AD31C3B` FOREIGN KEY (`department_id`) REFERENCES `departments` (`Department_ID`),
  CONSTRAINT `FKC419223CB313425B` FOREIGN KEY (`user_id`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `FKC419223CF846C779` FOREIGN KEY (`audit_ID`) REFERENCES `audit` (`AUDIT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '微信公众号支付', '	该项目共分为：微信支付、查询、退货、对账单下载功能，我负责其中的批量查询交易以及后期的项目维护（包括：微信支付安全信息优化，从编写需求分析到编码测试到最终产品上线）同时与商户进行微信功能联调', '2016-03-28 00:00:00', '2016-04-04 00:00:00', null, null, '2', '1', '1', null, null);
INSERT INTO `categories` VALUES ('2', '现金宝签约', null, '2016-03-21 00:00:00', '2016-03-25 00:00:00', null, null, '3', '1', '1', null, null);
INSERT INTO `categories` VALUES ('3', '远程开户', null, '2016-03-14 00:00:00', '2016-03-18 00:00:00', null, null, '1', '1', '2', null, null);
INSERT INTO `categories` VALUES ('5', '微信公众号支付', 'angularsj', '2016-03-07 00:00:00', '2016-03-11 00:00:00', null, '100', '2', '1', '1', null, null);
INSERT INTO `categories` VALUES ('6', '微信公众号支付', null, '2016-02-29 00:00:00', '2016-03-04 00:00:00', null, '100', '2', '1', '1', null, null);
INSERT INTO `categories` VALUES ('7', '微信公众号支付', null, '2016-02-22 00:00:00', '2016-02-26 00:00:00', null, '100', '1', '1', '2', null, null);
INSERT INTO `categories` VALUES ('9', 'javaweb', '该项目共分为：微信支付、查询、退货、对账单下载功能，我负责其中的批量查询交易以及后期的项目维护（包括：微信支付安全信息优化，从编写需求分析到编码测试到最终产品上线）同时与商户进行微信功能联调', '2016-04-01 00:00:00', '2016-04-05 00:00:00', null, '100', '1', '1', null, null, null);
INSERT INTO `categories` VALUES ('10', '远程开户', null, '2016-05-03 00:00:00', '2016-05-07 00:00:00', null, '100', '6', '2', null, null, null);
INSERT INTO `categories` VALUES ('11', '远程开户', null, '2016-05-01 00:00:00', '2016-05-04 00:00:00', null, '10', '1', '2', null, null, null);
INSERT INTO `categories` VALUES ('12', '支付宝扫码支付', '角色：支付宝用户\r\n\r\n1.支付宝用户可以通过发码平台领取“向我付款”的二维码。\r\n2.付款人通过扫码拍下您的账户码后进行付款，付款成功后，款项将直接到达您的支付宝账户中。\r\n3.二维码图案中默认调取支付宝账号的头像，您也可以自行上传个性化头像。\r\n4.生成后的二维码可保存，可自行使用。', '2016-05-05 00:00:00', '2016-05-09 00:00:00', null, '110', '6', '1', null, null, '项目开发');

-- ----------------------------
-- Table structure for contents
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `CONTENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `CONTENT_CT` datetime DEFAULT NULL,
  `CONTENT_LMT` datetime DEFAULT NULL,
  `CONTENT_IPADDRESS` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`CONTENT_ID`),
  KEY `FKCD54B1AB313425B` (`user_id`),
  KEY `FKCD54B1A4FA9DA59` (`title_id`),
  CONSTRAINT `FKCD54B1A4FA9DA59` FOREIGN KEY (`title_id`) REFERENCES `titles` (`Title_ID`),
  CONSTRAINT `FKCD54B1AB313425B` FOREIGN KEY (`user_id`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contents
-- ----------------------------

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `Department_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Department_NAME` varchar(255) DEFAULT NULL,
  `Department_DESCRIPTION` varchar(255) DEFAULT NULL,
  `parent_Id` int(11) DEFAULT NULL,
  `category_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Department_ID`),
  KEY `FK82A3CF419CEC37E3` (`parent_Id`),
  KEY `FK82A3CF412272A8FB` (`category_ID`),
  CONSTRAINT `FK82A3CF412272A8FB` FOREIGN KEY (`category_ID`) REFERENCES `categories` (`CATEGORY_ID`),
  CONSTRAINT `FK82A3CF419CEC37E3` FOREIGN KEY (`parent_Id`) REFERENCES `departments` (`Department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', '公司组', 'gongz', null, null);
INSERT INTO `departments` VALUES ('2', '支付组', '2333', '2', null);
INSERT INTO `departments` VALUES ('3', '手机组', '啊啊啊', null, null);
INSERT INTO `departments` VALUES ('4', '个人组', null, null, null);
INSERT INTO `departments` VALUES ('5', '互联网交换平台', null, null, null);
INSERT INTO `departments` VALUES ('6', '远程开户', null, null, null);

-- ----------------------------
-- Table structure for privileges
-- ----------------------------
DROP TABLE IF EXISTS `privileges`;
CREATE TABLE `privileges` (
  `PRIVILEGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRIVILEGE_NAME` varchar(255) DEFAULT NULL,
  `PRIVILEGE_URL` varchar(255) DEFAULT NULL,
  `parent_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRIVILEGE_ID`),
  KEY `FK1435BC02D28267A0` (`parent_Id`),
  CONSTRAINT `FK1435BC02D28267A0` FOREIGN KEY (`parent_Id`) REFERENCES `privileges` (`PRIVILEGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privileges
-- ----------------------------
INSERT INTO `privileges` VALUES ('1', '系统管理', '/', null);
INSERT INTO `privileges` VALUES ('2', '权限分配', '/role_list', '1');
INSERT INTO `privileges` VALUES ('3', '部门管理', '/department_list', '1');
INSERT INTO `privileges` VALUES ('4', '用户管理', '/user_list', '1');
INSERT INTO `privileges` VALUES ('5', '岗位列表', '/role_list', '2');
INSERT INTO `privileges` VALUES ('6', '岗位删除', '/role_delete', '2');
INSERT INTO `privileges` VALUES ('7', '岗位添加', '/role_add', '2');
INSERT INTO `privileges` VALUES ('8', '岗位修改', '/role_edit', '2');
INSERT INTO `privileges` VALUES ('9', '部门列表', '/department_list', '3');
INSERT INTO `privileges` VALUES ('10', '部门删除', '/department_delete', '3');
INSERT INTO `privileges` VALUES ('11', '部门添加', '/department_add', '3');
INSERT INTO `privileges` VALUES ('12', '部门修改', '/department_edit', '3');
INSERT INTO `privileges` VALUES ('13', '用户列表', '/user_list', '4');
INSERT INTO `privileges` VALUES ('14', '用户删除', '/user_delete', '4');
INSERT INTO `privileges` VALUES ('15', '用户添加', '/user_add', '4');
INSERT INTO `privileges` VALUES ('16', '用户修改', '/user_edit', '4');
INSERT INTO `privileges` VALUES ('17', '初始化密码', '/user_initPassword', '4');
INSERT INTO `privileges` VALUES ('18', '项目管理', '/', null);
INSERT INTO `privileges` VALUES ('19', '周报编写', '/category_list', '18');
INSERT INTO `privileges` VALUES ('20', '查看周报', '/category_show', '18');
INSERT INTO `privileges` VALUES ('21', '工作台', '/', null);
INSERT INTO `privileges` VALUES ('22', '个人信息', '/user_info', '21');
INSERT INTO `privileges` VALUES ('23', '我的周报', '/category_show', '21');
INSERT INTO `privileges` VALUES ('24', '我的签到', '/sign_signHistory', '21');
INSERT INTO `privileges` VALUES ('25', '主体', '/main_index', '19');
INSERT INTO `privileges` VALUES ('26', '页脚', '/main_foot', '19');
INSERT INTO `privileges` VALUES ('27', '左侧', '/main_left', '19');
INSERT INTO `privileges` VALUES ('28', '右侧', '/main_right', '19');
INSERT INTO `privileges` VALUES ('29', '上部', '/main_top', '19');
INSERT INTO `privileges` VALUES ('30', '管理员审核', '/audit_list', '18');
INSERT INTO `privileges` VALUES ('31', '文档管理', '/', null);
INSERT INTO `privileges` VALUES ('32', '参考资料', '/file_list01File', '31');
INSERT INTO `privileges` VALUES ('33', '规章制度', '/file_list02File', '31');
INSERT INTO `privileges` VALUES ('34', '培训资料', '/file_list03File', '31');
INSERT INTO `privileges` VALUES ('35', '注销', '/user_logoutUI', '19');
INSERT INTO `privileges` VALUES ('36', '周报添加', '/category_add', '19');
INSERT INTO `privileges` VALUES ('37', '周报修改(界面)', '/category_modifyUI', '19');
INSERT INTO `privileges` VALUES ('38', '周报删除', '/category_delete', '19');
INSERT INTO `privileges` VALUES ('39', '周报审核（管理员）', '/category_auditUI', '30');
INSERT INTO `privileges` VALUES ('40', '周报审核通过（管理员）', '/category_pass', '30');
INSERT INTO `privileges` VALUES ('41', '周报审核不通过（管理员）', '/cateogory_unpass', '30');
INSERT INTO `privileges` VALUES ('42', '周报修改', '/category_modify', '19');
INSERT INTO `privileges` VALUES ('43', '销售管理', '/', null);
INSERT INTO `privileges` VALUES ('44', '销售报告', '/sale_list', '43');
INSERT INTO `privileges` VALUES ('45', '签到', '/sign_signUI', '18');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(255) DEFAULT NULL,
  `ROLE_DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '实习生', 'x 语言入门');
INSERT INTO `roles` VALUES ('2', '测试员', 'x 语言应用实践');
INSERT INTO `roles` VALUES ('3', '初级开发', 'x 语言高阶编程');
INSERT INTO `roles` VALUES ('4', '小组长', ' x 语言的科学与艺术');
INSERT INTO `roles` VALUES ('5', '项目经理', '编程之禅');
INSERT INTO `roles` VALUES ('6', '业务人员', '业务狗');

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`privilege_id`,`role_id`),
  KEY `FK81B4C2282B06E839` (`privilege_id`),
  KEY `FK81B4C228DE87E7B` (`role_id`),
  CONSTRAINT `FK81B4C2282B06E839` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`PRIVILEGE_ID`),
  CONSTRAINT `FK81B4C228DE87E7B` FOREIGN KEY (`role_id`) REFERENCES `roles` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('1', '1');
INSERT INTO `role_privilege` VALUES ('2', '1');
INSERT INTO `role_privilege` VALUES ('5', '1');
INSERT INTO `role_privilege` VALUES ('1', '2');
INSERT INTO `role_privilege` VALUES ('2', '2');
INSERT INTO `role_privilege` VALUES ('5', '2');
INSERT INTO `role_privilege` VALUES ('1', '3');
INSERT INTO `role_privilege` VALUES ('2', '3');
INSERT INTO `role_privilege` VALUES ('5', '3');
INSERT INTO `role_privilege` VALUES ('1', '4');
INSERT INTO `role_privilege` VALUES ('2', '4');
INSERT INTO `role_privilege` VALUES ('5', '4');
INSERT INTO `role_privilege` VALUES ('2', '5');
INSERT INTO `role_privilege` VALUES ('5', '5');
INSERT INTO `role_privilege` VALUES ('5', '6');
INSERT INTO `role_privilege` VALUES ('5', '7');
INSERT INTO `role_privilege` VALUES ('1', '8');
INSERT INTO `role_privilege` VALUES ('2', '8');
INSERT INTO `role_privilege` VALUES ('5', '8');
INSERT INTO `role_privilege` VALUES ('1', '9');
INSERT INTO `role_privilege` VALUES ('2', '9');
INSERT INTO `role_privilege` VALUES ('5', '9');
INSERT INTO `role_privilege` VALUES ('5', '10');
INSERT INTO `role_privilege` VALUES ('5', '11');
INSERT INTO `role_privilege` VALUES ('2', '12');
INSERT INTO `role_privilege` VALUES ('5', '12');
INSERT INTO `role_privilege` VALUES ('5', '13');
INSERT INTO `role_privilege` VALUES ('5', '14');
INSERT INTO `role_privilege` VALUES ('1', '15');
INSERT INTO `role_privilege` VALUES ('5', '15');
INSERT INTO `role_privilege` VALUES ('1', '16');
INSERT INTO `role_privilege` VALUES ('2', '16');
INSERT INTO `role_privilege` VALUES ('5', '16');
INSERT INTO `role_privilege` VALUES ('1', '17');
INSERT INTO `role_privilege` VALUES ('2', '17');
INSERT INTO `role_privilege` VALUES ('5', '17');
INSERT INTO `role_privilege` VALUES ('1', '18');
INSERT INTO `role_privilege` VALUES ('2', '18');
INSERT INTO `role_privilege` VALUES ('5', '18');
INSERT INTO `role_privilege` VALUES ('1', '19');
INSERT INTO `role_privilege` VALUES ('2', '19');
INSERT INTO `role_privilege` VALUES ('5', '19');
INSERT INTO `role_privilege` VALUES ('1', '20');
INSERT INTO `role_privilege` VALUES ('2', '20');
INSERT INTO `role_privilege` VALUES ('5', '20');
INSERT INTO `role_privilege` VALUES ('1', '21');
INSERT INTO `role_privilege` VALUES ('2', '21');
INSERT INTO `role_privilege` VALUES ('5', '21');
INSERT INTO `role_privilege` VALUES ('1', '22');
INSERT INTO `role_privilege` VALUES ('2', '22');
INSERT INTO `role_privilege` VALUES ('5', '22');
INSERT INTO `role_privilege` VALUES ('1', '23');
INSERT INTO `role_privilege` VALUES ('2', '23');
INSERT INTO `role_privilege` VALUES ('5', '23');
INSERT INTO `role_privilege` VALUES ('1', '24');
INSERT INTO `role_privilege` VALUES ('2', '24');
INSERT INTO `role_privilege` VALUES ('5', '24');
INSERT INTO `role_privilege` VALUES ('1', '25');
INSERT INTO `role_privilege` VALUES ('5', '25');
INSERT INTO `role_privilege` VALUES ('1', '26');
INSERT INTO `role_privilege` VALUES ('5', '26');
INSERT INTO `role_privilege` VALUES ('1', '27');
INSERT INTO `role_privilege` VALUES ('5', '27');
INSERT INTO `role_privilege` VALUES ('1', '28');
INSERT INTO `role_privilege` VALUES ('5', '28');
INSERT INTO `role_privilege` VALUES ('1', '29');
INSERT INTO `role_privilege` VALUES ('5', '29');
INSERT INTO `role_privilege` VALUES ('1', '30');
INSERT INTO `role_privilege` VALUES ('1', '31');
INSERT INTO `role_privilege` VALUES ('2', '31');
INSERT INTO `role_privilege` VALUES ('1', '32');
INSERT INTO `role_privilege` VALUES ('2', '32');
INSERT INTO `role_privilege` VALUES ('1', '33');
INSERT INTO `role_privilege` VALUES ('2', '33');
INSERT INTO `role_privilege` VALUES ('1', '34');
INSERT INTO `role_privilege` VALUES ('2', '34');
INSERT INTO `role_privilege` VALUES ('1', '35');
INSERT INTO `role_privilege` VALUES ('1', '36');
INSERT INTO `role_privilege` VALUES ('1', '37');
INSERT INTO `role_privilege` VALUES ('1', '38');
INSERT INTO `role_privilege` VALUES ('1', '42');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `SALE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SALE_NAME` varchar(255) DEFAULT NULL,
  `SALE_PROFIT` int(11) DEFAULT NULL,
  `SALE_MONTH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SALE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('1', '微信公众号', '60', '1');
INSERT INTO `sale` VALUES ('2', '远程开户', '40', '2');
INSERT INTO `sale` VALUES ('3', '爱上微西湖', '65', '3');
INSERT INTO `sale` VALUES ('4', '可爱的三只松鼠', '70', '4');
INSERT INTO `sale` VALUES ('5', '左麟右李', '90', '5');
INSERT INTO `sale` VALUES ('6', 'www.baidu.com', '88', '6');
INSERT INTO `sale` VALUES ('7', '轻量级javaee', '75', '7');
INSERT INTO `sale` VALUES ('8', '阿里巴巴', '59', '8');

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `SIGN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SIGN_YEAR` int(11) DEFAULT NULL,
  `SIGN_MONTH` int(11) DEFAULT NULL,
  `SIGN_DAY` int(11) DEFAULT NULL,
  `SIGN_LSIGNDATE` datetime DEFAULT NULL,
  `SIGN_SIGNCOUNT` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`SIGN_ID`),
  KEY `FK2751DD8A038672` (`userId`),
  CONSTRAINT `FK2751DD8A038672` FOREIGN KEY (`userId`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('1', '2016', '5', '2', '2016-05-02 19:53:20', '1', '1');
INSERT INTO `sign` VALUES ('3', '2016', '5', '4', '2016-05-04 20:01:31', '2', '1');
INSERT INTO `sign` VALUES ('4', '2016', '5', '7', '2016-05-07 20:04:23', '3', '1');
INSERT INTO `sign` VALUES ('5', '2016', '5', '8', '2016-05-08 20:16:52', '4', '1');
INSERT INTO `sign` VALUES ('6', '2016', '5', '9', '2016-05-09 20:25:02', '5', '1');
INSERT INTO `sign` VALUES ('8', '2016', '5', '10', '2016-05-10 08:45:26', '6', '1');

-- ----------------------------
-- Table structure for titles
-- ----------------------------
DROP TABLE IF EXISTS `titles`;
CREATE TABLE `titles` (
  `Title_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE_NAME` varchar(255) DEFAULT NULL,
  `TITLE_DESCRIPTION` varchar(255) DEFAULT NULL,
  `category_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Title_ID`),
  KEY `FK9555153B2272A8FB` (`category_Id`),
  CONSTRAINT `FK9555153B2272A8FB` FOREIGN KEY (`category_Id`) REFERENCES `categories` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of titles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_USERNAME` varchar(255) DEFAULT NULL,
  `USER_PASSWORD` varchar(255) DEFAULT NULL,
  `USER_REALNAME` varchar(255) DEFAULT NULL,
  `USER_GENDER` varchar(255) DEFAULT NULL,
  `USER_TELEPHONE` varchar(255) DEFAULT NULL,
  `USER_EMAIL` varchar(255) DEFAULT NULL,
  `USER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `USER_Age` varchar(255) DEFAULT NULL,
  `department_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK4E39DE85AD31C3B` (`department_Id`),
  CONSTRAINT `FK4E39DE85AD31C3B` FOREIGN KEY (`department_Id`) REFERENCES `departments` (`Department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '21232F297A57A5A743894A0E4A801FC3', '超级管理员', '女', '188', '188@qq.com', '我是管理员QAQ', null, '1');
INSERT INTO `users` VALUES ('2', 'yycat', '21232F297A57A5A743894A0E4A801FC3', '主银yyCat', '女', '1008611', '10086@yidong.com', '项目经理哇咔擦', null, '2');
INSERT INTO `users` VALUES ('3', 'zhangs', '81DC9BDB52D04DC20036DBD8313ED055', '匆匆过客001', '男', '1008611', '1008611@qq.com', '远方的路人233', null, '2');
INSERT INTO `users` VALUES ('4', '动漫学院', '81DC9BDB52D04DC20036DBD8313ED055', '匆匆过客002', '女', '111', '1008611@qq.com', '阿里巴巴', null, '2');
INSERT INTO `users` VALUES ('5', 'coco', '81DC9BDB52D04DC20036DBD8313ED055', '匆匆过客003', '女', '18989', '189@163.com', 'coco女神', null, '1');
INSERT INTO `users` VALUES ('6', 'jack', '81DC9BDB52D04DC20036DBD8313ED055', '罗曼蒂', '男', '18989', '189@163.com', '鲁曼蒂--【表情】', null, '1');
INSERT INTO `users` VALUES ('7', '小米', '81DC9BDB52D04DC20036DBD8313ED055', '华米', '男', '18989', '189@163.com', '华米-大米--小米', null, '3');
INSERT INTO `users` VALUES ('8', '阿哲', '81DC9BDB52D04DC20036DBD8313ED055', '匆匆过客004', '女', '18989', '189@163.com', '时间如白皙', null, '4');
INSERT INTO `users` VALUES ('9', 'rose', '81DC9BDB52D04DC20036DBD8313ED055', '路斯', '女', '163126', '163@163.com', 'beauty', null, '5');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_Id` int(11) NOT NULL,
  `role_Id` int(11) NOT NULL,
  PRIMARY KEY (`role_Id`,`user_Id`),
  KEY `FK8B9F886ADE87E7B` (`role_Id`),
  KEY `FK8B9F886AB313425B` (`user_Id`),
  CONSTRAINT `FK8B9F886AB313425B` FOREIGN KEY (`user_Id`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `FK8B9F886ADE87E7B` FOREIGN KEY (`role_Id`) REFERENCES `roles` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '1');
INSERT INTO `user_role` VALUES ('3', '1');
INSERT INTO `user_role` VALUES ('4', '1');
INSERT INTO `user_role` VALUES ('5', '1');
INSERT INTO `user_role` VALUES ('6', '1');
INSERT INTO `user_role` VALUES ('7', '1');
INSERT INTO `user_role` VALUES ('8', '1');
INSERT INTO `user_role` VALUES ('9', '1');
INSERT INTO `user_role` VALUES ('1', '2');
INSERT INTO `user_role` VALUES ('5', '2');
INSERT INTO `user_role` VALUES ('9', '2');
INSERT INTO `user_role` VALUES ('1', '3');
INSERT INTO `user_role` VALUES ('3', '3');
INSERT INTO `user_role` VALUES ('6', '3');
INSERT INTO `user_role` VALUES ('7', '3');
INSERT INTO `user_role` VALUES ('8', '3');
INSERT INTO `user_role` VALUES ('1', '4');
INSERT INTO `user_role` VALUES ('1', '5');
INSERT INTO `user_role` VALUES ('1', '6');
