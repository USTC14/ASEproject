/*
SQLyog Enterprise - MySQL GUI v7.14 
MySQL - 5.0.18-nt : Database - sds
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`sds` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sds`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

insert  into `auth_group`(`id`,`name`) values (2,'普通用户组');

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

insert  into `auth_group_permissions`(`id`,`group_id`,`permission_id`) values (1,2,13),(2,2,14);

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add questions',7,'add_questions'),(20,'Can change questions',7,'change_questions'),(21,'Can delete questions',7,'delete_questions'),(22,'Can add result',8,'add_result'),(23,'Can change result',8,'change_result'),(24,'Can delete result',8,'delete_result'),(25,'Can add log entry',9,'add_logentry'),(26,'Can change log entry',9,'change_logentry'),(27,'Can delete log entry',9,'delete_logentry');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$10000$x20sjp6TzqrP$cyJOtDR2e80Zykekx9vF/TFcWi53PxeWHdyXasGgcas=','2014-05-31 06:56:13',1,'admin','','','ertongzixingche@163.com',1,1,'2014-05-02 05:22:07'),(2,'pbkdf2_sha256$10000$bHgTa5lHL488$gQPge67fIL7UaeahaGN2hOEuTg5lc81QV2jzm2O3lb8=','2014-05-15 13:22:32',0,'sb','莎莎','罗','',0,1,'2014-05-15 13:22:32'),(3,'pbkdf2_sha256$10000$wVl52MCvofNg$eHXTpSD0BqwWmshSrZC1xxaCOxgwSzIsBixi6SQf4kg=','2014-05-28 05:29:04',0,'jerry','林','露露','',0,1,'2014-05-28 05:29:04'),(5,'pbkdf2_sha256$10000$zM7lK36t20D9$wmfKZRIea+028rrCHUz/1fJQ2c8B4YhIClslmeGikH0=','2014-05-31 02:30:35',0,'aaa','test','test','test@163.com',1,1,'2014-05-31 02:29:35');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

insert  into `auth_user_groups`(`id`,`user_id`,`group_id`) values (1,2,2);

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`user_id`,`content_type_id`,`object_id`,`object_repr`,`action_flag`,`change_message`) values (1,'2014-05-15 13:21:26',1,2,'1','普通用户',1,''),(2,'2014-05-15 13:21:58',1,2,'1','普通用户',3,''),(3,'2014-05-15 13:22:32',1,3,'2','sb',1,''),(4,'2014-05-15 13:23:35',1,3,'2','sb',2,'已修改 password，first_name 和 last_name 。'),(5,'2014-05-15 13:24:24',1,2,'2','普通用户组',1,''),(6,'2014-05-15 13:24:59',1,3,'2','sb',2,'已修改 password 和 groups 。'),(7,'2014-05-15 13:26:22',1,6,'2','http://127.0.0.1:8000/',1,''),(8,'2014-05-23 23:36:32',1,7,'1','Questions object',2,'已修改 content 。'),(9,'2014-05-23 23:37:45',1,7,'1','Questions object',2,'已修改 content 。'),(10,'2014-05-25 02:38:21',1,7,'60','Questions object',2,'已修改 content 。'),(11,'2014-05-25 11:30:29',1,7,'60','Questions object',2,'已修改 content 。'),(12,'2014-05-25 11:39:13',1,7,'60','Questions object',2,'已修改 content 。'),(13,'2014-05-25 11:45:37',1,7,'60','Questions object',2,'已修改 content 。'),(14,'2014-05-28 05:29:04',1,3,'3','jerry',1,''),(15,'2014-05-28 05:30:47',1,3,'3','jerry',2,'已修改 password，first_name 和 last_name 。'),(16,'2014-05-30 15:15:23',1,7,'1','Questions object',2,'已修改 content 。'),(17,'2014-05-30 15:15:49',1,7,'1','Questions object',2,'已修改 content 。'),(18,'2014-05-31 01:49:51',1,7,'60','Questions object',2,'已修改 content 。'),(19,'2014-05-31 02:16:59',1,3,'4','aaa',1,''),(20,'2014-05-31 02:29:10',1,3,'4','aaa',3,''),(21,'2014-05-31 02:29:36',1,3,'5','aaa',1,''),(22,'2014-05-31 02:30:16',1,3,'5','aaa',2,'已修改 password，first_name，last_name，email 和 is_staff 。'),(23,'2014-05-31 04:33:55',1,7,'60','Questions object',2,'已修改 content 。'),(24,'2014-05-31 06:56:27',1,7,'60','Questions object',2,'已修改 content 。');

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`name`,`app_label`,`model`) values (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'questions','self_directed_search','questions'),(8,'result','self_directed_search','result'),(9,'log entry','admin','logentry');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('0anfmkll3xxagj690ehg3tbeb54ve34s','MWFhZmVmMTEzMzc5NzZhNjgxNTM1YTM1ZWM5NGRiNWY2ZGNmNWQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-30 06:58:34'),('kotbkrmronm1x7kl1cwi6ntocbnln628','MWFhZmVmMTEzMzc5NzZhNjgxNTM1YTM1ZWM5NGRiNWY2ZGNmNWQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-29 13:18:30'),('pzb310a4td203jzk5q6vzkkdgm7bnaf5','MWFhZmVmMTEzMzc5NzZhNjgxNTM1YTM1ZWM5NGRiNWY2ZGNmNWQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-06-14 06:56:13');

/*Table structure for table `django_site` */

DROP TABLE IF EXISTS `django_site`;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_site` */

insert  into `django_site`(`id`,`domain`,`name`) values (1,'example.com','example.com'),(2,'http://127.0.0.1:8000/','霍兰德问卷调查前端首页');

/*Table structure for table `self_directed_search_questions` */

DROP TABLE IF EXISTS `self_directed_search_questions`;

CREATE TABLE `self_directed_search_questions` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(30) NOT NULL,
  `content` varchar(100) NOT NULL,
  `name` varchar(20) default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `self_directed_search_questions` */