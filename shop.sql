/*
Navicat MySQL Data Transfer

Source Server         : javademo
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2024-08-21 10:19:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `AdminType` int(11) DEFAULT NULL,
  `AdminName` varchar(50) DEFAULT NULL,
  `LoginName` varchar(12) DEFAULT NULL,
  `LoginPwd` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AdminType` (`AdminType`),
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`AdminType`) REFERENCES `tb_admintype` (`adminTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('2', '2', '订单管理员', 'admin2', 'admin2');
INSERT INTO `tb_admin` VALUES ('3', '3', '会员管理员', 'admin3', 'admin3');
INSERT INTO `tb_admin` VALUES ('4', '4', '系统管理员', 'admin4', '123456');

-- ----------------------------
-- Table structure for `tb_admintype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admintype`;
CREATE TABLE `tb_admintype` (
  `adminTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `adminTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admintype
-- ----------------------------
INSERT INTO `tb_admintype` VALUES ('1', '商品管理员');
INSERT INTO `tb_admintype` VALUES ('2', '订单管理员');
INSERT INTO `tb_admintype` VALUES ('3', '会员管理员');
INSERT INTO `tb_admintype` VALUES ('4', '系统管理员');

-- ----------------------------
-- Table structure for `tb_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `superTypeId` int(11) DEFAULT NULL,
  `subTypeId` int(11) DEFAULT NULL,
  `goodsName` varchar(200) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `introduce` text,
  `price` float DEFAULT NULL,
  `nowPrice` float DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `produceDate` varchar(20) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `inTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `newgoods` int(11) DEFAULT NULL,
  `salegoods` int(11) DEFAULT NULL,
  `hostgoods` int(11) DEFAULT NULL,
  `specialgoods` int(11) DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `subTypeId` (`subTypeId`),
  KEY `superTypeId` (`superTypeId`),
  CONSTRAINT `tb_goods_ibfk_1` FOREIGN KEY (`subTypeId`) REFERENCES `tb_subtype` (`subTypeId`),
  CONSTRAINT `tb_goods_ibfk_2` FOREIGN KEY (`superTypeId`) REFERENCES `tb_supertype` (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('116', '16', '111', '水果西红柿', 'SC-XHS-1', '新鲜水果西红柿。味道绝佳。', '5', '4.5', 'images/5736135_115032045115_2.jpg', '2024/08/15', '福建', '福红', '2024-08-21 01:18:21', '0', '0', '0', '1', '885');
INSERT INTO `tb_goods` VALUES ('117', '16', '112', '时令小青菜', 'SC-QC-1', '新鲜到家，自然生长，杜绝大棚菜。', '3.5', '2.5', 'images/20100825042942718.jpg', '2024/08/15', '安徽', '菜管家', '2024-08-15 19:46:59', '0', '0', '0', '1', '555');
INSERT INTO `tb_goods` VALUES ('118', '16', '113', '嫩笋瓜', 'SC-SG-1', '新鲜笋瓜', '3.8', '3.2', 'images/sg.jpg', '2024/08/15', '安徽', '菜管家', '2024-08-15 00:28:42', '1', '0', '0', '0', '355');
INSERT INTO `tb_goods` VALUES ('119', '17', '114', '精品香菇', 'SYJ-XG-1', '精品香菇', '12.5', '10', 'images/5787842_122143016404_2.jpg', '2024/08/15', '江苏', '菜管家', '2024-08-15 00:28:45', '1', '0', '0', '0', '666');
INSERT INTO `tb_goods` VALUES ('120', '17', '115', '精品蘑菇', 'SYJ-MG-1', '精品蘑菇。', '10.9', '9.9', 'images/2457331_094334685319_2.jpg', '2024/08/15', '江苏', '菜管家', '2024-08-15 00:28:48', '1', '0', '0', '0', '698');
INSERT INTO `tb_goods` VALUES ('121', '17', '117', '干木耳', 'SYJ-ME-1', '东北干木耳', '52.8', '50.8', 'images/1122.jpg', '2024/08/15', '黑龙江', '菜管家', '2024-08-15 00:28:51', '0', '0', '1', '0', '765');
INSERT INTO `tb_goods` VALUES ('122', '18', '118', '小红豆', 'GH-HD-1', '特级小红豆。五谷杂粮', '9.8', '8.8', 'images/2-13030915035S15.jpg', '2024/08/15', '江苏', '五谷杂粮', '2024-08-15 00:28:54', '0', '0', '1', '0', '655');
INSERT INTO `tb_goods` VALUES ('123', '18', '119', '红薯粉丝', 'GH-FS-1', '红薯粉丝。', '12.9', '11.8', 'images/200911251640187604.jpg', '2024/08/15', '江西', '菜管家', '2024-08-15 00:28:57', '0', '0', '1', '0', '333');
INSERT INTO `tb_goods` VALUES ('124', '18', '120', '海带丝', 'GH-HD-2', '海带丝', '6.8', '6.5', 'images/Img379159337.jpg', '2024/08/15', '浙江舟山', '菜管家', '2024-08-15 00:29:00', '0', '0', '1', '0', '123');
INSERT INTO `tb_goods` VALUES ('125', '19', '121', '东北大米', 'MM-DM-1', '东北大米', '3.5', '2.8', 'images/wuchangmi1.jpg', '2024/08/15', '黑龙江', '菜管家', '2024-08-15 00:29:03', '0', '0', '1', '0', '889');
INSERT INTO `tb_goods` VALUES ('126', '19', '122', '荞麦面', 'MM-MT-1', '荞麦面', '2.5', '2.2', 'images/2_120227181127_6.jpg', '2024/08/15', '山东', '菜管家', '2024-08-15 00:29:06', '0', '0', '1', '0', '987');
INSERT INTO `tb_goods` VALUES ('127', '19', '131', '精品绿豆', 'MMLY-LD-1', '新鲜绿豆', '12.5', '11.8', 'images/5130932_160853646067_2.jpg', '2024/08/15', '苏州', '菜管家', '2024-08-15 00:29:09', '0', '1', '0', '0', '552');
INSERT INTO `tb_goods` VALUES ('128', '19', '132', '传统黄豆', 'MMLY-HD-1', '黄豆', '5.8', '5.2', 'images/hdou.jpg', '2024/08/15', '大连', '菜管家', '2024-08-15 00:29:13', '0', '1', '0', '0', '888');
INSERT INTO `tb_goods` VALUES ('129', '20', '123', '河虾', 'SC-HX-1', '淡水河虾，纯天然。', '65.8', '62.8', 'images/00027936.jpg', '2024/08/15', '太湖', '菜管家', '2024-08-15 00:29:16', '0', '0', '0', '1', '256');
INSERT INTO `tb_goods` VALUES ('130', '20', '124', '鲫鱼', 'SC-JY-1', '长江鲫鱼', '12.5', '10.8', 'images/2646852_134645057480_2.jpg', '2024/08/15', '靖江', '菜管家', '2024-08-15 00:29:19', '0', '0', '0', '1', '566');
INSERT INTO `tb_goods` VALUES ('131', '21', '127', '海天酱油', 'YYJC-JY-1', '海天特级鲜酱油', '15.8', '13.8', 'images/201010180956013901.jpg', '2024/08/15', '浙江', '海天', '2024-08-15 00:29:22', '0', '0', '0', '1', '758');
INSERT INTO `tb_goods` VALUES ('132', '16', '133', '大白菜', 'DBC', '新鲜大白菜', '1.9', '1.5', 'images/dbc.jpg', '2024/08/15', '山东', '菜管家', '2024-08-15 00:29:28', '0', '0', '0', '1', '1000');

-- ----------------------------
-- Table structure for `tb_inform`
-- ----------------------------
DROP TABLE IF EXISTS `tb_inform`;
CREATE TABLE `tb_inform` (
  `informId` int(11) NOT NULL AUTO_INCREMENT,
  `informTitle` varchar(30) DEFAULT NULL,
  `informContent` varchar(30) DEFAULT NULL,
  `informTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`informId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_inform
-- ----------------------------
INSERT INTO `tb_inform` VALUES ('2', '电子商务网站试营业啦~~', '测试', '2024-08-17 19:31:08');

-- ----------------------------
-- Table structure for `tb_note`
-- ----------------------------
DROP TABLE IF EXISTS `tb_note`;
CREATE TABLE `tb_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `content` varchar(50) NOT NULL,
  `ly_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `imgs` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_note
-- ----------------------------
INSERT INTO `tb_note` VALUES ('2', '能不能便宜点', 'kitty15', '求便宜点。。。', '2018-01-04 20:55:33', 'images/face/pic4.gif');
INSERT INTO `tb_note` VALUES ('4', '有没有优惠啊', 'demo123', '有木有？', '2018-01-05 17:37:42', 'images/face/pic2.gif');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `recvName` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('4', 'wangjihuan', '大学宿舍', 'wangjihuan', '123232', '123123@qq.com', '2024-08-21 01:18:34', '2');

-- ----------------------------
-- Table structure for `tb_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `goodsName` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `orderId` (`orderId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `tb_orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`),
  CONSTRAINT `tb_orderitem_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `tb_goods` (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderitem
-- ----------------------------
INSERT INTO `tb_orderitem` VALUES ('6', '4', '116', '水果西红柿', '13.5', '3');
INSERT INTO `tb_orderitem` VALUES ('7', '4', '117', '时令小青菜', '2.5', '1');

-- ----------------------------
-- Table structure for `tb_subtype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_subtype`;
CREATE TABLE `tb_subtype` (
  `subTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `superTypeId` int(11) DEFAULT NULL,
  `subTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subTypeId`),
  KEY `superTypeId` (`superTypeId`),
  CONSTRAINT `tb_subtype_ibfk_1` FOREIGN KEY (`superTypeId`) REFERENCES `tb_supertype` (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_subtype
-- ----------------------------
INSERT INTO `tb_subtype` VALUES ('111', '16', '西红柿');
INSERT INTO `tb_subtype` VALUES ('112', '16', '青菜');
INSERT INTO `tb_subtype` VALUES ('113', '16', '笋瓜');
INSERT INTO `tb_subtype` VALUES ('114', '17', '香菇');
INSERT INTO `tb_subtype` VALUES ('115', '17', '蘑菇');
INSERT INTO `tb_subtype` VALUES ('116', '17', '杏鲍菇');
INSERT INTO `tb_subtype` VALUES ('117', '17', '木耳');
INSERT INTO `tb_subtype` VALUES ('118', '18', '红豆');
INSERT INTO `tb_subtype` VALUES ('119', '18', '粉丝');
INSERT INTO `tb_subtype` VALUES ('120', '18', '海带');
INSERT INTO `tb_subtype` VALUES ('121', '19', '大米');
INSERT INTO `tb_subtype` VALUES ('122', '19', '面条');
INSERT INTO `tb_subtype` VALUES ('123', '20', '河虾');
INSERT INTO `tb_subtype` VALUES ('124', '20', '鲫鱼');
INSERT INTO `tb_subtype` VALUES ('125', '20', '鲢鱼');
INSERT INTO `tb_subtype` VALUES ('126', '20', '甲鱼');
INSERT INTO `tb_subtype` VALUES ('127', '21', '酱油');
INSERT INTO `tb_subtype` VALUES ('128', '21', '醋');
INSERT INTO `tb_subtype` VALUES ('129', '21', '麻油');
INSERT INTO `tb_subtype` VALUES ('130', '21', '酱');
INSERT INTO `tb_subtype` VALUES ('131', '19', '绿豆');
INSERT INTO `tb_subtype` VALUES ('132', '19', '黄豆');
INSERT INTO `tb_subtype` VALUES ('133', '16', '大白菜');
INSERT INTO `tb_subtype` VALUES ('134', '22', '测试');

-- ----------------------------
-- Table structure for `tb_supertype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_supertype`;
CREATE TABLE `tb_supertype` (
  `superTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_supertype
-- ----------------------------
INSERT INTO `tb_supertype` VALUES ('16', '新鲜蔬菜');
INSERT INTO `tb_supertype` VALUES ('17', '食用菌');
INSERT INTO `tb_supertype` VALUES ('18', '干货');
INSERT INTO `tb_supertype` VALUES ('19', '米面粮油');
INSERT INTO `tb_supertype` VALUES ('20', '水产');
INSERT INTO `tb_supertype` VALUES ('21', '油盐酱醋');
INSERT INTO `tb_supertype` VALUES ('22', '测试');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `trueName` varchar(40) NOT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mphone` varchar(15) DEFAULT NULL,
  `question` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `score` int(11) DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'hellokitty', '111111', '667788@qq.com', '咔咔咔', '男', '1995-11-25', '上海', '111222', '021-55558888', '13513513555', '你最爱的人的名字叫什么', 'cat', null, null);
INSERT INTO `tb_user` VALUES ('3', 'hellokitty2', '123456', 'ello@qq.com', '哇哈哈', '男', '1993-10-18', '上海市', '111111', '021-88885555', '13512510001', '你喜欢的业余爱好是什么', '行吗好', null, null);
INSERT INTO `tb_user` VALUES ('4', 'kitty14', '111111', 'kitty@qq.com', '张三四', '男', '1995-11-11', '中国上海', '111111', '021-22221111', '13913813888', '你喜欢的业余爱好是什么', '打球', null, null);
INSERT INTO `tb_user` VALUES ('5', 'kitty15', '111111', 'kitty@qq.com', '李四五', '男', '1993-09-08', '中国', '100100', '010-68688888', '13313313333', '你喜欢的业余爱好是什么', '看书', null, null);
INSERT INTO `tb_user` VALUES ('6', 'gogo2018', '111111', 'gogo@qq.com', '前进', '男', '1995-10-10', '中国', '100100', '010-88889999', '13512512888', '你喜欢的业余爱好是什么', 'play', null, null);
INSERT INTO `tb_user` VALUES ('7', 'demo123', '123456', 'demo@qq.com', '王二', '男', '1993-12-12', '中国', '100100', '010-68688888', '13913913999', '你喜欢的业余爱好是什么', '游泳', null, null);
INSERT INTO `tb_user` VALUES ('8', 'wahaha', '123456', 'wahaha@qq.com', '哇哈哈', '男', '1995-11-11', '中国', '111222', '89890000', '13813813888', '你喜欢的业余爱好是什么', '看电视', null, null);
INSERT INTO `tb_user` VALUES ('9', 'hihihi', '111111', 'hihihi@163.com', '好好好', '男', '1994-12-11', '中国', '222222', '010-29991111', '13512512555', '你喜欢的业余爱好是什么', '玩游戏', null, null);
INSERT INTO `tb_user` VALUES ('10', 'wangjihuan', '123456', '123123@qq.com', '王先生', '男', '1996-10-12', '大学宿舍', '123232', '010-21221222', '15011112222', '你喜欢的业余爱好是什么', '跑步', null, null);
