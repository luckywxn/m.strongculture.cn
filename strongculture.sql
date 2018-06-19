/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : m_strongculture

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-04-21 13:51:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for strongculture_system_attach
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_attach`;
CREATE TABLE `strongculture_system_attach` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(255) NOT NULL COMMENT '附件名称',
  `path` varchar(255) NOT NULL COMMENT '附件路径',
  `type` varchar(20) NOT NULL COMMENT '附件文件类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL COMMENT '对应模块',
  `action` varchar(50) NOT NULL COMMENT '对应操作',
  `doc_sysno` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的模块id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统-附件表';

-- ----------------------------
-- Records of strongculture_system_attach
-- ----------------------------

-- ----------------------------
-- Table structure for strongculture_system_config_review
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_config_review`;
CREATE TABLE `strongculture_system_config_review` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `reviewtype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评审类别：1合同评审',
  `department_sysno` bigint(20) NOT NULL COMMENT '所属部门表主键',
  `departmentname` varchar(50) DEFAULT NULL COMMENT '冗余部门名称',
  `position_sysno` bigint(20) DEFAULT NULL COMMENT '岗位，岗位信息表主键',
  `positionname` varchar(50) DEFAULT NULL COMMENT '冗余岗位名称',
  `sortnum` int(11) NOT NULL DEFAULT '1' COMMENT '排序号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评审参与部门配置表';

-- ----------------------------
-- Records of strongculture_system_config_review
-- ----------------------------

-- ----------------------------
-- Table structure for strongculture_system_department
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_department`;
CREATE TABLE `strongculture_system_department` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_sysno` bigint(20) NOT NULL DEFAULT '0' COMMENT '父ID',
  `departmentno` varchar(20) NOT NULL COMMENT '部门编号',
  `departmentname` varchar(50) NOT NULL COMMENT '部门名称',
  `departmentdesc` varchar(255) DEFAULT NULL COMMENT '部门描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统-部门信息表';

-- ----------------------------
-- Records of strongculture_system_department
-- ----------------------------

-- ----------------------------
-- Table structure for strongculture_system_department-r-privilege
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_department-r-privilege`;
CREATE TABLE `strongculture_system_department-r-privilege` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `department_sysno` bigint(20) NOT NULL COMMENT '所属部门表主键',
  `privilege_sysno` bigint(20) NOT NULL COMMENT '所属权限表主键',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统部门与权限多对多关系信息表';

-- ----------------------------
-- Records of strongculture_system_department-r-privilege
-- ----------------------------

-- ----------------------------
-- Table structure for strongculture_system_employee
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_employee`;
CREATE TABLE `strongculture_system_employee` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `department_sysno` bigint(20) NOT NULL COMMENT '所属部门表主键',
  `position_sysno` bigint(20) DEFAULT NULL COMMENT '所属岗位信息表主键',
  `employeeno` varchar(20) NOT NULL COMMENT '员工编号',
  `employeeid` varchar(50) DEFAULT NULL COMMENT '员工号',
  `employeename` varchar(20) NOT NULL COMMENT '员工姓名',
  `employeephoto` varchar(255) DEFAULT NULL COMMENT '员工照片',
  `employeegender` bit(1) DEFAULT NULL COMMENT '性别：1男0女',
  `employeebirthdate` date DEFAULT NULL COMMENT '出生日期',
  `employeenation` varchar(20) DEFAULT NULL COMMENT '员工民族',
  `employeeorigin` varchar(50) DEFAULT NULL COMMENT '员工籍贯',
  `employeemarital` varchar(20) DEFAULT NULL COMMENT '婚姻状况',
  `employeepolitics` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `employeeeducation` varchar(20) DEFAULT NULL COMMENT '学历',
  `employeemajor` varchar(50) DEFAULT NULL COMMENT '专业',
  `employeeuniversity` varchar(50) DEFAULT NULL COMMENT '毕业院校',
  `employeecontactaddress` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `employeeemail` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `employeeidnumber` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `employeecontacttel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `employeebankaccount` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `employeeentrydate` date DEFAULT NULL COMMENT '入职日期',
  `employeetitle` varchar(50) DEFAULT NULL COMMENT '职称',
  `employeecontractperiod` varchar(20) DEFAULT NULL COMMENT '合同期限',
  `employeeemploymentform` varchar(20) DEFAULT NULL COMMENT '聘用形式',
  `employeeinservicestate` tinyint(1) DEFAULT NULL COMMENT '在职状态：1在职2离职',
  `employeeresume` varchar(1000) DEFAULT NULL COMMENT '简历',
  `employeeremarks` varchar(1000) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统-员工信息表';

-- ----------------------------
-- Records of strongculture_system_employee
-- ----------------------------
INSERT INTO `strongculture_system_employee` VALUES ('1', '1', '1', 'E0001', '172', '伍贤能', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for strongculture_system_log_privilege
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_log_privilege`;
CREATE TABLE `strongculture_system_log_privilege` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_sysno` bigint(20) NOT NULL COMMENT '所属账户表主键',
  `user_realname` varchar(50) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `loginip` varchar(255) DEFAULT NULL COMMENT '操作时登录IP',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`sysno`),
  KEY `user_sysno` (`user_sysno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统-日志信息表';

-- ----------------------------
-- Records of strongculture_system_log_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for strongculture_system_position
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_position`;
CREATE TABLE `strongculture_system_position` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `positionno` varchar(20) NOT NULL COMMENT '岗位编号',
  `department_sysno` bigint(20) NOT NULL COMMENT '所属部门信息表主键',
  `positionname` varchar(20) NOT NULL COMMENT '岗位名称',
  `positiondesc` varchar(255) DEFAULT NULL COMMENT '岗位备注',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统-岗位信息表';

-- ----------------------------
-- Records of strongculture_system_position
-- ----------------------------
INSERT INTO `strongculture_system_position` VALUES ('1', 'P0001', '1', '董事长', null, '1', '0', '1', '2017-01-29 21:46:15', '2017-01-29 21:46:25');
INSERT INTO `strongculture_system_position` VALUES ('2', 'P0002', '1', '', null, '1', '0', '1', '2017-02-26 21:46:02', '2017-02-26 21:46:11');

-- ----------------------------
-- Table structure for strongculture_system_privilege
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_privilege`;
CREATE TABLE `strongculture_system_privilege` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `privilegeno` varchar(20) NOT NULL COMMENT '权限编号',
  `privilegename` varchar(50) NOT NULL COMMENT '权限名称',
  `privilegedesc` varchar(255) DEFAULT NULL,
  `privilegeresource` varchar(255) DEFAULT NULL COMMENT '权限资源',
  `parent_sysno` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属上级主键，没有为0',
  `parentsysnotype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限类型：1菜单2显示权限3操作权限',
  `menuorder` int(11) NOT NULL DEFAULT '1' COMMENT '数字越大越靠前',
  `privilegecontroller` varchar(50) NOT NULL COMMENT '用来权限判断controller',
  `privilegeaction` varchar(50) NOT NULL COMMENT '用来判断模块权限action',
  `needcheck` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否需要验证权限 0  否 1 是',
  `parentsysnoicon` varchar(255) DEFAULT NULL COMMENT '权限图标',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='系统-权限信息表';

-- ----------------------------
-- Records of strongculture_system_privilege
-- ----------------------------
INSERT INTO `strongculture_system_privilege` VALUES ('1', 'A0001', '学前教育', '', '', '0', '1', '6', '', '', '1', '', '1', '0', '1', '0000-00-00 00:00:00', '2016-12-31 20:52:10');
INSERT INTO `strongculture_system_privilege` VALUES ('2', 'A0002', '小学教育', '', '', '0', '1', '5', '', '', '1', '', '1', '0', '1', '0000-00-00 00:00:00', '2016-12-31 20:52:16');
INSERT INTO `strongculture_system_privilege` VALUES ('3', 'A0003', '初中教育', '', '', '0', '1', '4', '', '', '1', '', '1', '0', '1', '0000-00-00 00:00:00', '2016-12-31 20:52:24');
INSERT INTO `strongculture_system_privilege` VALUES ('4', 'A0004', '高中教育', '', '', '0', '1', '3', '', '', '1', '', '1', '0', '1', '0000-00-00 00:00:00', '2016-12-31 20:52:31');
INSERT INTO `strongculture_system_privilege` VALUES ('5', 'A0005', '大学教育', '', '', '0', '1', '2', '', '', '1', '', '1', '0', '1', '0000-00-00 00:00:00', '2016-12-31 20:52:35');
INSERT INTO `strongculture_system_privilege` VALUES ('6', 'A0006', '社会教育', '', '', '0', '1', '1', '', '', '1', '', '1', '0', '1', '0000-00-00 00:00:00', '2016-12-31 20:51:21');
INSERT INTO `strongculture_system_privilege` VALUES ('7', 'A0000', '系统管理', '', '', '0', '1', '0', '', '', '1', '', '1', '0', '1', '0000-00-00 00:00:00', '2016-12-31 20:51:05');
INSERT INTO `strongculture_system_privilege` VALUES ('8', 'A0000-0001', '权限树', null, '/system/privilegetree', '7', '1', '1', '', '', '1', null, '1', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_system_privilege` VALUES ('9', 'A0000-0001', '角色', '', '/system/rolelist', '7', '1', '0', '', 'rolelist', '1', '', '1', '0', '1', '2016-12-31 20:44:15', '2016-12-31 20:47:11');
INSERT INTO `strongculture_system_privilege` VALUES ('10', 'A0001-0001', '弟子规', '', '/preschooledu/diziguilist', '1', '1', '97', '', 'diziguilist', '1', '', '1', '0', '1', '2016-12-31 20:55:14', '2017-01-02 21:42:08');
INSERT INTO `strongculture_system_privilege` VALUES ('11', 'A0002-0001', '一年级', '', '', '2', '1', '6', '', '', '1', '', '1', '0', '1', '2016-12-31 20:56:02', '2016-12-31 21:49:32');
INSERT INTO `strongculture_system_privilege` VALUES ('12', 'A0003-0001', '初一（上）', '', '', '3', '1', '6', '', '', '1', '', '1', '0', '1', '2016-12-31 20:56:28', '2017-01-04 20:07:14');
INSERT INTO `strongculture_system_privilege` VALUES ('13', 'A0004-0001', '高一', '', '', '4', '1', '3', '', '', '1', '', '1', '0', '1', '2016-12-31 20:57:08', '2016-12-31 21:51:48');
INSERT INTO `strongculture_system_privilege` VALUES ('14', 'A0005-0001', '大一', '', '', '5', '1', '4', '', '', '1', '', '1', '0', '1', '2016-12-31 20:57:28', '2016-12-31 21:52:00');
INSERT INTO `strongculture_system_privilege` VALUES ('15', 'A0006-0001', '市场倍增学', '', '', '6', '1', '3', '', '', '1', '', '1', '0', '1', '2016-12-31 20:58:00', '2016-12-31 21:52:30');
INSERT INTO `strongculture_system_privilege` VALUES ('16', 'A0001-0002', '增广贤文', '', '/preschooledu/zengguanglist', '1', '1', '96', '', 'zengguanglist', '1', '', '1', '0', '1', '2016-12-31 21:33:38', '2017-01-02 21:41:57');
INSERT INTO `strongculture_system_privilege` VALUES ('17', 'A0002-0002', '二年级', '', '', '2', '1', '5', '', '', '1', '', '1', '0', '1', '2016-12-31 21:34:06', '2016-12-31 21:49:38');
INSERT INTO `strongculture_system_privilege` VALUES ('18', 'A0006-0002', '人际关系学', '', '', '6', '1', '2', '', '', '1', '', '1', '0', '1', '2016-12-31 21:35:10', '2016-12-31 21:52:36');
INSERT INTO `strongculture_system_privilege` VALUES ('19', 'A0006-0003', '政治经济学', '', '', '6', '1', '1', '', '', '1', '', '1', '0', '1', '2016-12-31 21:37:27', '2016-12-31 21:52:48');
INSERT INTO `strongculture_system_privilege` VALUES ('20', 'A0003-0003', '初二（上）', '', '', '3', '1', '4', '', '', '1', '', '1', '0', '1', '2016-12-31 21:40:10', '2017-01-04 20:09:10');
INSERT INTO `strongculture_system_privilege` VALUES ('21', 'A0003-0005', '初三（上）', '', '', '3', '1', '2', '', '', '1', '', '1', '0', '1', '2016-12-31 21:40:25', '2017-01-04 20:09:49');
INSERT INTO `strongculture_system_privilege` VALUES ('22', 'A0004-0002', '高二', '', '', '4', '1', '2', '', '', '1', '', '1', '0', '1', '2016-12-31 21:40:49', '2016-12-31 21:51:29');
INSERT INTO `strongculture_system_privilege` VALUES ('23', 'A0004-0003', '高三', '', '', '4', '1', '1', '', '', '1', '', '1', '0', '1', '2016-12-31 21:41:04', '2016-12-31 21:51:54');
INSERT INTO `strongculture_system_privilege` VALUES ('24', 'A0005-0002', '大二', '', '', '5', '1', '3', '', '', '1', '', '1', '0', '1', '2016-12-31 21:41:24', '2016-12-31 21:52:06');
INSERT INTO `strongculture_system_privilege` VALUES ('25', 'A0005-0003', '大三', '', '', '5', '1', '2', '', '', '1', '', '1', '0', '1', '2016-12-31 21:41:41', '2016-12-31 21:52:11');
INSERT INTO `strongculture_system_privilege` VALUES ('26', 'A0005-0004', '大四', '', '', '5', '1', '1', '', '', '1', '', '1', '0', '1', '2016-12-31 21:42:01', '2016-12-31 21:52:18');
INSERT INTO `strongculture_system_privilege` VALUES ('27', 'A0002-0003', '三年级', '', '', '2', '1', '4', '', '', '1', '', '1', '0', '1', '2016-12-31 21:49:14', '2016-12-31 21:49:14');
INSERT INTO `strongculture_system_privilege` VALUES ('28', 'A0002-0004', '四年级', '', '', '2', '1', '3', '', '', '1', '', '1', '0', '1', '2016-12-31 21:49:58', '2016-12-31 21:49:58');
INSERT INTO `strongculture_system_privilege` VALUES ('29', 'A0002-0005', '五年级', '', '', '2', '1', '2', '', '', '1', '', '1', '0', '1', '2016-12-31 21:50:13', '2016-12-31 21:54:56');
INSERT INTO `strongculture_system_privilege` VALUES ('30', 'A0002-0006', '六年级', '', '', '2', '1', '1', '', '', '1', '', '1', '0', '1', '2016-12-31 21:50:33', '2016-12-31 21:50:33');
INSERT INTO `strongculture_system_privilege` VALUES ('31', 'A0001-0001-0001', '总序', '', '/preschooledu/diziguilist', '10', '1', '99', '', 'diziguilist', '1', '', '1', '1', '1', '2016-12-31 22:49:27', '2016-12-31 22:50:04');
INSERT INTO `strongculture_system_privilege` VALUES ('32', 'A0002-0001-0001', '语文（上）', '', '/primaryschooledu/primaryschooledulist/grade/1.1', '11', '1', '99', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2016-12-31 23:03:48', '2017-01-02 12:34:04');
INSERT INTO `strongculture_system_privilege` VALUES ('33', 'A0002-0001-0002', '数学（上）', '', '/primaryschooledu/primaryschooledulist2/grade/1.3', '11', '1', '98', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2016-12-31 23:04:14', '2017-01-02 12:36:38');
INSERT INTO `strongculture_system_privilege` VALUES ('34', 'A0006-0004', '道德经', '', '/socialedu/taotechinglist', '1', '1', '98', '', 'taotechinglist', '1', '', '1', '0', '1', '2016-12-31 23:06:50', '2017-01-02 21:24:29');
INSERT INTO `strongculture_system_privilege` VALUES ('35', 'A0006-0005', '鬼谷子', '', '/socialedu/guiguzilist', '6', '1', '-1', '', 'guiguzilist', '1', '', '1', '0', '1', '2016-12-31 23:07:26', '2017-01-01 00:18:18');
INSERT INTO `strongculture_system_privilege` VALUES ('36', 'A0006-0006', '天道', '', '/socialedu/tiandaolist', '6', '1', '-2', '', 'tiandaolist', '1', '', '1', '0', '1', '2017-01-01 00:04:50', '2017-01-01 00:05:35');
INSERT INTO `strongculture_system_privilege` VALUES ('37', 'A0006-0007', '卓有成效的管理者', '', '/socialedu/effectivemanagelist', '6', '1', '-3', '', 'effectivemanagelist', '1', '', '1', '0', '1', '2017-01-01 00:19:09', '2017-01-01 00:28:35');
INSERT INTO `strongculture_system_privilege` VALUES ('38', 'A0005-0005', '复旦大学', '', '', '5', '1', '-1', '', '', '1', '', '1', '0', '1', '2017-01-01 09:50:26', '2017-01-01 09:50:26');
INSERT INTO `strongculture_system_privilege` VALUES ('39', 'A0005-0005', '陈果老师', '', '/universityedu/fudanmrchenlist', '38', '1', '99', '', 'fudanmrchenlist', '1', '', '1', '0', '1', '2017-01-01 09:51:30', '2017-01-01 09:55:08');
INSERT INTO `strongculture_system_privilege` VALUES ('40', 'A0005-0006', '上海第二工业大学', '', '', '5', '1', '-2', '', '', '1', '', '1', '0', '1', '2017-01-01 09:52:40', '2017-01-01 09:52:40');
INSERT INTO `strongculture_system_privilege` VALUES ('41', 'A0005-0006-0001', '杨冠群老师', '', '/universityedu/secondmryanglist', '40', '1', '99', '', 'secondmryanglist', '1', '', '1', '0', '1', '2017-01-01 09:53:50', '2017-01-01 09:55:18');
INSERT INTO `strongculture_system_privilege` VALUES ('42', 'A0006-0001-0001', '市场倍增学', '', '/socialedu/marketmulttheorylist', '15', '1', '99', '', 'marketmulttheorylist', '1', '', '1', '0', '1', '2017-01-01 11:21:46', '2017-01-01 11:21:46');
INSERT INTO `strongculture_system_privilege` VALUES ('43', 'A0006-0003-0001', '李嘉诚语录一', '', '/socialedu/pelijiachenglist', '19', '1', '99', '', 'pelijiachenglist', '1', '', '1', '0', '1', '2017-01-01 11:45:07', '2017-01-01 11:45:07');
INSERT INTO `strongculture_system_privilege` VALUES ('44', 'A0006-0003-0002', '李嘉诚语录二', '', '/socialedu/pelijiachenglist2', '19', '1', '98', '', 'pelijiachenglist2', '1', '', '1', '0', '1', '2017-01-01 12:05:13', '2017-01-01 12:15:22');
INSERT INTO `strongculture_system_privilege` VALUES ('45', 'A0006-0002-0001', '梁凯恩', '', '/socialedu/liangkaienlist', '18', '1', '99', '', 'liangkaienlist', '1', '', '1', '0', '1', '2017-01-01 20:04:53', '2017-01-01 20:05:26');
INSERT INTO `strongculture_system_privilege` VALUES ('46', 'A0004-0001-0001', '阿房宫赋', '', '/shschooledu/afanggonglist', '13', '1', '99', '', 'afanggonglist', '1', '', '1', '0', '1', '2017-01-01 22:11:05', '2017-01-01 22:14:29');
INSERT INTO `strongculture_system_privilege` VALUES ('47', 'A0002-0001-0003', '语文（下）', '', '/primaryschooledu/primaryschooledulist/grade/1.2', '11', '1', '97', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:39:28', '2017-01-02 12:39:28');
INSERT INTO `strongculture_system_privilege` VALUES ('48', 'A0002-0001-0004', '数学（下）', '', '/primaryschooledu/primaryschooledulist2/grade/1.4', '11', '1', '96', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 12:41:47', '2017-01-02 12:41:47');
INSERT INTO `strongculture_system_privilege` VALUES ('49', 'A0002-0002-001', '语文（上）', '', '/primaryschooledu/primaryschooledulist/grade/2.1', '17', '1', '99', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:43:15', '2017-01-02 12:43:15');
INSERT INTO `strongculture_system_privilege` VALUES ('50', 'A0002-0002-002', '数学（上）', '', '/primaryschooledu/primaryschooledulist2/grade/2.3', '17', '1', '98', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 12:44:20', '2017-01-02 12:44:20');
INSERT INTO `strongculture_system_privilege` VALUES ('51', 'A0002-0002-003', '语文（下）', '', '/primaryschooledu/primaryschooledulist/grade/2.2', '17', '1', '97', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:51:04', '2017-01-02 12:51:04');
INSERT INTO `strongculture_system_privilege` VALUES ('52', 'A0002-0002-0004', '数学（下）', '', '/primaryschooledu/primaryschooledulist2/grade/2.4', '17', '1', '96', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 12:52:06', '2017-01-02 12:52:06');
INSERT INTO `strongculture_system_privilege` VALUES ('53', 'A0002-0003-0001', '语文（上）', '', '/primaryschooledu/primaryschooledulist/grade/3.1', '27', '1', '99', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:53:00', '2017-01-02 12:53:00');
INSERT INTO `strongculture_system_privilege` VALUES ('54', 'A0002-0003-0002', '数学（上）', '', '/primaryschooledu/primaryschooledulist2/grade/3.3', '27', '1', '98', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 12:53:55', '2017-01-02 12:53:55');
INSERT INTO `strongculture_system_privilege` VALUES ('55', 'A0002-0003-0003', '语文（下）', '', '/primaryschooledu/primaryschooledulist/grade/3.2', '27', '1', '97', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:54:43', '2017-01-02 12:54:43');
INSERT INTO `strongculture_system_privilege` VALUES ('56', 'A0002-0003-0004', '数学（下）', '', '/primaryschooledu/primaryschooledulist2/grade/3.4', '27', '1', '96', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 12:55:42', '2017-01-02 12:55:42');
INSERT INTO `strongculture_system_privilege` VALUES ('57', 'A0002-0004-0001', '语文（上）', '', '/primaryschooledu/primaryschooledulist/grade/4.1', '28', '1', '99', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:56:35', '2017-01-02 12:56:35');
INSERT INTO `strongculture_system_privilege` VALUES ('58', 'A0002-0004-0002', '数学（上）', '', '/primaryschooledu/primaryschooledulist2/grade/4.3', '28', '1', '98', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 12:57:21', '2017-01-02 12:57:21');
INSERT INTO `strongculture_system_privilege` VALUES ('59', 'A0002-0004-0003', '语文（下）', '', '/primaryschooledu/primaryschooledulist/grade/4.2', '28', '1', '97', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:58:13', '2017-01-02 12:58:13');
INSERT INTO `strongculture_system_privilege` VALUES ('60', 'A0002-0004-0004', '数学（下）', '', '/primaryschooledu/primaryschooledulist2/grade/4.4', '28', '1', '96', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 12:59:02', '2017-01-02 12:59:02');
INSERT INTO `strongculture_system_privilege` VALUES ('61', 'A0002-0005-0001', '语文（上）', '', '/primaryschooledu/primaryschooledulist/grade/5.1', '29', '1', '99', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 12:59:57', '2017-01-02 12:59:57');
INSERT INTO `strongculture_system_privilege` VALUES ('62', 'A0002-0005-0002', '数学（上）', '', '/primaryschooledu/primaryschooledulist2/grade/5.3', '29', '1', '98', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 13:00:49', '2017-01-02 13:00:49');
INSERT INTO `strongculture_system_privilege` VALUES ('63', 'A0002-0005-0003', '语文（下）', '', '/primaryschooledu/primaryschooledulist/grade/5.2', '29', '1', '97', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 13:01:33', '2017-01-02 13:01:33');
INSERT INTO `strongculture_system_privilege` VALUES ('64', 'A0002-0005-0004', '数学（下）', '', '/primaryschooledu/primaryschooledulist2/grade/5.4', '29', '1', '96', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 13:02:23', '2017-01-02 13:02:23');
INSERT INTO `strongculture_system_privilege` VALUES ('65', 'A0002-0006-0001', '语文（上）', '', '/primaryschooledu/primaryschooledulist/grade/6.1', '30', '1', '99', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 13:03:05', '2017-01-02 13:03:05');
INSERT INTO `strongculture_system_privilege` VALUES ('66', 'A0002-0006-0002', '数学（上）', '', '/primaryschooledu/primaryschooledulist2/grade/6.3', '30', '1', '98', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 13:03:52', '2017-01-02 13:03:52');
INSERT INTO `strongculture_system_privilege` VALUES ('67', 'A0002-0006-0003', '语文（下）', '', '/primaryschooledu/primaryschooledulist/grade/6.2', '30', '1', '97', '', 'primaryschooledulist', '1', '', '1', '0', '1', '2017-01-02 13:04:32', '2017-01-02 13:04:32');
INSERT INTO `strongculture_system_privilege` VALUES ('68', 'A0002-0006-0004', '数学（下）', '', '/primaryschooledu/primaryschooledulist2/grade/6.4', '30', '1', '96', '', 'primaryschooledulist2', '1', '', '1', '0', '1', '2017-01-02 13:05:20', '2017-01-02 13:05:20');
INSERT INTO `strongculture_system_privilege` VALUES ('69', 'A0001-0001', '论语', '', '/preschooledu/analectslist', '1', '1', '99', '', 'analectslist', '1', '', '1', '0', '1', '2017-01-02 21:23:30', '2017-01-02 21:23:30');
INSERT INTO `strongculture_system_privilege` VALUES ('70', 'A0003-0001-0001', '语文（上）', '', '/middleschooledu/middleschoollist/grade/1.1.1', '12', '1', '99', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-03 21:12:25', '2017-01-04 19:56:47');
INSERT INTO `strongculture_system_privilege` VALUES ('71', 'A0003-0001-0002', '数学（上）', '', '/middleschooledu/middleschoollist/grade/1.1.2', '12', '1', '98', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-03 21:27:59', '2017-01-03 22:32:06');
INSERT INTO `strongculture_system_privilege` VALUES ('72', 'A0003-0001-0003', '英语（上）', '', '/middleschooledu/middleschoollist/grade/1.1.3', '12', '1', '97', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 19:59:23', '2017-01-04 19:59:23');
INSERT INTO `strongculture_system_privilege` VALUES ('73', 'A0003-0001-0004', '物理（上）', '', '/middleschooledu/middleschoollist/grade/1.1.4', '12', '1', '96', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:00:12', '2017-01-04 20:00:12');
INSERT INTO `strongculture_system_privilege` VALUES ('74', 'A0003-0001-0005', '化学（上）', '', '/middleschooledu/middleschoollist/grade/1.1.5', '12', '1', '95', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:01:09', '2017-01-04 20:01:09');
INSERT INTO `strongculture_system_privilege` VALUES ('75', 'A0003-0001-0006', '生物（上）', '', '/middleschooledu/middleschoollist/grade/1.1.6', '12', '1', '94', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:01:54', '2017-01-04 20:01:54');
INSERT INTO `strongculture_system_privilege` VALUES ('76', 'A0003-0001-0007', '历史（上）', '', '/middleschooledu/middleschoollist/grade/1.1.7', '12', '1', '94', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:02:53', '2017-01-04 20:02:53');
INSERT INTO `strongculture_system_privilege` VALUES ('77', 'A0003-0001-0008', '政治（上）', '', '/middleschooledu/middleschoollist/grade/1.1.8', '12', '1', '93', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:03:43', '2017-01-04 20:03:43');
INSERT INTO `strongculture_system_privilege` VALUES ('78', 'A0003-0001-0009', '地理（上）', '', '/middleschooledu/middleschoollist/grade/1.1.9', '12', '1', '92', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:04:21', '2017-01-04 20:04:21');
INSERT INTO `strongculture_system_privilege` VALUES ('79', 'A0003-0002', '初一（下）', '', '', '3', '1', '5', '', '', '1', '', '1', '0', '1', '2017-01-04 20:08:46', '2017-01-04 20:08:46');
INSERT INTO `strongculture_system_privilege` VALUES ('80', 'A0003-0004', '初二（下）', '', '', '3', '1', '3', '', '', '1', '', '1', '0', '1', '2017-01-04 20:10:26', '2017-01-04 20:10:26');
INSERT INTO `strongculture_system_privilege` VALUES ('81', 'A0003-0006', '初三（下）', '', '', '3', '1', '1', '', '', '1', '', '1', '0', '1', '2017-01-04 20:10:48', '2017-01-04 20:10:48');
INSERT INTO `strongculture_system_privilege` VALUES ('82', 'A0003-0003-0001', '语文（下）', '', '/middleschooledu/middleschoollist/grade/1.2.1', '79', '1', '99', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:12:29', '2017-01-04 20:12:29');
INSERT INTO `strongculture_system_privilege` VALUES ('83', 'A0003-0003-0002', '数学（下）', '', '/middleschooledu/middleschoollist/grade/1.2.2', '79', '1', '8', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:13:50', '2017-01-04 20:13:50');
INSERT INTO `strongculture_system_privilege` VALUES ('84', 'A0003-0003-0003', '英语（下）', '', '/middleschooledu/middleschoollist/grade/1.2.3', '79', '1', '7', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:14:41', '2017-01-04 20:14:41');
INSERT INTO `strongculture_system_privilege` VALUES ('85', 'A0003-0003-0004', '物理（下）', '', '/middleschooledu/middleschoollist/grade/1.2.2', '79', '1', '7', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:15:43', '2017-01-04 20:15:43');
INSERT INTO `strongculture_system_privilege` VALUES ('86', 'A0003-0003-0005', '化学（上）', '', '/middleschooledu/middleschoollist/grade/1.2.5', '79', '1', '4', '', 'middleschoollist', '1', '', '1', '0', '1', '2017-01-04 20:17:26', '2017-01-04 20:17:26');

-- ----------------------------
-- Table structure for strongculture_system_role
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_role`;
CREATE TABLE `strongculture_system_role` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `roleno` varchar(20) NOT NULL COMMENT '角色编号',
  `rolename` varchar(50) NOT NULL COMMENT '角色名称',
  `roledesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统-角色信息表表';

-- ----------------------------
-- Records of strongculture_system_role
-- ----------------------------
INSERT INTO `strongculture_system_role` VALUES ('1', 'R0001', '超级管理员', '', '1', '0', '1', '0000-00-00 00:00:00', '2017-01-04 20:17:45');

-- ----------------------------
-- Table structure for strongculture_system_role-r-privilege
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_role-r-privilege`;
CREATE TABLE `strongculture_system_role-r-privilege` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `role_sysno` bigint(20) NOT NULL COMMENT '所属角色表主键',
  `privilege_sysno` bigint(20) NOT NULL COMMENT '所属权限表主键',
  PRIMARY KEY (`sysno`),
  KEY `role_sysno` (`role_sysno`),
  KEY `privilege_sysno` (`privilege_sysno`)
) ENGINE=InnoDB AUTO_INCREMENT=1308 DEFAULT CHARSET=utf8 COMMENT='系统-角色与权限多对多关系信息表';

-- ----------------------------
-- Records of strongculture_system_role-r-privilege
-- ----------------------------
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1223', '1', '69');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1224', '1', '34');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1225', '1', '16');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1226', '1', '10');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1227', '1', '1');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1228', '1', '68');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1229', '1', '67');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1230', '1', '66');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1231', '1', '65');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1232', '1', '30');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1233', '1', '64');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1234', '1', '63');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1235', '1', '62');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1236', '1', '61');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1237', '1', '29');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1238', '1', '60');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1239', '1', '59');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1240', '1', '58');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1241', '1', '57');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1242', '1', '28');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1243', '1', '56');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1244', '1', '55');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1245', '1', '54');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1246', '1', '53');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1247', '1', '27');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1248', '1', '52');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1249', '1', '51');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1250', '1', '50');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1251', '1', '49');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1252', '1', '17');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1253', '1', '48');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1254', '1', '47');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1255', '1', '33');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1256', '1', '32');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1257', '1', '11');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1258', '1', '2');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1259', '1', '81');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1260', '1', '80');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1261', '1', '86');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1262', '1', '85');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1263', '1', '84');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1264', '1', '83');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1265', '1', '82');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1266', '1', '79');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1267', '1', '21');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1268', '1', '20');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1269', '1', '78');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1270', '1', '77');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1271', '1', '76');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1272', '1', '75');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1273', '1', '74');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1274', '1', '73');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1275', '1', '72');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1276', '1', '71');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1277', '1', '70');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1278', '1', '12');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1279', '1', '3');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1280', '1', '23');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1281', '1', '22');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1282', '1', '46');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1283', '1', '13');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1284', '1', '4');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1285', '1', '41');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1286', '1', '40');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1287', '1', '39');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1288', '1', '38');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1289', '1', '26');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1290', '1', '25');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1291', '1', '24');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1292', '1', '14');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1293', '1', '5');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1294', '1', '37');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1295', '1', '36');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1296', '1', '35');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1297', '1', '44');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1298', '1', '43');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1299', '1', '19');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1300', '1', '45');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1301', '1', '18');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1302', '1', '42');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1303', '1', '15');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1304', '1', '6');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1305', '1', '9');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1306', '1', '8');
INSERT INTO `strongculture_system_role-r-privilege` VALUES ('1307', '1', '7');

-- ----------------------------
-- Table structure for strongculture_system_user
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_user`;
CREATE TABLE `strongculture_system_user` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(60) NOT NULL COMMENT '登录帐号',
  `userpwd` varchar(60) NOT NULL COMMENT '登录密码',
  `realname` varchar(20) NOT NULL COMMENT '用户姓名',
  `employee_sysno` bigint(20) NOT NULL COMMENT '所属员工信息表主键',
  `lastlogintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `lastloginip` varchar(255) DEFAULT NULL COMMENT '最后登录IP',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号：不需要的不用管这字段',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统-帐户信息表';

-- ----------------------------
-- Records of strongculture_system_user
-- ----------------------------
INSERT INTO `strongculture_system_user` VALUES ('1', 'lucky@qq.com', '$2y$10$IFKLgA8ySNc1e3lyhyTPK.4DXbTCNhxL5GlAnVntm5qfwHarWgi8G', '伍贤能', '1', '2017-04-20 14:44:49', '127.0.0.1', '1', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for strongculture_system_user-r-role
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_system_user-r-role`;
CREATE TABLE `strongculture_system_user-r-role` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_sysno` bigint(20) NOT NULL COMMENT '所属帐户信息表主键',
  `role_sysno` bigint(20) NOT NULL COMMENT '所属角色信息表主键',
  PRIMARY KEY (`sysno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统-帐户与角色多对多关系信息表';

-- ----------------------------
-- Records of strongculture_system_user-r-role
-- ----------------------------
INSERT INTO `strongculture_system_user-r-role` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for strongculture_universityedu
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_universityedu`;
CREATE TABLE `strongculture_universityedu` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `city_sysno` bigint(20) DEFAULT NULL,
  `universityname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `university_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of strongculture_universityedu
-- ----------------------------
INSERT INTO `strongculture_universityedu` VALUES ('1', '1', '清华大学', null, '1', '0', '2017-04-21 10:31:54', '2017-04-21 10:31:56');
INSERT INTO `strongculture_universityedu` VALUES ('2', '1', '北京大学', null, '1', '0', '2017-04-21 10:32:17', '2017-04-21 10:32:19');
INSERT INTO `strongculture_universityedu` VALUES ('3', '2', '复旦大学', null, '1', '0', '2017-04-21 10:32:51', '2017-04-21 10:32:55');
INSERT INTO `strongculture_universityedu` VALUES ('4', '2', '上海交通大学', null, '1', '0', '2017-04-21 10:33:15', '2017-04-21 10:33:18');
INSERT INTO `strongculture_universityedu` VALUES ('5', '3', '厦门大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('6', '5', '南京大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('7', '6', '天津大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('8', '7', '浙江大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('9', '8', '西安交通大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('10', '5', '东南大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('11', '9', '山东大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('12', '1', '中国人民大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('13', '10', '吉林大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('14', '11', '电子科技大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('15', '11', '四川大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('16', '12', '华南理工大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('17', '13', '兰州大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('18', '8', '西北工业大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('19', '2', '同济大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('20', '4', '中国科技大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('21', '14', '哈尔滨工业大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('22', '6', '南开大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('23', '15', '华中科技大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('24', '15', '武汉大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('25', '9', '中国海洋大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('26', '16', '湖南大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('27', '1', '北京理工大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('28', '17', '重庆大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('29', '18', '大连理工大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('30', '12', '中山大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('31', '1', '北京航空航空大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('32', '18', '东北大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('33', '1', '北京师范大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_universityedu` VALUES ('34', '16', '中南大学', null, '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for strongculture_university_city
-- ----------------------------
DROP TABLE IF EXISTS `strongculture_university_city`;
CREATE TABLE `strongculture_university_city` (
  `sysno` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cityname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1启用2停用',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除：1是0否',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`sysno`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of strongculture_university_city
-- ----------------------------
INSERT INTO `strongculture_university_city` VALUES ('1', '北京', '1', '0', '2017-04-21 10:30:31', '2017-04-21 10:30:34');
INSERT INTO `strongculture_university_city` VALUES ('2', '上海', '1', '0', '2017-04-21 10:30:52', '2017-04-21 10:30:55');
INSERT INTO `strongculture_university_city` VALUES ('3', '福建', '1', '0', '2017-04-21 11:36:53', '2017-04-21 11:36:56');
INSERT INTO `strongculture_university_city` VALUES ('4', '安徽', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('5', '江苏', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('6', '天津', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('7', '浙江', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('8', '陕西', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('9', '山东', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('10', '吉林', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('11', '四川', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('12', '广东', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('13', '甘肃', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('14', '黑龙江', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('15', '湖北', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('16', '湖南', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('17', '重庆', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `strongculture_university_city` VALUES ('18', '辽宁', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
