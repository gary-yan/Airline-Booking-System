/*
Navicat MySQL Data Transfer

Source Server         : airbook
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : airbooking

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-01-08 20:41:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `company` varchar(50) NOT NULL,
  `num` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `f_three` varchar(50) NOT NULL,
  `from_time` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `t_three` varchar(50) NOT NULL,
  `to_time` varchar(50) NOT NULL,
  `time` float(10,2) NOT NULL,
  `price` float(10,1) NOT NULL,
  `rate` float(10,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flight
-- ----------------------------
INSERT INTO `flight` VALUES ('1', 'Air China', 'CA6004', 'Berlin', 'TXL', '11:45', 'Beijing', 'PEK', '06:15', '11.50', '11830.0', '7.2');
INSERT INTO `flight` VALUES ('2', 'Air Canada Rouge', 'AC1824', 'Berlin', 'TXL', '12:00', 'Beijing', 'PEK', '07:00', '12.00', '10384.0', '7.5');
INSERT INTO `flight` VALUES ('3', 'Air Berlin', 'AB8036', 'Berlin', 'TXL', '17:55', 'Beijing', 'PEK', '13:05', '12.50', '14521.0', '6.5');
INSERT INTO `flight` VALUES ('4', 'Aeroflot Russian Airlines', 'SU2319', 'Berlin', 'TXL', '13:50', 'Beijing', 'PEK', '09:50', '13.00', '3479.0', '10.0');
INSERT INTO `flight` VALUES ('5', 'Aeroflot Russian Airlines', 'SU2313', 'Berlin', 'TXL', '12:05', 'Beijing', 'PEK', '09:50', '14.75', '3479.0', '9.4');
INSERT INTO `flight` VALUES ('6', 'KLM', 'KL1826', 'Berlin', 'TXL', '14:30', 'Beijing', 'PEK', '09:55', '12.50', '5057.0', '9.3');
INSERT INTO `flight` VALUES ('7', 'Brussels Airlines', 'SN2580', 'Berlin', 'TXL', '08:35', 'Beijing', 'PEK', '05:20', '13.75', '5135.0', '9.0');
INSERT INTO `flight` VALUES ('8', 'Finnair', 'AY912', 'Berlin', 'TXL', '12:05', 'Beijing', 'PEK', '07:50', '12.75', '6374.0', '8.7');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('6', 'goboe');
INSERT INTO `test` VALUES ('7', 'qutyb');
INSERT INTO `test` VALUES ('8', 'peond');
INSERT INTO `test` VALUES ('9', 'ackyc');
INSERT INTO `test` VALUES ('10', 'usksc');
INSERT INTO `test` VALUES ('11', 'quorc');
INSERT INTO `test` VALUES ('12', 'gorte');
INSERT INTO `test` VALUES ('13', 'takse');
INSERT INTO `test` VALUES ('14', 'itula');
INSERT INTO `test` VALUES ('15', 'viene');
INSERT INTO `test` VALUES ('16', 'acema');
INSERT INTO `test` VALUES ('17', 'agngb');
INSERT INTO `test` VALUES ('18', 'obrma');
INSERT INTO `test` VALUES ('19', 'acisd');
INSERT INTO `test` VALUES ('20', 'reinb');
INSERT INTO `test` VALUES ('21', 'quinc');
INSERT INTO `test` VALUES ('22', 'inase');
INSERT INTO `test` VALUES ('23', 'daele');
INSERT INTO `test` VALUES ('24', 'taedd');
INSERT INTO `test` VALUES ('25', 'inngc');
INSERT INTO `test` VALUES ('26', 'evthb');
INSERT INTO `test` VALUES ('27', 'iteea');
INSERT INTO `test` VALUES ('28', 'auond');
INSERT INTO `test` VALUES ('29', 'reond');
INSERT INTO `test` VALUES ('30', 'thone');
INSERT INTO `test` VALUES ('31', 'ungea');
INSERT INTO `test` VALUES ('32', 'nursb');
INSERT INTO `test` VALUES ('33', 'agnsd');
INSERT INTO `test` VALUES ('34', 'bygsa');
INSERT INTO `test` VALUES ('35', 'strea');
INSERT INTO `test` VALUES ('36', 'inond');
INSERT INTO `test` VALUES ('37', 'rastd');
INSERT INTO `test` VALUES ('38', 'coemd');
INSERT INTO `test` VALUES ('39', 'ifedc');
INSERT INTO `test` VALUES ('40', 'bu12a');
INSERT INTO `test` VALUES ('41', 'quesa');
INSERT INTO `test` VALUES ('42', 'inlle');
INSERT INTO `test` VALUES ('43', 'reinb');
INSERT INTO `test` VALUES ('44', 'iteea');
INSERT INTO `test` VALUES ('45', 'adtsc');
INSERT INTO `test` VALUES ('46', 'treda');
INSERT INTO `test` VALUES ('47', 'tolya');
INSERT INTO `test` VALUES ('48', 'retsa');
INSERT INTO `test` VALUES ('49', 'toreb');
INSERT INTO `test` VALUES ('50', 'inrsb');
INSERT INTO `test` VALUES ('51', 'tedec');
INSERT INTO `test` VALUES ('52', 'onemc');
INSERT INTO `test` VALUES ('53', 'inuec');
INSERT INTO `test` VALUES ('54', 'tarsc');
INSERT INTO `test` VALUES ('55', 'retsb');
INSERT INTO `test` VALUES ('56', 'pednt');
INSERT INTO `test` VALUES ('57', 'foctc');
INSERT INTO `test` VALUES ('58', 'atnse');
INSERT INTO `test` VALUES ('59', 'coeme');
INSERT INTO `test` VALUES ('60', 'soona');
INSERT INTO `test` VALUES ('61', 'duade');
INSERT INTO `test` VALUES ('62', 'taedd');
INSERT INTO `test` VALUES ('63', 'ifone');
INSERT INTO `test` VALUES ('64', 'armed');
INSERT INTO `test` VALUES ('65', 'inlsa');
INSERT INTO `test` VALUES ('66', 'thede');
INSERT INTO `test` VALUES ('67', 'evthb');
INSERT INTO `test` VALUES ('68', 'it08d');
INSERT INTO `test` VALUES ('69', 'thamd');
INSERT INTO `test` VALUES ('70', 'tangb');
INSERT INTO `test` VALUES ('71', 'cuctb');
INSERT INTO `test` VALUES ('72', 'whetd');
INSERT INTO `test` VALUES ('73', 'thonc');
INSERT INTO `test` VALUES ('74', 'sttyd');
INSERT INTO `test` VALUES ('75', 'itonb');
INSERT INTO `test` VALUES ('76', 'arone');
INSERT INTO `test` VALUES ('77', 'innsd');
INSERT INTO `test` VALUES ('78', 'wictb');
INSERT INTO `test` VALUES ('79', 'gonga');
INSERT INTO `test` VALUES ('80', 'avsee');
INSERT INTO `test` VALUES ('81', 'quesa');
INSERT INTO `test` VALUES ('82', 'itdsd');
INSERT INTO `test` VALUES ('83', 'acrsd');
INSERT INTO `test` VALUES ('84', 'opera');
INSERT INTO `test` VALUES ('85', 'quorc');
INSERT INTO `test` VALUES ('86', 'itonc');
INSERT INTO `test` VALUES ('87', 'foesa');
INSERT INTO `test` VALUES ('88', 'ifond');
INSERT INTO `test` VALUES ('89', 'stonc');
INSERT INTO `test` VALUES ('90', 'soona');
INSERT INTO `test` VALUES ('91', 'ifone');
INSERT INTO `test` VALUES ('92', 'sclse');
INSERT INTO `test` VALUES ('93', 'viuee');
INSERT INTO `test` VALUES ('94', 'acixd');
INSERT INTO `test` VALUES ('95', 'thstd');
INSERT INTO `test` VALUES ('96', 'auond');
INSERT INTO `test` VALUES ('97', 'tarsc');
INSERT INTO `test` VALUES ('98', 'trtsa');
INSERT INTO `test` VALUES ('99', 'gorte');
INSERT INTO `test` VALUES ('100', 'reesa');
INSERT INTO `test` VALUES ('101', 'reond');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `gender` enum('Secret','FeMale','Male') NOT NULL DEFAULT 'Secret',
  `email` varchar(50) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Hao', 'Chen', 'Secret', 'howers@qq.com', '15711321311', '1992-10-07', '1234567');
INSERT INTO `user` VALUES ('2', '123', '123', 'Secret', '23123', '1231', '3123', '123123');
INSERT INTO `user` VALUES ('3', '123', '123', 'Male', '123', '123', '12312', '123');
INSERT INTO `user` VALUES ('4', '1231', '231', 'FeMale', '3123', '1231', '3123', '3123');
INSERT INTO `user` VALUES ('5', '123', '123', 'Male', '312', '312', '2312', '1231');
INSERT INTO `user` VALUES ('6', '12312', '3123', 'Male', '123123', '312', '3123123', '123123');
INSERT INTO `user` VALUES ('7', 'hao', 'ac', 'Male', '123123', '123123', '123123', '123123');
INSERT INTO `user` VALUES ('8', '123', '123', 'Male', '123123', '123123', '1999-1-18', '123');
INSERT INTO `user` VALUES ('9', '123', '123', 'Male', '123123@qq.com', '123123', '1998-1-18', '123');
INSERT INTO `user` VALUES ('10', 'hs', 'shj', 'Male', 'ddafj', 'dfjlk', '2014------', 'qwe');
INSERT INTO `user` VALUES ('11', '1', '1', 'Male', '1', '1', '2016------', '1');
INSERT INTO `user` VALUES ('12', 'hao', 'chen', 'Male', 'df@qq.com', '1234567', '莽搂聵氓炉聠----', '12345678');
INSERT INTO `user` VALUES ('13', 'leela', 'praveera', 'Male', 'lpraveera@gmail.com', '46-767815951', '1995-3-6', 'leela123');
INSERT INTO `user` VALUES ('14', 'shravani', 'Nelapudi', 'Male', 'lpraveera@gmail.com', '46-767815951', '1994-6-17', 'leela123');
INSERT INTO `user` VALUES ('15', 'shravani', 'Nelapudi', 'Male', 'lpraveera@gmail.com', '46-767815951', '1994-6-17', 'leela123');
INSERT INTO `user` VALUES ('16', '23', '123', 'Male', '123123@123123', '12312123', '1999-4-18', '123');
INSERT INTO `user` VALUES ('17', 'hao', '123', 'Male', 'hhh@qq.com', '46123123', '1999-2-17', '123123');
INSERT INTO `user` VALUES ('18', 'y', 'gn', 'Male', 'ygn@ygn.com', '76', 'Secret------', '123456');

-- ----------------------------
-- Table structure for user_flight
-- ----------------------------
DROP TABLE IF EXISTS `user_flight`;
CREATE TABLE `user_flight` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `company` varchar(50) NOT NULL,
  `num` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `f_three` varchar(50) NOT NULL,
  `from_time` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `t_three` varchar(50) NOT NULL,
  `to_time` varchar(50) NOT NULL,
  `time` float(10,2) NOT NULL,
  `price` float(10,1) NOT NULL,
  `rate` float(10,1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `order` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_flight
-- ----------------------------
INSERT INTO `user_flight` VALUES ('28', 'Aeroflot Russian Airlines', 'SU2319', 'Berlin', 'TXL', '13:50', 'Beijing', 'PEK', 'PEK', '13.00', '3479.0', '10.0', 'howers@qq.com', '2017-01-19', '20170108403');
INSERT INTO `user_flight` VALUES ('29', 'Finnair', 'AY912', 'Berlin', 'TXL', '12:05', 'Beijing', 'PEK', 'PEK', '12.75', '6374.0', '8.7', 'howers@qq.com', '2017-01-19', '20170108247');
