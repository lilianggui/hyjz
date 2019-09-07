/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.11-log : Database - smgj_hyjz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smgj_hyjz` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `smgj_hyjz`;

/*Table structure for table `cust_capital_flow` */

DROP TABLE IF EXISTS `cust_capital_flow`;

CREATE TABLE `cust_capital_flow` (
  `capital_flow_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资金流水唯一编号',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '客户唯一编号',
  `flow_date` date DEFAULT NULL COMMENT '日期',
  `in_or_out` decimal(20,4) DEFAULT NULL COMMENT '流入/流出',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `entry_person` varchar(64) DEFAULT NULL COMMENT '录入人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`capital_flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='资金流水';

/*Data for the table `cust_capital_flow` */

insert  into `cust_capital_flow`(`capital_flow_id`,`cust_id`,`flow_date`,`in_or_out`,`remark`,`entry_person`,`create_time`,`update_time`) values 
(1,1,'2019-02-13',12.0000,'qw','21as',NULL,NULL),
(2,NULL,'2019-02-12',12.0000,'12','12','2019-02-08 14:27:28','2019-02-08 14:27:28'),
(5,2,'2019-02-07',12.0000,'1','1','2019-02-08 14:43:36','2019-02-08 14:43:36'),
(6,2,'2019-02-08',12.0000,'1','1','2019-02-08 14:44:10','2019-02-08 14:44:10'),
(7,2,'2019-02-22',34.0000,'3','34','2019-02-08 14:58:03','2019-02-08 14:58:03'),
(8,2,'2019-02-20',-9.5200,'7','7','2019-02-08 15:31:49','2019-02-08 15:31:49');

/*Table structure for table `cust_fee_info` */

DROP TABLE IF EXISTS `cust_fee_info`;

CREATE TABLE `cust_fee_info` (
  `fee_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '交费情况唯一编号',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '客户唯一编号',
  `fee_date` date DEFAULT NULL COMMENT '日期',
  `trade_amount` decimal(20,4) DEFAULT NULL COMMENT '交易金额',
  `close_market_value` decimal(20,4) DEFAULT NULL COMMENT '结算市值',
  `entry_person` varchar(64) DEFAULT NULL COMMENT '录入人',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='交费情况';

/*Data for the table `cust_fee_info` */

insert  into `cust_fee_info`(`fee_id`,`cust_id`,`fee_date`,`trade_amount`,`close_market_value`,`entry_person`,`remark`,`create_time`,`update_time`) values 
(1,1,'2019-02-07',12.0000,12.0000,'dasd','2132',NULL,NULL),
(2,1,'2019-02-14',1211.0000,1211.0000,'dasd','2132','2019-02-08 12:56:12','2019-02-08 12:56:12'),
(4,NULL,'2019-02-06',2.0000,2.0000,'12','请问','2019-02-08 13:01:30','2019-02-08 13:01:30'),
(5,NULL,'2019-01-29',1.0000,1.0000,'1','1','2019-02-08 13:18:34','2019-02-08 13:18:34'),
(6,NULL,'2019-02-06',1.0000,1.0000,'1','1','2019-02-08 13:18:47','2019-02-08 13:18:47'),
(7,NULL,'2019-01-30',1.0000,2.0000,'2','22','2019-02-08 13:18:54','2019-02-08 13:18:54'),
(8,NULL,'2019-02-06',2.0000,2.0000,'22','2','2019-02-08 13:19:07','2019-02-08 13:19:07'),
(9,NULL,'2019-02-15',1.0000,2.0000,'2','2','2019-02-08 13:19:18','2019-02-08 13:19:18'),
(10,NULL,'2019-02-14',2.0000,2.0000,'2','2','2019-02-08 13:19:25','2019-02-08 13:19:25'),
(11,NULL,'2019-02-19',2.0000,2.0000,'2','2','2019-02-08 13:19:37','2019-02-08 13:19:37'),
(12,NULL,'2019-02-06',2.0000,2.0000,'2','2','2019-02-08 13:19:46','2019-02-08 13:19:46'),
(13,NULL,'2019-02-05',12.0000,21.0000,'21','21','2019-02-08 13:24:13','2019-02-08 13:24:13'),
(14,NULL,'2019-02-14',32.0000,43.0000,'3','3','2019-02-08 13:26:58','2019-02-08 13:26:58');

/*Table structure for table `cust_info` */

DROP TABLE IF EXISTS `cust_info`;

CREATE TABLE `cust_info` (
  `cust_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户唯一编号',
  `cust_name` varchar(64) DEFAULT NULL COMMENT '客户名称',
  `cust_phone` varchar(16) DEFAULT NULL COMMENT '客户手机',
  `cust_area` varchar(128) DEFAULT NULL COMMENT '客户地区',
  `developer` varchar(64) DEFAULT NULL COMMENT '开发人',
  `trader` varchar(64) DEFAULT NULL COMMENT '交易员',
  `charge_person` varchar(64) DEFAULT NULL COMMENT '负责人',
  `init_market_value` decimal(20,4) DEFAULT NULL COMMENT '负责人',
  `principal` decimal(20,4) DEFAULT NULL COMMENT '本金',
  `entry_person` varchar(64) DEFAULT NULL COMMENT '录入人',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户信息表';

/*Data for the table `cust_info` */

insert  into `cust_info`(`cust_id`,`cust_name`,`cust_phone`,`cust_area`,`developer`,`trader`,`charge_person`,`init_market_value`,`principal`,`entry_person`,`start_date`,`end_date`,`remark`,`create_time`,`update_time`) values 
(1,'张三1','13558231131','深圳','lange','22','21',23.0000,34.0000,'lange','2019-01-27','2019-02-02','331',NULL,NULL),
(2,'额外','13558231131','21','23','1','34',43.0000,1.0000,NULL,'2019-02-01','2019-02-08','1243',NULL,NULL);

/*Table structure for table `cust_investor` */

DROP TABLE IF EXISTS `cust_investor`;

CREATE TABLE `cust_investor` (
  `investor_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '投资者唯一编号',
  `investor_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `invest_date` date DEFAULT NULL COMMENT '日期',
  `invest_amount` decimal(20,4) DEFAULT NULL COMMENT '投资额',
  `developer` varchar(64) DEFAULT NULL COMMENT '开发人',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`investor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='投资者表';

/*Data for the table `cust_investor` */

insert  into `cust_investor`(`investor_id`,`investor_name`,`invest_date`,`invest_amount`,`developer`,`remark`,`create_time`,`update_time`) values 
(1,'张三','2019-02-05',100.0000,'李四','山大啊1',NULL,NULL),
(2,'历史','2019-02-11',123.0000,'11','11',NULL,NULL),
(8,'你好啊','2019-01-28',21.0000,'21','21','2019-02-07 18:34:09','2019-02-07 18:34:09'),
(9,'你打算','2019-01-30',12.0000,'12','12','2019-02-07 18:37:58','2019-02-07 18:37:58'),
(10,'打算','2019-02-04',21.0000,'21','21','2019-02-07 19:26:36','2019-02-07 19:26:36'),
(11,'as','2019-02-05',21.0000,'21','22','2019-02-07 19:26:50','2019-02-07 19:26:50'),
(12,'你好啊','2019-02-05',22.0000,'2','2','2019-02-07 19:47:51','2019-02-07 19:47:51');

/*Table structure for table `cust_market_value` */

DROP TABLE IF EXISTS `cust_market_value`;

CREATE TABLE `cust_market_value` (
  `market_value_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '市值统计唯一编号',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '客户唯一编号',
  `market_value_date` date DEFAULT NULL COMMENT '日期',
  `market_value` decimal(20,4) DEFAULT NULL COMMENT '市值',
  `increase_reduce` decimal(20,4) DEFAULT NULL COMMENT '增减',
  `increase` decimal(20,4) DEFAULT NULL COMMENT '增幅',
  `entry_person` varchar(64) DEFAULT NULL COMMENT '录入人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`market_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='市值统计';

/*Data for the table `cust_market_value` */

insert  into `cust_market_value`(`market_value_id`,`cust_id`,`market_value_date`,`market_value`,`increase_reduce`,`increase`,`entry_person`,`create_time`,`update_time`) values 
(1,2,'2019-02-13',12.0000,12.0000,12.0000,'12',NULL,NULL),
(3,2,'2019-02-22',1.0000,NULL,NULL,'1','2019-02-08 19:17:40','2019-02-08 19:17:40'),
(4,2,'2019-02-14',12.0000,NULL,NULL,'23','2019-02-08 19:18:38','2019-02-08 19:18:38'),
(5,2,'2019-02-05',12.0000,NULL,NULL,'11','2019-02-08 19:39:51','2019-02-08 19:39:51');

/*Table structure for table `cust_return_visit` */

DROP TABLE IF EXISTS `cust_return_visit`;

CREATE TABLE `cust_return_visit` (
  `return_visit_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '持股情况唯一编号',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '客户唯一编号',
  `visit_date` date DEFAULT NULL COMMENT '回访记录日期',
  `content` varchar(1024) DEFAULT NULL COMMENT '回访记录内容',
  `entry_person` varchar(64) DEFAULT NULL COMMENT '录入人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`return_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='持股情况';

/*Data for the table `cust_return_visit` */

insert  into `cust_return_visit`(`return_visit_id`,`cust_id`,`visit_date`,`content`,`entry_person`,`create_time`,`update_time`) values 
(1,2,'2019-02-06','12','12',NULL,NULL),
(2,2,'2019-02-28','12','12','2019-02-09 01:34:45','2019-02-09 01:34:45');

/*Table structure for table `cust_share_holding` */

DROP TABLE IF EXISTS `cust_share_holding`;

CREATE TABLE `cust_share_holding` (
  `share_holding_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '持股情况唯一编号',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '客户唯一编号',
  `stock_code` varchar(64) DEFAULT NULL COMMENT '股票代码',
  `stock_name` varchar(64) DEFAULT NULL COMMENT '股票名称',
  `stock_count` int(11) DEFAULT NULL COMMENT '股票数量',
  `share_holding_cost` decimal(20,4) DEFAULT NULL COMMENT '持股成本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`share_holding_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='持股情况';

/*Data for the table `cust_share_holding` */

insert  into `cust_share_holding`(`share_holding_id`,`cust_id`,`stock_code`,`stock_name`,`stock_count`,`share_holding_cost`,`create_time`,`update_time`) values 
(1,2,'123','123',123,123.0000,NULL,NULL),
(3,2,'122222','23',2,2.0000,'2019-02-09 00:37:51','2019-02-09 00:37:51'),
(4,2,'133333','21',12,21.0000,'2019-02-09 00:48:46','2019-02-09 00:48:46');

/*Table structure for table `cust_trade_situation` */

DROP TABLE IF EXISTS `cust_trade_situation`;

CREATE TABLE `cust_trade_situation` (
  `trade_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '交易情况唯一编号',
  `cust_id` bigint(20) DEFAULT NULL COMMENT '客户唯一编号',
  `stock_code` varchar(64) DEFAULT NULL COMMENT '股票代码',
  `stock_name` varchar(64) DEFAULT NULL COMMENT '股票名称',
  `profit_and_loss` decimal(20,4) DEFAULT NULL COMMENT '盈亏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`trade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='交易情况';

/*Data for the table `cust_trade_situation` */

insert  into `cust_trade_situation`(`trade_id`,`cust_id`,`stock_code`,`stock_name`,`profit_and_loss`,`create_time`,`update_time`) values 
(1,2,'2','2',2.0000,NULL,NULL);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values 
('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai'),
('RenrenScheduler','TASK_2','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values 
('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X���0xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0有参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),
('RenrenScheduler','TASK_2','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X�w�`xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0无参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values 
('RenrenScheduler','STATE_ACCESS'),
('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values 
('RenrenScheduler','PC-2016040521531548000662741',1548000816768,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values 
('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1548001800000,-1,5,'WAITING','CRON',1547971045000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X���0xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0renrent\0有参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0'),
('RenrenScheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1547971200000,-1,5,'PAUSED','CRON',1547971047000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0X�w�`xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0无参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0x\0');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

/*Data for the table `schedule_job` */

insert  into `schedule_job`(`job_id`,`bean_name`,`method_name`,`params`,`cron_expression`,`status`,`remark`,`create_time`) values 
(1,'testTask','test','renren','0 0/30 * * * ?',0,'有参数测试','2016-12-01 23:16:46'),
(2,'testTask','test2',NULL,'0 0/30 * * * ?',1,'无参数测试','2016-12-03 14:55:56');

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

insert  into `schedule_job_log`(`log_id`,`job_id`,`bean_name`,`method_name`,`params`,`status`,`error`,`times`,`create_time`) values 
(1,1,'testTask','test','renren',0,NULL,1141,'2019-01-20 16:00:01'),
(2,1,'testTask','test','renren',0,NULL,1096,'2019-01-20 16:30:00'),
(3,1,'testTask','test','renren',0,NULL,1026,'2019-01-20 17:00:00'),
(4,1,'testTask','test','renren',0,NULL,1008,'2019-01-20 17:30:00'),
(5,1,'testTask','test','renren',0,NULL,1023,'2019-01-20 18:00:00'),
(6,1,'testTask','test','renren',0,NULL,1006,'2019-01-20 18:30:00'),
(7,1,'testTask','test','renren',0,NULL,1015,'2019-01-20 19:00:00'),
(8,1,'testTask','test','renren',0,NULL,1034,'2019-01-20 19:30:00'),
(9,1,'testTask','test','renren',0,NULL,1015,'2019-01-20 20:00:00'),
(10,1,'testTask','test','renren',0,NULL,1021,'2019-01-20 20:30:00'),
(11,1,'testTask','test','renren',0,NULL,1464,'2019-01-20 21:00:00'),
(12,1,'testTask','test','renren',0,NULL,1275,'2019-01-20 21:30:01'),
(13,1,'testTask','test','renren',0,NULL,1038,'2019-01-20 22:00:00'),
(14,1,'testTask','test','renren',0,NULL,1030,'2019-01-20 22:30:00'),
(15,1,'testTask','test','renren',0,NULL,1051,'2019-01-20 23:00:00'),
(16,1,'testTask','test','renren',0,NULL,1052,'2019-01-20 23:30:00'),
(17,1,'testTask','test','renren',0,NULL,1072,'2019-01-21 00:00:00'),
(18,1,'testTask','test','renren',0,NULL,1065,'2019-02-06 13:00:00'),
(19,1,'testTask','test','renren',0,NULL,1038,'2019-02-06 13:30:00'),
(20,1,'testTask','test','renren',0,NULL,1007,'2019-02-06 14:00:00'),
(21,1,'testTask','test','renren',0,NULL,1008,'2019-02-06 14:30:00'),
(22,1,'testTask','test','renren',0,NULL,1019,'2019-02-06 15:00:00'),
(23,1,'testTask','test','renren',0,NULL,1009,'2019-02-06 15:30:00'),
(24,1,'testTask','test','renren',0,NULL,1006,'2019-02-06 16:00:00'),
(25,1,'testTask','test','renren',0,NULL,1005,'2019-02-06 16:30:00'),
(26,1,'testTask','test','renren',0,NULL,1031,'2019-02-06 17:00:00'),
(27,1,'testTask','test','renren',0,NULL,1012,'2019-02-06 17:30:00'),
(28,1,'testTask','test','renren',0,NULL,1021,'2019-02-06 18:00:00'),
(29,1,'testTask','test','renren',0,NULL,1068,'2019-02-06 18:30:00'),
(30,1,'testTask','test','renren',0,NULL,1302,'2019-02-06 19:00:00'),
(31,1,'testTask','test','renren',0,NULL,1079,'2019-02-06 19:30:00'),
(32,1,'testTask','test','renren',0,NULL,1006,'2019-02-06 20:00:00'),
(33,1,'testTask','test','renren',0,NULL,1030,'2019-02-06 20:30:00'),
(34,1,'testTask','test','renren',0,NULL,1051,'2019-02-06 21:00:00'),
(35,1,'testTask','test','renren',0,NULL,1057,'2019-02-06 21:30:00'),
(36,1,'testTask','test','renren',0,NULL,1014,'2019-02-06 22:00:00'),
(37,1,'testTask','test','renren',0,NULL,1017,'2019-02-06 22:30:00'),
(38,1,'testTask','test','renren',0,NULL,1061,'2019-02-06 23:00:00'),
(39,1,'testTask','test','renren',0,NULL,1037,'2019-02-06 23:30:00'),
(40,1,'testTask','test','renren',0,NULL,1180,'2019-02-07 00:00:00'),
(41,1,'testTask','test','renren',0,NULL,1005,'2019-02-07 00:30:00'),
(42,1,'testTask','test','renren',0,NULL,1089,'2019-02-07 01:00:00'),
(43,1,'testTask','test','renren',0,NULL,1017,'2019-02-07 01:30:00'),
(44,1,'testTask','test','renren',0,NULL,1006,'2019-02-07 02:00:00'),
(45,1,'testTask','test','renren',0,NULL,1011,'2019-02-07 02:30:00'),
(46,1,'testTask','test','renren',0,NULL,1005,'2019-02-07 03:00:00'),
(47,1,'testTask','test','renren',0,NULL,1004,'2019-02-07 03:30:00'),
(48,1,'testTask','test','renren',0,NULL,1028,'2019-02-07 04:00:00'),
(49,1,'testTask','test','renren',0,NULL,1983,'2019-02-07 04:30:00'),
(50,1,'testTask','test','renren',0,NULL,1006,'2019-02-07 05:00:00'),
(51,1,'testTask','test','renren',0,NULL,1005,'2019-02-07 05:30:00'),
(52,1,'testTask','test','renren',0,NULL,1019,'2019-02-07 06:00:00'),
(53,1,'testTask','test','renren',0,NULL,1004,'2019-02-07 06:30:00'),
(54,1,'testTask','test','renren',0,NULL,1006,'2019-02-07 07:00:00'),
(55,1,'testTask','test','renren',0,NULL,1005,'2019-02-07 07:30:00'),
(56,1,'testTask','test','renren',0,NULL,1006,'2019-02-07 08:00:00'),
(57,1,'testTask','test','renren',0,NULL,1005,'2019-02-07 08:30:00'),
(58,1,'testTask','test','renren',0,NULL,1016,'2019-02-07 09:00:00'),
(59,1,'testTask','test','renren',0,NULL,1020,'2019-02-07 09:30:00'),
(60,1,'testTask','test','renren',0,NULL,1005,'2019-02-07 10:00:00'),
(61,1,'testTask','test','renren',0,NULL,1004,'2019-02-07 10:30:00'),
(62,1,'testTask','test','renren',0,NULL,1004,'2019-02-07 11:00:00'),
(63,1,'testTask','test','renren',0,NULL,1025,'2019-02-07 11:30:00'),
(64,1,'testTask','test','renren',0,NULL,1021,'2019-02-07 12:00:00'),
(65,1,'testTask','test','renren',0,NULL,1039,'2019-02-07 12:30:00'),
(66,1,'testTask','test','renren',0,NULL,1023,'2019-02-07 13:00:00'),
(67,1,'testTask','test','renren',0,NULL,1028,'2019-02-07 13:30:00'),
(68,1,'testTask','test','renren',0,NULL,1031,'2019-02-07 14:00:00'),
(69,1,'testTask','test','renren',0,NULL,1272,'2019-02-07 14:30:00'),
(70,1,'testTask','test','renren',0,NULL,1022,'2019-02-07 15:00:00'),
(71,1,'testTask','test','renren',0,NULL,1033,'2019-02-07 15:30:00'),
(72,1,'testTask','test','renren',0,NULL,1066,'2019-02-07 16:00:00'),
(73,1,'testTask','test','renren',0,NULL,1040,'2019-02-07 16:30:00'),
(74,1,'testTask','test','renren',0,NULL,1249,'2019-02-07 17:00:00'),
(75,1,'testTask','test','renren',0,NULL,1078,'2019-02-07 17:30:00'),
(76,1,'testTask','test','renren',0,NULL,1026,'2019-02-07 18:00:00'),
(77,1,'testTask','test','renren',0,NULL,1030,'2019-02-07 18:30:00'),
(78,1,'testTask','test','renren',0,NULL,1006,'2019-02-07 19:00:00'),
(79,1,'testTask','test','renren',0,NULL,1005,'2019-02-07 19:30:00'),
(80,1,'testTask','test','renren',0,NULL,1004,'2019-02-07 20:00:00'),
(81,1,'testTask','test','renren',0,NULL,1006,'2019-02-07 20:30:00'),
(82,1,'testTask','test','renren',0,NULL,1006,'2019-02-07 21:00:00'),
(83,1,'testTask','test','renren',0,NULL,1030,'2019-02-08 12:00:00'),
(84,1,'testTask','test','renren',0,NULL,1058,'2019-02-08 12:30:00'),
(85,1,'testTask','test','renren',0,NULL,1047,'2019-02-08 13:00:00'),
(86,1,'testTask','test','renren',0,NULL,1034,'2019-02-08 13:30:00'),
(87,1,'testTask','test','renren',0,NULL,1078,'2019-02-08 14:00:00'),
(88,1,'testTask','test','renren',0,NULL,1035,'2019-02-08 14:30:00'),
(89,1,'testTask','test','renren',0,NULL,1075,'2019-02-08 15:00:00'),
(90,1,'testTask','test','renren',0,NULL,1012,'2019-02-08 15:30:00'),
(91,1,'testTask','test','renren',0,NULL,1039,'2019-02-08 16:00:00'),
(92,1,'testTask','test','renren',0,NULL,1033,'2019-02-08 16:30:00'),
(93,1,'testTask','test','renren',0,NULL,1021,'2019-02-08 17:00:00'),
(94,1,'testTask','test','renren',0,NULL,1027,'2019-02-08 17:30:00'),
(95,1,'testTask','test','renren',0,NULL,1041,'2019-02-08 18:00:00'),
(96,1,'testTask','test','renren',0,NULL,1044,'2019-02-08 18:30:00'),
(97,1,'testTask','test','renren',0,NULL,1053,'2019-02-08 19:00:00'),
(98,1,'testTask','test','renren',0,NULL,1006,'2019-02-08 19:30:00'),
(99,1,'testTask','test','renren',0,NULL,1007,'2019-02-08 20:00:00'),
(100,1,'testTask','test','renren',0,NULL,1016,'2019-02-08 20:30:00'),
(101,1,'testTask','test','renren',0,NULL,1068,'2019-02-08 21:00:00'),
(102,1,'testTask','test','renren',0,NULL,1034,'2019-02-08 21:30:00'),
(103,1,'testTask','test','renren',0,NULL,1006,'2019-02-08 22:00:00'),
(104,1,'testTask','test','renren',0,NULL,1082,'2019-02-08 22:30:00'),
(105,1,'testTask','test','renren',0,NULL,1034,'2019-02-08 23:00:00'),
(106,1,'testTask','test','renren',0,NULL,1049,'2019-02-08 23:30:00'),
(107,1,'testTask','test','renren',0,NULL,1206,'2019-02-09 00:00:00'),
(108,1,'testTask','test','renren',0,NULL,1005,'2019-02-09 00:30:00'),
(109,1,'testTask','test','renren',0,NULL,1008,'2019-02-09 01:00:00'),
(110,1,'testTask','test','renren',0,NULL,1048,'2019-02-09 01:30:00'),
(111,1,'testTask','test','renren',0,NULL,1190,'2019-02-09 17:00:00'),
(112,1,'testTask','test','renren',0,NULL,1003,'2019-02-09 17:30:00'),
(113,1,'testTask','test','renren',0,NULL,1010,'2019-02-09 18:00:00'),
(114,1,'testTask','test','renren',0,NULL,1000,'2019-02-09 18:30:00'),
(115,1,'testTask','test','renren',0,NULL,1004,'2019-02-09 19:00:00'),
(116,1,'testTask','test','renren',0,NULL,1004,'2019-02-09 19:30:00'),
(117,1,'testTask','test','renren',0,NULL,1012,'2019-02-09 20:00:00'),
(118,1,'testTask','test','renren',0,NULL,1008,'2019-02-09 20:30:00'),
(119,1,'testTask','test','renren',0,NULL,1007,'2019-02-09 21:00:00'),
(120,1,'testTask','test','renren',0,NULL,1009,'2019-02-09 21:30:00'),
(121,1,'testTask','test','renren',0,NULL,1029,'2019-02-09 22:00:00'),
(122,1,'testTask','test','renren',0,NULL,1031,'2019-02-09 22:30:00'),
(123,1,'testTask','test','renren',0,NULL,1054,'2019-02-09 23:00:00'),
(124,1,'testTask','test','renren',0,NULL,1003,'2019-02-09 23:30:00'),
(125,1,'testTask','test','renren',0,NULL,1214,'2019-02-10 00:00:00'),
(126,1,'testTask','test','renren',0,NULL,1049,'2019-02-10 00:30:00'),
(127,1,'testTask','test','renren',0,NULL,1043,'2019-02-10 01:00:00'),
(128,1,'testTask','test','renren',0,NULL,1040,'2019-02-10 01:30:00'),
(129,1,'testTask','test','renren',0,NULL,1057,'2019-02-10 02:00:00'),
(130,1,'testTask','test','renren',0,NULL,1035,'2019-02-10 02:30:00'),
(131,1,'testTask','test','renren',0,NULL,1025,'2019-02-10 03:00:00'),
(132,1,'testTask','test','renren',0,NULL,1034,'2019-02-10 03:30:00'),
(133,1,'testTask','test','renren',0,NULL,1043,'2019-02-10 04:00:00'),
(134,1,'testTask','test','renren',0,NULL,1020,'2019-02-10 04:30:00'),
(135,1,'testTask','test','renren',0,NULL,1046,'2019-02-10 05:00:00'),
(136,1,'testTask','test','renren',0,NULL,1041,'2019-02-10 05:30:00'),
(137,1,'testTask','test','renren',0,NULL,1005,'2019-02-10 06:00:00'),
(138,1,'testTask','test','renren',0,NULL,1036,'2019-02-10 06:30:00'),
(139,1,'testTask','test','renren',0,NULL,1022,'2019-02-10 07:00:00'),
(140,1,'testTask','test','renren',0,NULL,1044,'2019-02-10 07:30:00'),
(141,1,'testTask','test','renren',0,NULL,1017,'2019-02-10 08:00:00'),
(142,1,'testTask','test','renren',0,NULL,1044,'2019-02-10 08:30:00'),
(143,1,'testTask','test','renren',0,NULL,1057,'2019-02-10 09:00:00'),
(144,1,'testTask','test','renren',0,NULL,1023,'2019-02-10 09:30:00'),
(145,1,'testTask','test','renren',0,NULL,1049,'2019-02-10 10:00:00'),
(146,1,'testTask','test','renren',0,NULL,1051,'2019-02-10 10:30:00'),
(147,1,'testTask','test','renren',0,NULL,1059,'2019-02-10 11:00:00'),
(148,1,'testTask','test','renren',0,NULL,1032,'2019-02-10 11:30:00'),
(149,1,'testTask','test','renren',0,NULL,1045,'2019-02-10 12:00:00');

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

/*Data for the table `sys_captcha` */

insert  into `sys_captcha`(`uuid`,`code`,`expire_time`) values 
('b746d22b-da37-4da7-8760-2157ab52a3dd','4nyay','2019-01-20 16:13:30'),
('d6fff53e-20ee-4b77-8574-af4d4282b41b','8wnaa','2019-01-20 16:31:05'),
('d82a5909-4ffa-41d1-8f37-e0f5b8709ac3','2fxn2','2019-01-20 16:13:35');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values 
(1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values 
(1,0,'系统管理',NULL,NULL,0,'system',10),
(2,1,'管理员列表','sys/user',NULL,1,'admin',1),
(3,1,'角色管理','sys/role',NULL,1,'role',2),
(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),
(5,1,'SQL监控','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),
(6,1,'定时任务','job/schedule',NULL,1,'job',5),
(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),
(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),
(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),
(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),
(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),
(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),
(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),
(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),
(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),
(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),
(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),
(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),
(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),
(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),
(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),
(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),
(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),
(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),
(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),
(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),
(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),
(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),
(30,1,'文件上传','oss/oss','sys:oss:all',1,'oss',6),
(31,0,'客户列表',NULL,NULL,0,'system',1),
(32,0,'首页','customer/home',NULL,1,'system',0),
(33,0,'基金客户','sys/config',NULL,1,'system',2),
(34,0,'理财客户',NULL,NULL,0,'system',3),
(35,0,'过期客户',NULL,NULL,0,'system',4),
(36,0,'资产列表',NULL,NULL,0,'system',5),
(37,0,'持股列表',NULL,NULL,0,'system',6);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`) values 
(1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values 
(1,'eb1b1879b1beab65654d8a6b67a75182','2019-02-10 05:04:32','2019-02-09 17:04:32');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`) values 
(1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
