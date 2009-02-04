-- MySQL dump 10.13  Distrib 5.1.29-rc, for apple-darwin9.4.0 (i386)
--
-- Host: localhost    Database: bizdev
-- ------------------------------------------------------
-- Server version	5.1.29-rc

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(31,'Can add tag',11,'add_tag'),(32,'Can change tag',11,'change_tag'),(33,'Can delete tag',11,'delete_tag'),(34,'Can add tagged item',12,'add_taggeditem'),(35,'Can change tagged item',12,'change_taggeditem'),(36,'Can delete tagged item',12,'delete_taggeditem'),(75,'Can delete feature type',25,'delete_featuretype'),(72,'Can delete feature',24,'delete_feature'),(73,'Can add feature type',25,'add_featuretype'),(74,'Can change feature type',25,'change_featuretype'),(50,'Can change comment',17,'change_comment'),(49,'Can add comment',17,'add_comment'),(59,'Can change rating type',20,'change_ratingtype'),(58,'Can add rating type',20,'add_ratingtype'),(51,'Can delete comment',17,'delete_comment'),(52,'Can add rating',18,'add_rating'),(53,'Can change rating',18,'change_rating'),(54,'Can delete rating',18,'delete_rating'),(63,'Can delete karma',21,'delete_karma'),(62,'Can change karma',21,'change_karma'),(61,'Can add karma',21,'add_karma'),(60,'Can delete rating type',20,'delete_ratingtype'),(71,'Can change feature',24,'change_feature'),(70,'Can add feature',24,'add_feature'),(67,'Can add host',23,'add_host'),(68,'Can change host',23,'change_host'),(69,'Can delete host',23,'delete_host');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'Brad','','','bjasper@gmail.com','sha1$f98c5$66d7afb774b8a9b08bf7fa025ee5ee5cb13f7537',1,1,1,'2009-01-09 17:46:24','2008-12-13 19:15:44');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category`
--

DROP TABLE IF EXISTS `catalog_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `catalog_category_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_category`
--

LOCK TABLES `catalog_category` WRITE;
/*!40000 ALTER TABLE `catalog_category` DISABLE KEYS */;
INSERT INTO `catalog_category` VALUES (1,'Shared Hosting','shared-hosting','Web Hosting Reviews - List of Web Hosts',NULL,0);
/*!40000 ALTER TABLE `catalog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_comment`
--

DROP TABLE IF EXISTS `catalog_comment`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_comment_host_id` (`host_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2648 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_comment`
--

LOCK TABLES `catalog_comment` WRITE;
/*!40000 ALTER TABLE `catalog_comment` DISABLE KEYS */;
INSERT INTO `catalog_comment` VALUES (98,1,'test','2009-01-06 20:22:29','','','',-1,NULL),(143,1,'This is an awesome host. I seriously love them!','2009-01-06 20:42:49','Brad','bjasper@gmail.com','',-1,NULL),(142,1,'I love this hosting company. Seriously rocks!','2009-01-06 20:42:49','Brad','bjasper@gmail.com','',-1,NULL),(144,1,'They totally suck. Like really. Suckage!','2009-01-06 20:42:49','Mike','mike@mike.com','',-1,NULL),(145,1,'This is awesome!','2009-01-06 21:52:43','Brad','bjasper@gmail.com','',-1,NULL),(146,1,'sdfssdfsdf','2009-01-06 21:52:43','Boob','blbo@sdf.com','',-1,NULL),(303,1,'Hey hey hey!','2009-01-06 23:29:43','Jezeba','bjasper@gmail.com','',-1,'127.0.0.1'),(304,1,'This host is awesome!','2009-01-06 23:29:43','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(305,1,'Boom Yeah!','2009-01-06 23:29:43','Jezeba','jez@ba.com','',-1,'127.0.0.1'),(334,1,'I hate them and I\'m pissed!','2009-01-06 23:39:07','PissedOff','pissed@gmail.com','',-1,'127.0.0.1'),(359,140,'Boom Town','2009-01-07 00:10:40','Brad','bjasper@gmail.com','',-1,'127.0.0.1'),(360,140,'Hey Hey Hey!','2009-01-07 00:10:40','Martha','blowsers@blam.com','',-1,'127.0.0.1'),(361,140,'Hey Hey Hey!','2009-01-07 00:10:40','Martha','blowsers@blam.com','',-1,'127.0.0.1'),(2647,1,'This is a terrible host!','2009-01-09 20:59:33','Bradley','bjasper@gmail.com','http://google.com/',1,'127.0.0.1'),(2646,140,'This is an AWESOME review!','2009-01-09 20:59:33','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(2645,1,'This website is terrible!','2009-01-09 18:16:03','Jezeba','bradley@boom.com','',-1,'127.0.0.1');
/*!40000 ALTER TABLE `catalog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_feature`
--

DROP TABLE IF EXISTS `catalog_feature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_feature_host_id` (`host_id`),
  KEY `catalog_feature_name_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_feature`
--

LOCK TABLES `catalog_feature` WRITE;
/*!40000 ALTER TABLE `catalog_feature` DISABLE KEYS */;
INSERT INTO `catalog_feature` VALUES (1,1,1,'9.99'),(2,1,2,'100'),(3,1,3,'100'),(4,140,1,'5.99'),(5,140,2,'1024'),(6,140,3,'1024');
/*!40000 ALTER TABLE `catalog_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_featuretype`
--

DROP TABLE IF EXISTS `catalog_featuretype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_featuretype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `suffix` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_featuretype`
--

LOCK TABLES `catalog_featuretype` WRITE;
/*!40000 ALTER TABLE `catalog_featuretype` DISABLE KEYS */;
INSERT INTO `catalog_featuretype` VALUES (1,'Price','$',''),(2,'Bandwidth','','MB'),(3,'Space','','MB');
/*!40000 ALTER TABLE `catalog_featuretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_host`
--

DROP TABLE IF EXISTS `catalog_host`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `links_back` tinyint(1) NOT NULL,
  `link_back_required` tinyint(1) NOT NULL,
  `link_back_url` varchar(255) NOT NULL,
  `hits` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `featured` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `catalog_host_user_id` (`user_id`),
  KEY `catalog_host_category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_host`
--

LOCK TABLES `catalog_host` WRITE;
/*!40000 ALTER TABLE `catalog_host` DISABLE KEYS */;
INSERT INTO `catalog_host` VALUES (1,1,1,'BlueHost','bluehost','BlueHost has been providing hosting solutions to thousands of business and personal web sites since 1996. Our internet hosting package helps businesses and individuals get high-powered service at a fraction of the cost.','http://www.bluehost.com/',0,0,'',0,1,'hosts/Picture_1__.png',0),(140,1,1,'InMotion','inmotion','Our web hosting network is based on the fast and reliable Linux and Unix operating systems. It is monitored 24/7 for any unusual activity and benchmarked continuously for performance. This allows us to immediately respond to short term issues as well as grow our system optimally - keeping it broadband ready and economical at all times. Staying true to this technology and concept has allowed us to offer domain name registration and web hosting that consistently outperforms our competitors - in reliability, speed, and economy.','http://www.inmotion.com/',0,0,'',0,1,'hosts/Picture_7.png',0);
/*!40000 ALTER TABLE `catalog_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_karma`
--

DROP TABLE IF EXISTS `catalog_karma`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_karma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_id` (`comment_id`,`ip`),
  KEY `catalog_karma_comment_id` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_karma`
--

LOCK TABLES `catalog_karma` WRITE;
/*!40000 ALTER TABLE `catalog_karma` DISABLE KEYS */;
INSERT INTO `catalog_karma` VALUES (147,144,'127.0.0.1',1),(148,143,'127.0.0.1',1),(239,359,'127.0.0.1',1),(240,304,'127.0.0.1',1),(316,304,'12.217.117.143',1);
/*!40000 ALTER TABLE `catalog_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rating`
--

DROP TABLE IF EXISTS `catalog_rating`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `value` double unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rating_comment_id` (`comment_id`),
  KEY `catalog_rating_type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8081 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_rating`
--

LOCK TABLES `catalog_rating` WRITE;
/*!40000 ALTER TABLE `catalog_rating` DISABLE KEYS */;
INSERT INTO `catalog_rating` VALUES (1060,304,4,5),(1061,304,6,0),(1062,304,5,0),(1063,305,4,0),(1064,305,6,1),(1065,305,5,5),(1141,334,6,1),(1140,334,4,1),(1142,334,5,1),(1213,359,6,4),(1214,359,5,0),(1216,360,6,0),(1212,359,4,5),(1215,360,4,0),(1217,360,5,5),(1218,361,4,0),(1219,361,6,0),(1220,361,5,5),(8077,2646,5,5),(8076,2646,6,5),(8075,2646,4,5),(8074,2645,5,5),(8073,2645,6,5),(8072,2645,4,5),(8078,2647,4,1),(8079,2647,6,0),(8080,2647,5,0);
/*!40000 ALTER TABLE `catalog_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_ratingtype`
--

DROP TABLE IF EXISTS `catalog_ratingtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_ratingtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `limit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_ratingtype`
--

LOCK TABLES `catalog_ratingtype` WRITE;
/*!40000 ALTER TABLE `catalog_ratingtype` DISABLE KEYS */;
INSERT INTO `catalog_ratingtype` VALUES (4,'Features',5),(5,'Support',5),(6,'Uptime',5);
/*!40000 ALTER TABLE `catalog_ratingtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2008-12-13 19:48:41',1,9,'1','Computers',1,''),(2,'2008-12-13 19:48:57',1,9,'2','Internet',1,''),(113,'2009-01-03 02:26:51',1,20,'2','Support',1,''),(112,'2009-01-03 02:26:38',1,18,'1','Features (4/5)',1,''),(6,'2008-12-13 20:47:54',1,9,'1','Accounting',1,''),(7,'2008-12-13 20:54:11',1,9,'1','Accounting',1,''),(8,'2008-12-13 20:54:37',1,9,'1','Accounting',2,'No fields changed.'),(9,'2008-12-13 20:54:57',1,9,'2','Automotive',1,''),(10,'2008-12-13 20:55:00',1,9,'2','Automotive',2,'No fields changed.'),(11,'2008-12-13 20:55:07',1,9,'3','Business Travel',1,''),(12,'2008-12-13 20:55:13',1,9,'4','Economy',1,''),(13,'2008-12-13 20:55:19',1,9,'5','Education',1,''),(14,'2008-12-13 20:55:26',1,9,'6','Food',1,''),(15,'2008-12-13 20:56:35',1,9,'1','Accounting',1,''),(16,'2008-12-13 20:56:44',1,9,'2','Automotive',1,''),(17,'2008-12-13 20:56:51',1,9,'3','Business Travel',1,''),(18,'2008-12-13 20:56:56',1,9,'4','Economy',1,''),(19,'2008-12-13 20:57:02',1,9,'5','Education',1,''),(20,'2008-12-13 20:57:05',1,9,'6','Food',1,''),(21,'2008-12-13 20:57:10',1,9,'7','Games',1,''),(22,'2008-12-13 20:57:16',1,9,'8','Health Care',1,''),(23,'2008-12-13 20:57:27',1,9,'9','Human Resources',1,''),(24,'2008-12-13 20:57:41',1,9,'10','Technology',1,''),(120,'2009-01-04 16:20:00',1,23,'1','BlueHost',2,'Changed price and image.'),(119,'2009-01-04 16:17:04',1,23,'1','BlueHost',1,''),(27,'2008-12-15 01:29:44',1,9,'1','Business',1,''),(28,'2008-12-15 01:30:05',1,9,'2','Art',1,''),(29,'2008-12-15 01:30:19',1,9,'3','Music',1,''),(31,'2008-12-15 01:31:55',1,9,'5','Startups',1,''),(111,'2009-01-03 02:26:34',1,20,'1','Features',1,''),(110,'2009-01-03 02:26:23',1,17,'1','Idologic is the best. They are the most superb hos',1,''),(117,'2009-01-04 15:56:25',1,9,'1','Shared Hosting',2,'Changed slug.'),(36,'2008-12-15 01:52:46',1,9,'8','Law',1,''),(109,'2009-01-03 02:22:11',1,9,'1','Shared Hosting',1,''),(43,'2008-12-23 00:18:22',1,20,'2','RatingType object',1,''),(42,'2008-12-23 00:18:12',1,20,'1','RatingType object',1,''),(44,'2008-12-23 00:18:38',1,20,'3','RatingType object',1,''),(45,'2008-12-23 00:26:58',1,9,'5','Startups',3,''),(46,'2008-12-23 00:27:02',1,9,'3','Music',3,''),(47,'2008-12-23 00:27:05',1,9,'1','Business',3,''),(48,'2008-12-23 00:27:10',1,9,'2','Art',3,''),(49,'2008-12-23 00:28:38',1,9,'5','Startups',3,''),(50,'2008-12-23 00:28:41',1,9,'3','Music',3,''),(51,'2008-12-23 00:28:45',1,9,'2','Art',3,''),(52,'2008-12-23 00:29:02',1,9,'1','Root',2,'Changed name, slug and parent.'),(53,'2008-12-23 00:29:23',1,9,'8','Shared Hosting',1,''),(116,'2009-01-03 02:27:36',1,18,'3','Uptime (4/5)',1,''),(55,'2008-12-23 00:31:53',1,20,'1','Support',1,''),(56,'2008-12-23 00:32:00',1,18,'1','Support (5)',1,''),(57,'2008-12-23 00:33:42',1,17,'1','I really enjoy using this host!',1,''),(58,'2008-12-23 00:33:51',1,20,'2','Uptime',1,''),(59,'2008-12-23 00:34:06',1,18,'2','Uptime (4/5)',1,''),(60,'2008-12-23 00:34:13',1,20,'3','Features',1,''),(61,'2008-12-23 00:34:19',1,18,'3','Features (2/5)',1,''),(62,'2008-12-23 00:34:22',1,17,'1','I really enjoy using this host!',2,'Changed rating.'),(63,'2008-12-23 01:06:24',1,9,'5','Startups',3,''),(64,'2008-12-23 01:07:38',1,9,'3','Music',3,''),(65,'2008-12-23 01:07:41',1,9,'2','Art',3,''),(66,'2008-12-23 01:07:51',1,9,'1','root',2,'Changed name, slug and parent.'),(67,'2008-12-23 01:08:04',1,9,'8','Shared Hosting',1,''),(115,'2009-01-03 02:27:07',1,20,'3','Uptime',1,''),(69,'2008-12-23 01:09:17',1,20,'1','Support',1,''),(70,'2008-12-23 01:09:21',1,18,'1','Support (5/5)',1,''),(71,'2008-12-23 01:09:28',1,20,'2','Uptime',1,''),(72,'2008-12-23 01:09:30',1,18,'2','Uptime (5/5)',1,''),(73,'2008-12-23 01:09:38',1,20,'3','Features',1,''),(74,'2008-12-23 01:09:42',1,18,'3','Features (4/5)',1,''),(75,'2008-12-23 01:09:52',1,17,'1','I really like this host!',1,''),(76,'2008-12-23 01:33:14',1,9,'8','Shared Hosting',1,''),(78,'2008-12-23 01:36:27',1,20,'1','Features',1,''),(79,'2008-12-23 01:36:29',1,18,'1','Features (5/5)',1,''),(80,'2008-12-23 01:36:36',1,20,'2','Uptime',1,''),(81,'2008-12-23 01:36:37',1,18,'2','Uptime (5/5)',1,''),(82,'2008-12-23 01:36:46',1,20,'3','Support',1,''),(83,'2008-12-23 01:36:47',1,18,'3','Support (4/5)',1,''),(84,'2008-12-23 01:36:51',1,17,'1','I love them!',1,''),(85,'2008-12-23 01:45:34',1,20,'1','Features',1,''),(86,'2008-12-23 01:46:19',1,18,'3','Features (5/5)',1,''),(87,'2008-12-23 01:46:38',1,20,'2','Support',1,''),(88,'2008-12-23 01:46:40',1,18,'4','Support (5/5)',1,''),(89,'2008-12-23 01:46:46',1,20,'3','Uptime',1,''),(90,'2008-12-23 01:46:50',1,18,'5','Uptime (4/5)',1,''),(91,'2008-12-23 01:46:53',1,17,'1','I love them!',2,'Changed rating.'),(92,'2008-12-23 23:57:56',1,9,'8','Shared Hosting',1,''),(114,'2009-01-03 02:26:54',1,18,'2','Support (3/5)',1,''),(94,'2008-12-24 00:07:23',1,20,'1','Uptime',1,''),(95,'2008-12-24 00:07:25',1,18,'1','Uptime (5/5)',1,''),(96,'2008-12-24 00:07:38',1,20,'2','Support',1,''),(97,'2008-12-24 00:07:42',1,18,'2','Support (5/5)',1,''),(98,'2008-12-24 00:07:48',1,20,'3','Features',1,''),(99,'2008-12-24 00:07:50',1,18,'3','Features (5/5)',1,''),(100,'2008-12-24 00:08:12',1,17,'1','',1,''),(101,'2008-12-24 00:11:13',1,17,'1','I really like this host. They\'re awesome!',1,''),(102,'2008-12-24 00:11:21',1,20,'1','Uptime',1,''),(103,'2008-12-24 00:11:25',1,18,'1','Uptime (3/5)',1,''),(104,'2008-12-24 00:11:33',1,20,'2','Features',1,''),(105,'2008-12-24 00:11:37',1,18,'2','Features (4/5)',1,''),(106,'2008-12-24 00:11:46',1,20,'3','Support',1,''),(107,'2008-12-24 00:11:50',1,18,'3','Support (5/5)',1,''),(118,'2009-01-04 16:03:15',1,9,'1','Shared Hosting',1,''),(121,'2009-01-04 16:24:57',1,23,'1','BlueHost',2,'Changed image.'),(122,'2009-01-04 16:30:38',1,17,'1','BlueHost is the best host I\'ve seen in a long time',1,''),(123,'2009-01-04 17:01:45',1,20,'1','Features',1,''),(124,'2009-01-04 17:01:49',1,20,'2','Uptime',1,''),(125,'2009-01-04 17:01:56',1,20,'3','Support',1,''),(126,'2009-01-04 19:38:17',1,18,'283','Features (3/5)',1,''),(127,'2009-01-04 19:38:26',1,18,'284','Uptime (5/5)',1,''),(128,'2009-01-04 19:38:38',1,18,'285','Support (3/5)',1,''),(129,'2009-01-04 20:28:11',1,17,'1','BlueHost is awesome. I can\'t believe I\'ve never tr',1,''),(130,'2009-01-04 20:45:22',1,17,'2','BlueHost sucks. They are always down and they neve',1,''),(131,'2009-01-04 20:45:29',1,18,'286','Features (3/5)',1,''),(132,'2009-01-04 20:45:42',1,18,'287','Uptime (0/5)',1,''),(133,'2009-01-04 20:46:10',1,18,'288','Support (1/5)',1,''),(134,'2009-01-04 22:23:46',1,23,'1','BlueHost',2,'Changed image.'),(135,'2009-01-04 22:24:49',1,23,'1','BlueHost',2,'No fields changed.'),(136,'2009-01-04 22:25:17',1,23,'1','BlueHost',2,'Changed image.'),(137,'2009-01-04 22:26:12',1,23,'1','BlueHost',2,'Changed image.'),(138,'2009-01-05 00:10:19',1,17,'42','I\'ve had a neutral experience. I\'m really undecide',1,''),(139,'2009-01-05 00:11:06',1,17,'43','They\'re OK. Not terrible, but certainly not the be',1,''),(140,'2009-01-05 00:11:19',1,18,'404','Features (4/5)',1,''),(141,'2009-01-05 00:14:37',1,17,'43','They\'re OK. Not terrible, but certainly not the be',2,'Changed active.'),(142,'2009-01-05 01:07:51',1,21,'88','Karma object',1,''),(143,'2009-01-05 01:08:18',1,21,'89','Karma object',1,''),(144,'2009-01-05 01:36:47',1,21,'90','Karma object',1,''),(145,'2009-01-06 20:25:35',1,20,'4','Features',1,''),(146,'2009-01-06 20:25:43',1,20,'5','Support',1,''),(147,'2009-01-06 20:25:46',1,20,'6','Uptime',1,''),(148,'2009-01-06 21:27:09',1,17,'142','I love this hosting company. Seriously rocks!',2,'Changed active.'),(149,'2009-01-06 21:35:13',1,17,'144','They totally suck. Like really. Suckage!',2,'Changed active.'),(150,'2009-01-07 00:24:15',1,23,'140','DreamHost',1,''),(151,'2009-01-07 00:24:55',1,23,'140','InMotion',2,'Changed name, slug and url.'),(152,'2009-01-09 18:04:18',1,25,'1','Price (per month)',1,''),(153,'2009-01-09 18:05:42',1,25,'1','Price (per month)',1,''),(154,'2009-01-09 18:06:39',1,25,'2','Bandwidth (GB)',1,''),(155,'2009-01-09 18:06:54',1,25,'3','Space (MB)',1,''),(156,'2009-01-09 18:07:00',1,23,'1','BlueHost',2,'Added feature \"Price (per month) (9.99)\". Added feature \"Bandwidth (GB) (100)\". Added feature \"Space (MB) (100)\".'),(157,'2009-01-09 18:07:21',1,25,'2','Bandwidth (MB)',2,'Changed units and suffix.'),(158,'2009-01-09 20:59:43',1,23,'140','InMotion',2,'Added feature \"Price (5.99)\". Added feature \"Bandwidth (1024)\". Added feature \"Space (1024)\".');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'category','catalog','category'),(11,'tag','tagging','tag'),(12,'tagged item','tagging','taggeditem'),(25,'feature type','catalog','featuretype'),(17,'comment','catalog','comment'),(20,'rating type','catalog','ratingtype'),(18,'rating','catalog','rating'),(21,'karma','catalog','karma'),(24,'feature','catalog','feature'),(23,'host','catalog','host');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a8188eb31d18b3dc32260a2669862542','gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1MjliYjBkMDdlMDYwNWI3MGMzYTYwZjFl\nNDBmNTJm\n','2009-01-06 00:05:43'),('0d1d2804d2fa3262e51c3d0a33f2bf6b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-27 19:44:10'),('3179387b8d2426917dbcf8a8c29d40d5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-28 16:02:52'),('d16c81afc06aa3268896c7cd52d55599','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-28 22:05:20'),('3b2fd49105ec05d0019ef034da238a15','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-04 17:05:20'),('116d2a892c753c788595a3a17b2eb9fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-05 23:53:49'),('37393cde8a2139352b30d6c9ba9d1cde','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-06 23:57:16'),('384c22b42894d2175a1af2d893870110','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-17 02:20:19'),('42e01c9ab06500500fe49710bfe24b92','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-13 02:34:22'),('56e25dbe3485a3a421a1cf6de96c6921','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-20 20:25:16'),('e82a11f4c851babc0108b0cef615f09c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-20 21:33:22'),('aa063dcf7341751437b64644d0545c6f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 16:09:43'),('5c65d1f78c5454fd48f8a990cd21310d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 17:46:24');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-01-10  4:30:40
