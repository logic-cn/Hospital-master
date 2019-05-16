/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : healerworld

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-05-16 11:07:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LoginN` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '123', '2', '2016-03-12 09:34:28', '超级管理员');
INSERT INTO `admin_user` VALUES ('2', 'root', '123', '1', '2018-07-02 10:40:58', '普通管理');
INSERT INTO `admin_user` VALUES ('3', 'adcd', '123', '1', '2018-07-02 10:41:38', 'adf');
INSERT INTO `admin_user` VALUES ('10', '1', '1', '1', '2018-07-05 17:22:44', '1');
INSERT INTO `admin_user` VALUES ('11', '2', '2', '1', '2018-07-05 17:22:50', '2');
INSERT INTO `admin_user` VALUES ('12', '3', '3', '1', '2018-07-05 17:22:56', '3');
INSERT INTO `admin_user` VALUES ('13', '4', '4', '2', '2018-07-05 17:23:09', '4');
INSERT INTO `admin_user` VALUES ('14', '5', '5', '1', '2018-07-05 17:23:14', '5');
INSERT INTO `admin_user` VALUES ('15', '6', '6', '1', '2018-07-05 17:23:20', '6');
INSERT INTO `admin_user` VALUES ('16', '7', '7', '1', '2018-07-05 17:23:26', '7');
INSERT INTO `admin_user` VALUES ('17', '蔷薇', 'qwwrqwr', '2', '2018-07-09 15:04:40', '未全额');

-- ----------------------------
-- Table structure for `appointment`
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `aid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `visitTime` varchar(100) DEFAULT NULL,
  `did` bigint(20) NOT NULL,
  `name` varchar(64) NOT NULL,
  `idcast` varchar(20) DEFAULT NULL,
  `aphone` varchar(20) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`,`did`),
  UNIQUE KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES ('151168892600380', '151093275581282', '2017年-11月-28日(星期二)下午', '1', '潘伟明', '123', '123', '2017-11-26 17:35:26', '2017-11-26 17:35:26');
INSERT INTO `appointment` VALUES ('151169492899652', '151093275581282', '2017年-11月-29日(星期三)上午', '4', '潘伟明', '1312312', '312', '2017-11-26 19:15:28', '2017-11-26 19:15:28');
INSERT INTO `appointment` VALUES ('155784117773316', '155783553297327', '2019年-05月-14日(星期二)下午', '1', '小明', '123432567654444445', '13424442223', '2019-05-14 21:39:37', '2019-05-14 21:39:37');
INSERT INTO `appointment` VALUES ('155791686500430', '155783553297327', '2019年-05月-20日(星期一)下午', '4', '小明', '222222222', '2222', '2019-05-15 18:41:05', '2019-05-15 18:41:05');
INSERT INTO `appointment` VALUES ('155784078180314', '155783553297327', '2019年-05月-15日(星期三)上午', '5', '小明', '123432567654444445', '13424442223', '2019-05-14 21:33:01', '2019-05-14 21:33:01');
INSERT INTO `appointment` VALUES ('155783561783287', '155783553297327', '2019年-05月-16日(星期四)上午', '6', '小明', '123432567654444444', '13424442222', '2019-05-14 20:06:57', '2019-05-14 20:06:57');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deid` bigint(20) NOT NULL,
  `degrade` int(11) DEFAULT NULL COMMENT '1 一级科室 2 二级科室',
  `dename` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`deid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '1', '内科');
INSERT INTO `dept` VALUES ('2', '1', '儿科');
INSERT INTO `dept` VALUES ('3', '1', '眼科');
INSERT INTO `dept` VALUES ('4', '1', '骨科');
INSERT INTO `dept` VALUES ('5', '1', '口腔科');
INSERT INTO `dept` VALUES ('6', '2', '心血管内科');
INSERT INTO `dept` VALUES ('7', '2', '神经内科');
INSERT INTO `dept` VALUES ('8', '2', '内分泌科');
INSERT INTO `dept` VALUES ('9', '2', '血液科');
INSERT INTO `dept` VALUES ('10', '2', '肝病科');

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `did` bigint(20) NOT NULL,
  `dname` varchar(64) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `hid` bigint(20) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `grade` int(11) DEFAULT NULL COMMENT '1主任医师 2副主任医师 3主治医师 4普通医师',
  `deid` bigint(20) DEFAULT NULL,
  `skill` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL COMMENT '图片地址',
  `surgeryWeek` varchar(200) DEFAULT NULL COMMENT '手术日期',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', '曹云', '男', '1', '9.8', '2', '1', '治疗口腔', '从1995到至今武汉同济医院;华中科技大学同济医学院外科学博士；美国加州大学洛杉矶分校（UCLA医学中心泌尿外科博士后', 'images/yisheng1.png', '星期二上午,星期二下午,星期四上午,星期五晚上');
INSERT INTO `doctor` VALUES ('2', '张三', '男', '2', '9.8', '1', '1', '治疗口腔', 'GOOD', 'images/yisheng1.png', '星期一下午,星期三上午,星期三下午');
INSERT INTO `doctor` VALUES ('3', '李四', '男', '3', '9.8', '1', '1', '治疗口腔', 'GOOD', 'images/yisheng1.png', '星期二上午,星期二下午,星期四上午,星期五晚上');
INSERT INTO `doctor` VALUES ('4', '李五', '女', '5', '9.7', '3', '2', null, 'GOOD', 'images/yisheng2.png', '星期一下午,星期三上午,星期三下午');
INSERT INTO `doctor` VALUES ('5', '李六', '男', '5', '9.6', '4', '2', null, 'GOOD', 'images/yisheng1.png', '星期三上午,星期三下午,星期五上午');
INSERT INTO `doctor` VALUES ('6', '李七', '女', '8', '9', '2', '1', null, 'GOOD', 'images/yisheng2.png', '星期三下午,星期四上午,星期四下午');

-- ----------------------------
-- Table structure for `hospital`
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `hid` bigint(20) NOT NULL,
  `hname` varchar(64) DEFAULT NULL,
  `hphone` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `grade` varchar(11) DEFAULT NULL COMMENT '1三甲医院 2三乙医院 3二甲医院 4二级医院',
  `description` varchar(200) DEFAULT NULL,
  `insurance` int(1) DEFAULT NULL COMMENT '医保',
  `image` varchar(64) DEFAULT NULL COMMENT '图片地址',
  `times` int(11) DEFAULT NULL COMMENT '提供服务次数',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES ('1', '武汉协和医院', '123-123', '武汉市武昌区', '9.8', '三甲', 'good', '1', 'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg', '2');
INSERT INTO `hospital` VALUES ('2', '广州协和医院', '123-123', '广州市白云区', '9.8', '三乙', 'good', '1', 'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg', '0');
INSERT INTO `hospital` VALUES ('3', '北京协和医院', '123-123', '北京市朝阳区', '9.8', '二甲', 'good', '0', 'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg', '0');
INSERT INTO `hospital` VALUES ('5', '上海协和医院', '123-123', '上海市xx区', '9.8', '二级', 'good', '0', 'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg', '3');
INSERT INTO `hospital` VALUES ('6', '深圳协和医院', '123-123', '深圳xx', '9.8', '二甲', 'good', '1', 'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg', '0');
INSERT INTO `hospital` VALUES ('8', '湛江协和医院', '123-123', '湛江市xx区', '9.8', '二级', 'good', '0', 'images/09fa513d269759eeaac0c0eeb5fb43166d22df07.jpg', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL,
  `user` varchar(64) DEFAULT NULL,
  `pwd` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('151093275581282', 'Ming', '1544962681d702dab4aefdf580ce1d16', '潘伟明', '男', '969130721@QQ.COM', '123123', '2017-11-17 23:32:35', '2017-11-17 23:32:35', '7934bba2a1b146caa7e33b8ed97172e9', '1');
INSERT INTO `user` VALUES ('151093312149388', '123123', '93be6c2e2ed15ede01a68df159ca7d4f', 'Ming', '男', '969130721@QQ.COM', '123123', '2017-11-17 23:38:41', '2017-11-17 23:38:41', 'fde9806a8741485ab6ea153f580f4d32', '1');
INSERT INTO `user` VALUES ('151100071769897', '1231232', 'cadca8b9c383d8a19b4a58b20c4d9eda', 'Ming', '男', '969130721@QQ.COM', '123123', '2017-11-18 18:25:17', '2017-11-18 18:29:11', 'baa883d2bce74928b7844b50dcdacf45', '1');
INSERT INTO `user` VALUES ('151100099070977', 'Ming2', 'cadca8b9c383d8a19b4a58b20c4d9eda', 'Ming', '男', '969130721@QQ.COM', '', '2017-11-18 18:29:50', '2017-11-18 18:29:56', '719b66a4090041118b27cc7d3e6e5ba0', '1');
INSERT INTO `user` VALUES ('151101910081945', '123123213', 'cadca8b9c383d8a19b4a58b20c4d9eda', '312321', '男', '969130721@QQ.CO', '', '2017-11-18 23:31:40', '2017-11-18 23:31:40', 'f79660a2aa244845a0ffae3b89fc8650', null);
INSERT INTO `user` VALUES ('151101911629484', '1231232133123', 'cadca8b9c383d8a19b4a58b20c4d9eda', '312321', '男', '969130721@QQ', '123', '2017-11-18 23:31:56', '2017-11-18 23:31:56', '0bb44896aafd41e9a9b32cee470035a9', null);
INSERT INTO `user` VALUES ('151101926902747', '123123123', 'cadca8b9c383d8a19b4a58b20c4d9eda', '321312', '男', '969130721@QQ', '123123', '2017-11-18 23:34:29', '2017-11-18 23:34:29', 'c3e25d67ce7a4d2aa370fc679f59e921', null);
INSERT INTO `user` VALUES ('151102006444721', '12312312', 'cadca8b9c383d8a19b4a58b20c4d9eda', '123123', '男', '', '', '2017-11-18 23:47:44', '2017-11-18 23:47:44', 'ff12393220214bffb5ba5e04629e0d27', null);
INSERT INTO `user` VALUES ('151102017088307', '12312322', 'cadca8b9c383d8a19b4a58b20c4d9eda', '12312', '男', '', '', '2017-11-18 23:49:30', '2017-11-18 23:49:30', 'd980c7073a5643e09ccaabf4ccc63f7a', null);
INSERT INTO `user` VALUES ('151102024317541', '12312312321', 'cadca8b9c383d8a19b4a58b20c4d9eda', 'Ming', '男', '969130721@QQ.COM', '132123', '2017-11-18 23:50:43', '2017-11-18 23:50:43', '5a596a710634435181afdd8c4be4d571', null);
INSERT INTO `user` VALUES ('155783553297327', 'admin', '1544962681d702dab4aefdf580ce1d16', '小明', '男', '515761262@qq.com', '13933621277', '2019-05-14 20:05:32', '2019-05-14 20:05:32', 'b33dd24f9a014979a1210a0baf4884a5', null);
