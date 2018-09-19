/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : friends

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-04-22 13:02:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `password` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `replyTime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `userDynamic_id` int(11) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `FK38A5EE5F270D0925` (`user_id`),
  KEY `FK38A5EE5FF404F76F` (`userDynamic_id`),
  CONSTRAINT `FK38A5EE5FF404F76F` FOREIGN KEY (`userDynamic_id`) REFERENCES `userdynamic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '2017-01-18 12:53:22', '5', '1', '哈哈哈哈哈哈哈哈哈');
INSERT INTO `comment` VALUES ('3', '2017-01-30 10:52:55', '2', '1', '哈哈哈哈哈哈哈哈哈');
INSERT INTO `comment` VALUES ('12', '2017-03-19 17:44:52', '1', '1', '<p>test4</p>');
INSERT INTO `comment` VALUES ('13', '2017-03-19 17:49:56', '1', '1', '<p>111111111111</p>');
INSERT INTO `comment` VALUES ('14', '2017-03-19 17:57:20', '1', '3', '<p>好吧<br/><iframe class=\"ueditor_baidumap\" src=\"http://localhost:8080/makeFriends/ueditor/dialogs/map/show.html#center=121.697867,31.250553&zoom=17&width=530&height=340&markers=121.697867,31.250553&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe></p>');

-- ----------------------------
-- Table structure for interest
-- ----------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interestName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of interest
-- ----------------------------
INSERT INTO `interest` VALUES ('1', '游戏');
INSERT INTO `interest` VALUES ('2', '地区');
INSERT INTO `interest` VALUES ('3', '生活');
INSERT INTO `interest` VALUES ('4', '明星');
INSERT INTO `interest` VALUES ('5', '情感');
INSERT INTO `interest` VALUES ('6', '爱好');
INSERT INTO `interest` VALUES ('7', '星座');
INSERT INTO `interest` VALUES ('8', '娱乐');
INSERT INTO `interest` VALUES ('9', '动漫');
INSERT INTO `interest` VALUES ('10', '体育');
INSERT INTO `interest` VALUES ('11', '运动健身');
INSERT INTO `interest` VALUES ('12', '旅行');
INSERT INTO `interest` VALUES ('13', '宠物');
INSERT INTO `interest` VALUES ('14', '饮食');
INSERT INTO `interest` VALUES ('15', '小说');
INSERT INTO `interest` VALUES ('16', '女性');
INSERT INTO `interest` VALUES ('17', '文艺');
INSERT INTO `interest` VALUES ('18', '综艺');
INSERT INTO `interest` VALUES ('19', '电视');
INSERT INTO `interest` VALUES ('20', '电影');
INSERT INTO `interest` VALUES ('21', '互联网');
INSERT INTO `interest` VALUES ('22', '学习');

-- ----------------------------
-- Table structure for interestgroup
-- ----------------------------
DROP TABLE IF EXISTS `interestgroup`;
CREATE TABLE `interestgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) DEFAULT NULL,
  `groupBg` varchar(255) DEFAULT NULL,
  `groupDesc` varchar(255) DEFAULT NULL,
  `applyReason` varchar(255) DEFAULT NULL,
  `interest_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8C3D39951C2BBB45` (`interest_id`),
  CONSTRAINT `FK8C3D39951C2BBB45` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of interestgroup
-- ----------------------------
INSERT INTO `interestgroup` VALUES ('1', 'Java小组开发讨论', 'img/head.jpg', '专注java开发讨30年', '本开发小组以java讨论为主', '22');
INSERT INTO `interestgroup` VALUES ('2', '电影梦工产', 'img/6.jpg', '专注movie30年', '本开发小组电影为主', '20');

-- ----------------------------
-- Table structure for reply_comment
-- ----------------------------
DROP TABLE IF EXISTS `reply_comment`;
CREATE TABLE `reply_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `replyTime` datetime DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `replyComment` longtext,
  `reply_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4C071E0A270D0925` (`user_id`),
  KEY `FK4C071E0A6A426A2F` (`comment_id`),
  KEY `FK4C071E0A3A6E38D0` (`reply_user_id`),
  CONSTRAINT `FK4C071E0A270D0925` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK4C071E0A3A6E38D0` FOREIGN KEY (`reply_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK4C071E0A6A426A2F` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply_comment
-- ----------------------------
INSERT INTO `reply_comment` VALUES ('1', '2017-01-31 17:23:14', '2', '6', '呵呵呵', '5');
INSERT INTO `reply_comment` VALUES ('2', '2017-02-01 17:27:57', '3', '5', '呵呵呵呵呵呵呵呵呵', '2');
INSERT INTO `reply_comment` VALUES ('3', '2017-03-19 16:19:24', '2', '1', '嗯嗯嗯', '5');
INSERT INTO `reply_comment` VALUES ('4', '2017-03-19 21:21:49', '13', '1', 'enen', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `head_pic` varchar(255) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `registerTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lilei', 'lilei', '未知', '112088@qq.com', '就想变成一只喵', 'img/head.jpg', '0', '魔法', '一只喵', '1325566778', '1995-03-22', '410115567890', '2016-05-22');
INSERT INTO `user` VALUES ('2', 'zhangsan', 'llasd', null, null, null, 'img/head.jpg', '0', null, '阿萨德会卡机收到', null, null, null, '2016-05-22');
INSERT INTO `user` VALUES ('5', 'kaige', 'kaige', null, null, null, 'img/head.jpg', '0', null, '开心', null, null, null, '2016-05-27');
INSERT INTO `user` VALUES ('6', '123', '123', null, null, '', 'img/head.jpg', '0', null, '123', null, null, null, '2016-11-17');
INSERT INTO `user` VALUES ('7', '1', '2', null, null, null, 'img/head.jpg', '0', null, '3', null, null, null, '2016-11-20');
INSERT INTO `user` VALUES ('8', '1', '2', null, null, null, 'img/head.jpg', '0', null, '1', null, null, null, '2016-11-20');

-- ----------------------------
-- Table structure for userdynamic
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic`;
CREATE TABLE `userdynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `content` text,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Toped` int(11) DEFAULT NULL,
  `Picked` int(11) DEFAULT NULL,
  `interestGroup_id` int(11) DEFAULT NULL,
  `approveCount` int(11) DEFAULT NULL,
  `notApproveCount` int(11) DEFAULT NULL,
  `watchCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6CA741F4270D0925` (`user_id`),
  KEY `FK96EAA148F59728F` (`interestGroup_id`),
  CONSTRAINT `FK6CA741F4270D0925` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK96EAA148F59728F` FOREIGN KEY (`interestGroup_id`) REFERENCES `interestgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdynamic
-- ----------------------------
INSERT INTO `userdynamic` VALUES ('1', 'JAVA基础知识精华总结', '没过多久', '2016-11-05 22:21:15', '6', '1', '1', '1', '1', '1', '0');
INSERT INTO `userdynamic` VALUES ('2', 'java中的subString', '没过多久', '2016-11-20 22:21:18', '6', '1', '1', '1', '0', '0', '7');
INSERT INTO `userdynamic` VALUES ('3', 'Java 8 之 Optional类', '没过多久', '2016-11-09 22:20:53', '6', '0', '0', '2', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('43', '啊', '<p>啊</p>', '2016-12-06 21:55:44', '6', '0', '0', '1', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('44', '1', '<p>1</p>', '2016-12-06 21:57:09', '6', '0', '0', '1', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('45', '1234', '<p>123</p>', '2016-12-06 21:58:20', '6', '0', '0', '1', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('46', 'ad', '<p>ad</p>', '2016-12-06 21:58:59', '6', '0', '0', '1', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('47', '注入测试', '<p>&lt;script&gt;</p><p>alert(1);</p><p>&lt;/script&gt;</p>', '2016-12-06 22:07:54', '6', '0', '0', '1', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('48', '注入测试2', '<p>&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;alert(1);&lt;/script&gt;</p>', '2016-12-06 22:09:13', '6', '0', '0', '1', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('49', '测试001', '<p><img src=\"/makeFriends/ueditor/jsp/upload/image/20170123/1485175404197021633.jpg\" title=\"1485175404197021633.jpg\" alt=\"login_bg.jpg\"/></p>', '2017-01-23 20:43:26', '6', '0', '0', '1', '0', '0', '0');
INSERT INTO `userdynamic` VALUES ('51', '阿萨德', '<p>啊啊啊啊</p>', '2017-03-19 18:00:43', '1', '0', '0', '2', '0', '0', '0');

-- ----------------------------
-- Table structure for userdynamicpic
-- ----------------------------
DROP TABLE IF EXISTS `userdynamicpic`;
CREATE TABLE `userdynamicpic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of userdynamicpic
-- ----------------------------

-- ----------------------------
-- Table structure for userdynamic_userdynamicpics
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_userdynamicpics`;
CREATE TABLE `userdynamic_userdynamicpics` (
  `userDynamic_id` int(11) NOT NULL,
  `userDynamicPic_id` int(11) NOT NULL,
  `elt` int(11) NOT NULL,
  PRIMARY KEY (`userDynamicPic_id`,`userDynamic_id`),
  KEY `FK59C14BF2F404F76F` (`userDynamic_id`),
  KEY `FK59C14BF2EAFAB785` (`userDynamicPic_id`),
  KEY `FK59C14BF234ABFFE1` (`elt`),
  CONSTRAINT `FK59C14BF234ABFFE1` FOREIGN KEY (`elt`) REFERENCES `comment` (`id`),
  CONSTRAINT `FK59C14BF2EAFAB785` FOREIGN KEY (`userDynamicPic_id`) REFERENCES `userdynamicpic` (`id`),
  CONSTRAINT `FK59C14BF2F404F76F` FOREIGN KEY (`userDynamic_id`) REFERENCES `userdynamic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of userdynamic_userdynamicpics
-- ----------------------------

-- ----------------------------
-- Table structure for user_interestgroup
-- ----------------------------
DROP TABLE IF EXISTS `user_interestgroup`;
CREATE TABLE `user_interestgroup` (
  `user_id` int(11) NOT NULL,
  `interestGroup_id` int(11) NOT NULL,
  PRIMARY KEY (`interestGroup_id`,`user_id`),
  KEY `FK71050801270D0925` (`user_id`),
  KEY `FK710508018F59728F` (`interestGroup_id`),
  CONSTRAINT `FK71050801270D0925` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK710508018F59728F` FOREIGN KEY (`interestGroup_id`) REFERENCES `interestgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user_interestgroup
-- ----------------------------
INSERT INTO `user_interestgroup` VALUES ('6', '1');
