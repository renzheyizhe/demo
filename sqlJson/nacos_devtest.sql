/*
 Navicat Premium Data Transfer

 Source Server         : 5.7
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3307
 Source Schema         : nacos_devtest

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 24/06/2020 17:38:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (2, 'nacosa.properties', 'DEFAULT_GROUP', 'server.port=9100\r\nspring.cloud.nacos.discovery.server-addr=localhost:8848\r\nlogging.level.com.alibaba.nacos.client.naming=info\r\ncurrent.env=this is uat\r\n\r\n\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=9111\r\nspring.cloud.sentinel.transport.client-ip=localhost', '8bbd5e396a0236f27a5e89b312c8d2d9', '2020-05-12 17:18:40', '2020-06-23 10:15:54', NULL, '0:0:0:0:0:0:0:1', '', '4e7b1917-ca58-41e4-8d2a-d8539274883b', 'null', 'null', 'null', 'properties', 'null');
INSERT INTO `config_info` VALUES (4, 'nacosa.properties', 'DEFAULT_GROUP', 'server.port=9100\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nlogging.level.com.alibaba.nacos.client.naming=info\r\ncurrent.env=hello dat', '26bf543aa60771654fdec964543cc8cb', '2020-05-12 17:21:43', '2020-05-12 17:21:43', NULL, 'localhost', '', '96509aea-8458-4c41-86c2-1506a3d43a45', NULL, NULL, NULL, 'properties', NULL);
INSERT INTO `config_info` VALUES (5, 'gateway.properties', 'DEFAULT_GROUP', 'spring.application.name=gateway\r\nserver.port=9000\r\n\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=9010\r\nspring.cloud.sentinel.transport.client-ip=localhost\r\n\r\n#nacos server\r\nspring.cloud.nacos.discovery.server-addr=localhost:8848\r\n#logging.level.com.alibaba.nacos.client.naming=info\r\n#gateway\r\nspring.cloud.gateway.discovery.locator.enabled=true\r\nspring.cloud.gateway.discovery.locator.lowerCaseServiceId=true\r\nlogging.level.org.springframework.cloud.gateway=trace\r\nlogging.level.org.springframework.http.server.reactive=debug\r\nlogging.level.org.springframework.web.reactive=debug\r\nlogging.level.reactor.ipc.netty=debug\r\nmanagement.endpoints.web.exposure.include=*\r\n#route json\r\nnacos.dataId=routes.json\r\nnacos.group=DEFAULT_GROUP', 'bcaaf3cffdffefa5ea09b4ea245998bd', '2020-05-13 14:00:23', '2020-06-23 10:16:23', NULL, '0:0:0:0:0:0:0:1', '', '4e7b1917-ca58-41e4-8d2a-d8539274883b', 'null', 'null', 'null', 'properties', 'null');
INSERT INTO `config_info` VALUES (6, 'routes.json', 'DEFAULT_GROUP', '[\r\n    {\r\n        \"id\":\"nacosa\",\r\n        \"predicates\":[\r\n            {\r\n                \"name\":\"Path\",\r\n                \"args\":{\r\n                    \"pattern\":\"/nacosa/**\"\r\n                }\r\n            }\r\n        ],\r\n        \"filters\":[\r\n            {\r\n                \"name\":\"RewritePath\",\r\n                \"args\":{\r\n                    \"regexp\":\"/nacosa/(?<remaining>.*)\",\r\n                    \"replacement\":\"/${remaining}\"\r\n                }\r\n            }\r\n        ],\r\n        \"uri\":\"lb://nacosa\",\r\n        \"order\":0\r\n    }\r\n]', '635eca7f79b39821371302a77a691e50', '2020-05-13 14:49:43', '2020-05-13 15:02:59', NULL, 'localhost', '', '4e7b1917-ca58-41e4-8d2a-d8539274883b', 'null', 'null', 'null', 'json', 'null');
INSERT INTO `config_info` VALUES (7, 'sentinel-demo.properties', 'DEFAULT_GROUP', 'server.port=12000\r\nspring.application.name=sentinel-demo\r\n\r\n# sentinel dashboard\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=12001\r\n\r\n# nacos server\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848', 'd8bf0aa70a5905c575b30b615d8a6b9f', '2020-06-15 15:28:07', '2020-06-17 09:25:46', NULL, '0:0:0:0:0:0:0:1', '', '4e7b1917-ca58-41e4-8d2a-d8539274883b', 'null', 'null', 'null', 'properties', 'null');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 15, 'sentinel-demo.properties', 'DEFAULT_GROUP', '', 'server.port=12000\r\nspring.application.name=sentinel-demo\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=12001', '4e3d99abb8b524117ce7319ac45e96d4', '2020-06-15 15:28:06', '2020-06-15 15:28:07', NULL, '0:0:0:0:0:0:0:1', 'I', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (7, 16, 'sentinel-demo.properties', 'DEFAULT_GROUP', '', 'server.port=12000\r\nspring.application.name=sentinel-demo\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=12001', '4e3d99abb8b524117ce7319ac45e96d4', '2020-06-15 16:12:02', '2020-06-15 16:12:02', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (7, 17, 'sentinel-demo.properties', 'DEFAULT_GROUP', '', 'server.port=12000\r\nspring.application.name=sentinel-demo\r\n\r\n# sentinel dashboard\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=12001\r\n\r\n# nacos server\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848', 'd8bf0aa70a5905c575b30b615d8a6b9f', '2020-06-15 16:34:07', '2020-06-15 16:34:08', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (7, 18, 'sentinel-demo.properties', 'DEFAULT_GROUP', '', '#server.port=12000\r\n#spring.application.name=sentinel-demo\r\n\r\n# sentinel dashboard\r\n#spring.cloud.sentinel.transport.dashboard=localhost:8999\r\n#spring.cloud.sentinel.transport.port=12001\r\n\r\n# nacos server\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848', '3746d11bacba877b56f52e390432533b', '2020-06-17 09:25:46', '2020-06-17 09:25:46', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (5, 19, 'gateway.properties', 'DEFAULT_GROUP', '', 'spring.application.name=gateway\r\nserver.port=9000\r\n#nacos server\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\n#logging.level.com.alibaba.nacos.client.naming=info\r\n#gateway\r\nspring.cloud.gateway.discovery.locator.enabled=true\r\nspring.cloud.gateway.discovery.locator.lowerCaseServiceId=true\r\nlogging.level.org.springframework.cloud.gateway=trace\r\nlogging.level.org.springframework.http.server.reactive=debug\r\nlogging.level.org.springframework.web.reactive=debug\r\nlogging.level.reactor.ipc.netty=debug\r\nmanagement.endpoints.web.exposure.include=*\r\n#route json\r\nnacos.dataId=routes.json\r\nnacos.group=DEFAULT_GROUP', 'a50b01b1795ea9443ba8cb1ac44c7696', '2020-06-19 17:06:40', '2020-06-19 17:06:41', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (2, 20, 'nacosa.properties', 'DEFAULT_GROUP', '', 'server.port=9100\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nlogging.level.com.alibaba.nacos.client.naming=info\r\ncurrent.env=this is uat', 'f4f4639ad2490b1690a9c4fc7df42c74', '2020-06-19 17:10:27', '2020-06-19 17:10:27', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (2, 21, 'nacosa.properties', 'DEFAULT_GROUP', '', 'server.port=9100\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nlogging.level.com.alibaba.nacos.client.naming=info\r\ncurrent.env=this is uat\r\n\r\n\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=9111', '7ea334d6744f0b7116495598147a57c5', '2020-06-23 09:41:33', '2020-06-23 09:41:33', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (5, 22, 'gateway.properties', 'DEFAULT_GROUP', '', 'spring.application.name=gateway\r\nserver.port=9000\r\n\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=9010\r\n\r\n#nacos server\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\n#logging.level.com.alibaba.nacos.client.naming=info\r\n#gateway\r\nspring.cloud.gateway.discovery.locator.enabled=true\r\nspring.cloud.gateway.discovery.locator.lowerCaseServiceId=true\r\nlogging.level.org.springframework.cloud.gateway=trace\r\nlogging.level.org.springframework.http.server.reactive=debug\r\nlogging.level.org.springframework.web.reactive=debug\r\nlogging.level.reactor.ipc.netty=debug\r\nmanagement.endpoints.web.exposure.include=*\r\n#route json\r\nnacos.dataId=routes.json\r\nnacos.group=DEFAULT_GROUP', 'a7091941f2fa1b4cfc5208f5475c15d8', '2020-06-23 10:15:36', '2020-06-23 10:15:37', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (2, 23, 'nacosa.properties', 'DEFAULT_GROUP', '', 'server.port=9100\r\nspring.cloud.nacos.discovery.server-addr=127.0.0.1:8848\r\nlogging.level.com.alibaba.nacos.client.naming=info\r\ncurrent.env=this is uat\r\n\r\n\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=9111\r\nspring.cloud.sentinel.transport.client-ip=localhost', 'e188b2809ea772e960dba7ff0e906b52', '2020-06-23 10:15:54', '2020-06-23 10:15:54', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');
INSERT INTO `his_config_info` VALUES (5, 24, 'gateway.properties', 'DEFAULT_GROUP', '', 'spring.application.name=gateway\r\nserver.port=9000\r\n\r\nspring.cloud.sentinel.transport.dashboard=localhost:8999\r\nspring.cloud.sentinel.transport.port=9010\r\n\r\n#nacos server\r\nspring.cloud.nacos.discovery.server-addr=localhost:8848\r\n#logging.level.com.alibaba.nacos.client.naming=info\r\n#gateway\r\nspring.cloud.gateway.discovery.locator.enabled=true\r\nspring.cloud.gateway.discovery.locator.lowerCaseServiceId=true\r\nlogging.level.org.springframework.cloud.gateway=trace\r\nlogging.level.org.springframework.http.server.reactive=debug\r\nlogging.level.org.springframework.web.reactive=debug\r\nlogging.level.reactor.ipc.netty=debug\r\nmanagement.endpoints.web.exposure.include=*\r\n#route json\r\nnacos.dataId=routes.json\r\nnacos.group=DEFAULT_GROUP', '684577d4fc3968d96869ebd26902d82d', '2020-06-23 10:16:22', '2020-06-23 10:16:23', NULL, '0:0:0:0:0:0:0:1', 'U', '4e7b1917-ca58-41e4-8d2a-d8539274883b');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('ROLE_ADMIN', '4e7b1917-ca58-41e4-8d2a-d8539274883b:*:*', 'rw');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '96509aea-8458-4c41-86c2-1506a3d43a45', 'dat', 'dat', 'nacos', 1589270648946, 1589270648946);
INSERT INTO `tenant_info` VALUES (2, '1', '4e7b1917-ca58-41e4-8d2a-d8539274883b', 'uat', 'uat', 'nacos', 1589270955321, 1589270955321);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
