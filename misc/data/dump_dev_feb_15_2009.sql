-- MySQL dump 10.13  Distrib 5.1.29-rc, for apple-darwin9.4.0 (i386)
--
-- Host: localhost    Database: hostingchoice
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
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(31,'Can add tag',11,'add_tag'),(32,'Can change tag',11,'change_tag'),(33,'Can delete tag',11,'delete_tag'),(34,'Can add tagged item',12,'add_taggeditem'),(35,'Can change tagged item',12,'change_taggeditem'),(36,'Can delete tagged item',12,'delete_taggeditem'),(75,'Can delete feature type',25,'delete_featuretype'),(72,'Can delete feature',24,'delete_feature'),(73,'Can add feature type',25,'add_featuretype'),(74,'Can change feature type',25,'change_featuretype'),(50,'Can change comment',17,'change_comment'),(49,'Can add comment',17,'add_comment'),(59,'Can change rating type',20,'change_ratingtype'),(58,'Can add rating type',20,'add_ratingtype'),(51,'Can delete comment',17,'delete_comment'),(52,'Can add rating',18,'add_rating'),(53,'Can change rating',18,'change_rating'),(54,'Can delete rating',18,'delete_rating'),(63,'Can delete karma',21,'delete_karma'),(62,'Can change karma',21,'change_karma'),(61,'Can add karma',21,'add_karma'),(60,'Can delete rating type',20,'delete_ratingtype'),(71,'Can change feature',24,'change_feature'),(70,'Can add feature',24,'add_feature'),(67,'Can add host',23,'add_host'),(68,'Can change host',23,'change_host'),(69,'Can delete host',23,'delete_host'),(76,'Can add page',26,'add_page'),(77,'Can change page',26,'change_page'),(78,'Can delete page',26,'delete_page'),(79,'Can add email',27,'add_email'),(80,'Can change email',27,'change_email'),(81,'Can delete email',27,'delete_email'),(82,'Can add entry',28,'add_entry'),(83,'Can change entry',28,'change_entry'),(84,'Can delete entry',28,'delete_entry'),(85,'Can add rank time',29,'add_ranktime'),(86,'Can change rank time',29,'change_ranktime'),(87,'Can delete rank time',29,'delete_ranktime'),(88,'Can add quote',30,'add_quote'),(89,'Can change quote',30,'change_quote'),(90,'Can delete quote',30,'delete_quote'),(91,'Can add hit',31,'add_hit'),(92,'Can change hit',31,'change_hit'),(93,'Can delete hit',31,'delete_hit'),(94,'Can add faq',32,'add_faq'),(95,'Can change faq',32,'change_faq'),(96,'Can delete faq',32,'delete_faq'),(97,'Can add feature group',33,'add_featuregroup'),(98,'Can change feature group',33,'change_featuregroup'),(99,'Can delete feature group',33,'delete_featuregroup'),(108,'Can delete summary',36,'delete_summary'),(107,'Can change summary',36,'change_summary'),(106,'Can add summary',36,'add_summary');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'Brad','','','bjasper@gmail.com','sha1$f98c5$66d7afb774b8a9b08bf7fa025ee5ee5cb13f7537',1,1,1,'2009-02-15 21:46:49','2008-12-13 19:15:44');
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
INSERT INTO `catalog_category` VALUES (1,'Shared Hosting','shared-hosting','Shared Hosting providers are perfect for small sites that don\'t require a lot of space of bandwidth.',NULL,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=2669 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_comment`
--

LOCK TABLES `catalog_comment` WRITE;
/*!40000 ALTER TABLE `catalog_comment` DISABLE KEYS */;
INSERT INTO `catalog_comment` VALUES (144,1,'They totally suck. Like really. Suckage!','2009-01-06 20:42:49','Mike','mike@mike.com','',-1,NULL),(145,1,'This is awesome!','2009-01-06 21:52:43','Brad','bjasper@gmail.com','',-1,NULL),(146,1,'sdfssdfsdf','2009-01-06 21:52:43','Boob','blbo@sdf.com','',-1,NULL),(303,1,'Hey hey hey!','2009-01-06 23:29:43','Jezeba','bjasper@gmail.com','',-1,'127.0.0.1'),(304,1,'This host is awesome!','2009-01-06 23:29:43','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(305,1,'Boom Yeah!','2009-01-06 23:29:43','Jezeba','jez@ba.com','',1,'127.0.0.1'),(334,1,'I hate them and I\'m pissed!','2009-01-06 23:39:07','PissedOff','pissed@gmail.com','',1,'127.0.0.1'),(2654,1,'Test','2009-01-11 14:17:24','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(2653,1,'This host sucks!','2009-01-11 14:17:03','Santa','santa@northpole.com','',1,'127.0.0.1'),(2647,1,'This is a terrible host!','2009-01-09 20:59:33','Bradley','bjasper@gmail.com','http://google.com/',1,'127.0.0.1'),(2652,1,'Good Site, Easy to Use','2009-01-11 14:16:35','EJ','JasperEdwardJ@JohnDeere.com','',1,'127.0.0.1'),(2645,1,'This website is terrible!','2009-01-09 18:16:03','Jezeba','bradley@boom.com','',1,'127.0.0.1'),(2651,1,'Great host!','2009-01-11 14:16:35','Laura','lolajasper@gmail.com','',1,'127.0.0.1'),(2649,1,'i have never been so turned on by one basic looking website. change the pea green and i will buy it for one million dollars','2009-01-09 22:37:14','bradley','bjasper@gmail.com','',1,'127.0.0.1'),(2650,1,'Boom Boom Boom','2009-01-11 02:19:02','Daisy Duke','bjasper@gmail.com','',1,'127.0.0.1'),(2656,1,'This website is the best website I\'ve ever used. This website is the best website I\'ve ever used. This website is the best website I\'ve ever used. This website is the best website I\'ve ever used. This website is the best website I\'ve ever used. This website is the best website I\'ve ever used. \r\n\r\n\r\nThis website is the best website I\'ve ever used. This website is the best website I\'ve ever used. This website is the best website I\'ve ever used. This website is the best website I\'ve ever used. \r\n','2009-01-15 00:59:35','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(2657,195,'This is an awesome host!\r\n\r\nI really like them!','2009-01-17 17:24:57','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(2658,195,'This is another really awesome host.\r\n\r\nI love em!','2009-01-17 17:24:57','Marky','mark@mark.com','',1,'127.0.0.1'),(2668,193,'This host is awesome!','2009-02-08 20:33:55','Brad','skladf@sdfsdf.com','',1,'127.0.0.1'),(2667,193,'This host is awesome!','2009-02-08 20:33:55','Brad','skladf@sdfsdf.com','',1,'127.0.0.1'),(2663,193,'Blergh I don\'t like them!','2009-01-17 18:01:33','Blergh','sf@sf.com','',1,'127.0.0.1'),(2664,193,'Blergh I don\'t like them!','2009-01-17 18:01:33','Blergh','sf@sf.com','',1,'127.0.0.1'),(2666,1,'This is the awesomest thing ever!','2009-02-04 21:50:57','Brad','bjasper@gmail.com','',1,'127.0.0.1');
/*!40000 ALTER TABLE `catalog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_coupon`
--

DROP TABLE IF EXISTS `catalog_coupon`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_coupon_host_id` (`host_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_coupon`
--

LOCK TABLES `catalog_coupon` WRITE;
/*!40000 ALTER TABLE `catalog_coupon` DISABLE KEYS */;
INSERT INTO `catalog_coupon` VALUES (1,198,'FCKJ','20% of all orders over $50',1);
/*!40000 ALTER TABLE `catalog_coupon` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_feature`
--

LOCK TABLES `catalog_feature` WRITE;
/*!40000 ALTER TABLE `catalog_feature` DISABLE KEYS */;
INSERT INTO `catalog_feature` VALUES (1,1,1,'7.95'),(2,1,2,'-1'),(3,1,3,'-1'),(19,195,3,'-1'),(18,195,2,'-1'),(17,195,1,'4.95'),(55,1,5,'0'),(54,195,4,'1'),(53,195,5,'1'),(11,193,1,'6.99'),(12,193,2,'-1'),(13,193,3,'-1'),(14,194,1,'5.95'),(15,194,2,'-1'),(16,194,3,'-1'),(20,196,1,'6.95'),(21,196,2,'-1'),(22,196,3,'-1'),(23,197,1,'8.96'),(24,197,2,'-1'),(25,197,3,'-1'),(26,198,1,'4.74'),(27,198,2,'300000'),(28,198,3,'10000'),(29,199,1,'4.95'),(30,199,2,'15000000'),(31,199,3,'1500000'),(32,200,1,'6.95'),(33,200,2,'-1'),(34,200,3,'-1'),(35,201,1,'3.88'),(36,201,2,'15000000'),(37,201,3,'1500000'),(38,202,1,'6.95'),(39,202,2,'15000000'),(40,202,3,'1500000'),(41,203,1,'4.95'),(42,203,2,'60000000'),(43,203,3,'600000000'),(44,204,1,'5.95'),(45,204,2,'-1'),(46,204,3,'-1'),(47,205,1,'6.50'),(48,205,2,'15000000'),(49,205,3,'1500000'),(50,206,1,'4.95'),(51,206,2,'-1'),(52,206,3,'-1'),(56,1,4,'1'),(57,1,7,'1'),(58,1,8,'1'),(59,1,9,'0'),(60,1,10,'0'),(61,1,11,'0'),(62,1,12,'1'),(63,1,42,'0'),(64,1,16,'0'),(65,1,17,'1'),(66,1,18,'1'),(67,1,19,'1'),(68,1,20,'1'),(69,1,21,'1'),(70,1,22,'1'),(71,1,23,'1'),(72,1,38,'1'),(73,1,39,'1'),(74,1,40,'1'),(75,1,28,'1'),(76,1,41,'1'),(77,1,37,'0'),(78,1,31,'24/7'),(79,1,30,'24/7'),(80,1,32,'24/7'),(81,1,29,'30'),(82,1,36,'99.9%'),(83,1,33,'0'),(84,1,34,'0'),(85,1,35,'0'),(86,193,5,'1'),(87,193,4,'1'),(88,193,7,'1'),(89,193,8,'1'),(90,193,9,'0'),(91,193,10,'0'),(92,193,11,'0'),(93,193,12,'1'),(94,193,42,'0'),(95,193,16,'0'),(96,193,17,'1'),(97,193,18,'1'),(98,193,19,'1'),(99,193,20,'1'),(100,193,21,'1'),(101,193,22,'1'),(102,193,23,'1'),(103,193,38,'1'),(104,193,39,'1'),(105,193,40,'1'),(106,193,28,'1'),(107,193,41,'1'),(108,193,37,'0'),(109,193,31,'24/7'),(110,193,30,'24/7'),(111,193,32,'24/7'),(112,193,29,'30'),(113,193,36,'99.9%'),(114,193,33,'0'),(115,193,34,'0'),(116,193,35,'0');
/*!40000 ALTER TABLE `catalog_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_featuregroup`
--

DROP TABLE IF EXISTS `catalog_featuregroup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_featuregroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_featuregroup`
--

LOCK TABLES `catalog_featuregroup` WRITE;
/*!40000 ALTER TABLE `catalog_featuregroup` DISABLE KEYS */;
INSERT INTO `catalog_featuregroup` VALUES (1,'Promotions',-100,1),(2,'Scripts',0,0),(3,'Languages',0,0),(4,'Services',0,0),(5,'Customer Service',0,0),(6,'Features',10,1),(0,'None',0,0);
/*!40000 ALTER TABLE `catalog_featuregroup` ENABLE KEYS */;
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
  `is_tag` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_featuretype`
--

LOCK TABLES `catalog_featuretype` WRITE;
/*!40000 ALTER TABLE `catalog_featuretype` DISABLE KEYS */;
INSERT INTO `catalog_featuretype` VALUES (1,'Price',1,'price','Top Price Hosts - Price Hosting - Price Web Hosting','Here are the best <strong>Price Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Price hosts</strong> to give you this list of\r\n                <strong>Price hosts</strong>',6,10,1),(2,'Bandwidth',1,'bandwidth','Top Bandwidth Hosts - Bandwidth Hosting - Bandwidth Web Hosting','Here are the best <strong>Bandwidth Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Bandwidth hosts</strong> to give you this list of\r\n                <strong>Bandwidth hosts</strong>',6,9,1),(3,'Space',1,'space','Top Space Hosts - Space Hosting - Space Web Hosting','Here are the best <strong>Space Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Space hosts</strong> to give you this list of\r\n                <strong>Space hosts</strong>',6,9,1),(4,'PHP',1,'php','PHP Hosting - PHP Web Hosting','Here are the best <strong>PHP Hosting\r\n                Providers</strong> in the World! We\'ve taken user reviews\r\n                and compiled the <strong>best PHP hosts</strong> to give you\r\n                this list of <strong>PHP hosts</strong>',3,0,0),(5,'Django',1,'django','Django Hosting - Django Web Hosting','Here are the best <strong>Django Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Django hosts</strong> to give you this list of\r\n                <strong>Django hosts</strong>',2,0,0),(29,'Money Back Guarantee',1,'money-back-guarantee','Top Money Back Guarantee Hosts - Money Back Guarantee Hosting - Money Back Guarantee Web Hosting','Here are the best <strong>Money Back Guarantee Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Money Back Guarantee hosts</strong> to give you this list of\r\n                <strong>Money Back Guarantee hosts</strong>',1,0,1),(7,'PHPmyAdmin',1,'phpmyadmin','PHPmyAdmin Hosting - PHPmyAdmin Web Hosting','Here are the best <strong>PHPmyAdmin Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best PHPmyAdmin hosts</strong> to give you this list of\r\n                <strong>PHPmyAdmin hosts</strong>',2,0,0),(8,'MySQL',1,'mysql','MySQL Hosting - MySQL Web Hosting','Here are the best <strong>MySQL Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best MySQL hosts</strong> to give you this list of\r\n                <strong>MySQL hosts</strong>',4,0,0),(9,'Python',1,'python','Python Hosting - Python Web Hosting','Here are the best <strong>Python Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Python hosts</strong> to give you this list of\r\n                <strong>Python hosts</strong>',3,0,0),(10,'Ruby',1,'ruby','Ruby Hosting - Ruby Web Hosting','Here are the best <strong>Ruby Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Ruby hosts</strong> to give you this list of\r\n                <strong>Ruby hosts</strong>',3,0,0),(11,'Ruby on Rails',1,'ruby-on-rails','Ruby on Rails Hosting - Ruby on Rails Web Hosting','Here are the best <strong>Ruby on Rails Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Ruby on Rails hosts</strong> to give you this list of\r\n                <strong>Ruby on Rails hosts</strong>',2,0,0),(12,'Perl',1,'perl','Perl Hosting - Perl Web Hosting','Here are the best <strong>Perl Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Perl hosts</strong> to give you this list of\r\n                <strong>Perl hosts</strong>',3,0,0),(30,'Online Support',1,'online-support','Top Online Support Hosts - Online Support Hosting - Online Support Web Hosting','Here are the best <strong>Online Support Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Online Support hosts</strong> to give you this list of\r\n                <strong>Online Support hosts</strong>',5,0,0),(31,'Phone Support',1,'phone-support','Top Phone Support Hosts - Phone Support Hosting - Phone Support Web Hosting','Here are the best <strong>Phone Support Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Phone Support hosts</strong> to give you this list of\r\n                <strong>Phone Support hosts</strong>',5,0,0),(32,'Email Support',1,'email-support','Top Email Support Hosts - Email Support Hosting - Email Support Web Hosting','Here are the best <strong>Email Support Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Email Support hosts</strong> to give you this list of\r\n                <strong>Email Support hosts</strong>',5,0,0),(16,'Backups',1,'backups','Backups Hosting - Backups Web Hosting','Here are the best <strong>Backups Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Backups hosts</strong> to give you this list of\r\n                <strong>Backups hosts</strong>',6,0,0),(17,'Control Panel',1,'control-panel','Control Panel Hosting - Control Panel Web Hosting','Here are the best <strong>Control Panel Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Control Panel hosts</strong> to give you this list of\r\n                <strong>Control Panel hosts</strong>',6,0,0),(18,'POP3',1,'pop3','POP3 Hosting - POP3 Web Hosting','Here are the best <strong>POP3 Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best POP3 hosts</strong> to give you this list of\r\n                <strong>POP3 hosts</strong>',4,0,0),(19,'IMAP',1,'imap','IMAP Hosting - IMAP Web Hosting','Here are the best <strong>IMAP Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best IMAP hosts</strong> to give you this list of\r\n                <strong>IMAP hosts</strong>',4,0,0),(20,'Webmail',1,'webmail','Webmail Hosting - Webmail Web Hosting','Here are the best <strong>Webmail Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Webmail hosts</strong> to give you this list of\r\n                <strong>Webmail hosts</strong>',4,0,0),(21,'SPAM Filter',1,'spam-filter','SPAM Filter Hosting - SPAM Filter Web Hosting','Here are the best <strong>SPAM Filter Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best SPAM Filter hosts</strong> to give you this list of\r\n                <strong>SPAM Filter hosts</strong>',6,0,0),(22,'Mail Forwarders',1,'mail-forwarders','Mail Forwarders Hosting - Mail Forwarders Web Hosting','Here are the best <strong>Mail Forwarders Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Mail Forwarders hosts</strong> to give you this list of\r\n                <strong>Mail Forwarders hosts</strong>',6,0,0),(23,'Mail Autoresponders',1,'mail-autoresponders','Mail Autoresponders Hosting - Mail Autoresponders Web Hosting','Here are the best <strong>Mail Autoresponders Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Mail Autoresponders hosts</strong> to give you this list of\r\n                <strong>Mail Autoresponders hosts</strong>',6,0,0),(33,'Google AdWords Credit',1,'google-adwords-credit','Top Google AdWords Credit Hosts - Google AdWords Credit Hosting - Google AdWords Credit Web Hosting','Here are the best <strong>Google AdWords Credit Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Google AdWords Credit hosts</strong> to give you this list of\r\n                <strong>Google AdWords Credit hosts</strong>',1,0,0),(41,'Email',1,'email','Top Email Hosts - Email Hosting - Email Web Hosting','Here are the best <strong>Email Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Email hosts</strong> to give you this list of\r\n                <strong>Email hosts</strong>',4,0,0),(34,'Yahoo! Ad Credit',1,'yahoo-ad-credit','Top Yahoo! Ad Credit Hosts - Yahoo! Ad Credit Hosting - Yahoo! Ad Credit Web Hosting','Here are the best <strong>Yahoo! Ad Credit Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Yahoo! Ad Credit hosts</strong> to give you this list of\r\n                <strong>Yahoo! Ad Credit hosts</strong>',1,0,0),(35,'Microsoft adCenter Credit',1,'microsoft-adcenter-credit','Top Microsoft adCenter Credit Hosts - Microsoft adCenter Credit Hosting - Microsoft adCenter Credit Web Hosting','Here are the best <strong>Microsoft adCenter Credit Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Microsoft adCenter Credit hosts</strong> to give you this list of\r\n                <strong>Microsoft adCenter Credit hosts</strong>',1,0,0),(28,'FTP',1,'ftp','Top FTP Hosts - FTP Hosting - FTP Web Hosting','Here are the best <strong>FTP Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best FTP hosts</strong> to give you this list of\r\n                <strong>FTP hosts</strong>',4,0,0),(36,'Uptime Guarantee',1,'uptime-guarantee','Top Uptime Guarantee Hosts - Uptime Guarantee Hosting - Uptime Guarantee Web Hosting','Here are the best <strong>Uptime Guarantee Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Uptime Guarantee hosts</strong> to give you this list of\r\n                <strong>Uptime Guarantee hosts</strong>',1,0,1),(37,'Wordpress',1,'wordpress','Top Wordpress Hosts - Wordpress Hosting - Wordpress Web Hosting','Here are the best <strong>Wordpress Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Wordpress hosts</strong> to give you this list of\r\n                <strong>Wordpress hosts</strong>',2,0,0),(38,'Addon Domains',1,'addon-domains','Top Addon Domains Hosts - Addon Domains Hosting - Addon Domains Web Hosting','Here are the best <strong>Addon Domains Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Addon Domains hosts</strong> to give you this list of\r\n                <strong>Addon Domains hosts</strong>',6,0,0),(39,'Sub-Domains',1,'sub-domains','Top Sub-Domains Hosts - Sub-Domains Hosting - Sub-Domains Web Hosting','Here are the best <strong>Sub-Domains Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Sub-Domains hosts</strong> to give you this list of\r\n                <strong>Sub-Domains hosts</strong>',6,0,0),(40,'Databases',1,'databases','Top Databases Hosts - Databases Hosting - Databases Web Hosting','Here are the best <strong>Databases Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Databases hosts</strong> to give you this list of\r\n                <strong>Databases hosts</strong>',6,0,0),(42,'Free Domain',1,'free-domain','Top Free Domain Hosts - Free Domain Hosting - Free Domain Web Hosting','Here are the best <strong>Free Domain Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Free Domain hosts</strong> to give you this list of\r\n                <strong>Free Domain hosts</strong>',1,0,0);
/*!40000 ALTER TABLE `catalog_featuretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_hit`
--

DROP TABLE IF EXISTS `catalog_hit`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_hit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `host_id` int(11) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `referrer` longtext,
  `pub_date` datetime NOT NULL,
  `note` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `session` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_hit_host_id` (`host_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_hit`
--

LOCK TABLES `catalog_hit` WRITE;
/*!40000 ALTER TABLE `catalog_hit` DISABLE KEYS */;
INSERT INTO `catalog_hit` VALUES (1,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-04 23:49:40','leaderboard',''),(2,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:44:36','leaderboard_hover',''),(3,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:45:01','leaderboard_hover',''),(4,'127.0.0.1',194,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:45:31','leaderboard_hover',''),(5,'127.0.0.1',204,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:51:32','leaderboard_hover',''),(6,'127.0.0.1',200,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:51:40','leaderboard_hover',''),(7,'127.0.0.1',199,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:51:48','leaderboard_hover',''),(8,'127.0.0.1',198,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:52:39','leaderboard_hover',''),(9,'127.0.0.1',199,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:53:02','leaderboard_hover',''),(10,'127.0.0.1',200,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://my7.statcounter.com/project/standard2/camefrom.php?project_id=4410292','2009-02-05 00:53:22','leaderboard_hover',''),(11,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-05 20:27:30','leaderboard_hover',''),(12,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-05 20:28:02','leaderboard_hover',''),(13,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-05 20:29:03','leaderboard_hover',''),(14,'127.0.0.1',1,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-05 20:29:04','leaderboard_hover',''),(15,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-05 20:30:28','no_js',''),(16,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-05 20:33:02','no_js',''),(17,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-06 00:14:19','leaderboard_hover',''),(18,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-06 00:14:24','leaderboard_hover',''),(19,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/','2009-02-06 00:52:48','logo',''),(20,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1','http://localhost.hosting-choice.com/admin/','2009-02-07 19:40:05','leaderboard_hover','ee4be8f5a49c550bd15121db6ba818bf'),(21,'127.0.0.1',198,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1','http://localhost.hosting-choice.com/admin/','2009-02-07 20:54:02','under_entry','ee4be8f5a49c550bd15121db6ba818bf'),(22,'127.0.0.1',198,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1','http://localhost.hosting-choice.com/admin/','2009-02-07 20:54:10','under_entry','ee4be8f5a49c550bd15121db6ba818bf'),(23,'127.0.0.1',200,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1','http://localhost.hosting-choice.com/admin/','2009-02-07 20:54:27','visit_button','ee4be8f5a49c550bd15121db6ba818bf'),(24,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-07 20:54:45','leaderboard_hover?sid=1347410422665767b1f22454425223eb','1347410422665767b1f22454425223eb'),(25,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-07 20:54:48','under_entry','1347410422665767b1f22454425223eb'),(26,'127.0.0.1',201,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-07 20:55:31','under_entry','1347410422665767b1f22454425223eb'),(27,'127.0.0.1',201,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-07 20:57:17','comments','1347410422665767b1f22454425223eb'),(28,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-07 20:58:39','leaderboard_hover?sid=1347410422665767b1f22454425223eb','1347410422665767b1f22454425223eb'),(29,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-07 20:58:58','leaderboard_hover?sid=1347410422665767b1f22454425223eb','1347410422665767b1f22454425223eb'),(30,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-08 16:56:57','leaderboard_hover?sid=1347410422665767b1f22454425223eb','1347410422665767b1f22454425223eb'),(31,'127.0.0.1',199,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-08 16:58:04','leaderboard_hover?sid=1347410422665767b1f22454425223eb','1347410422665767b1f22454425223eb'),(32,'127.0.0.1',199,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-08 16:58:04','leaderboard_visit','1347410422665767b1f22454425223eb'),(33,'127.0.0.1',196,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-08 17:01:25','leaderboard_hover?sid=1347410422665767b1f22454425223eb','1347410422665767b1f22454425223eb'),(34,'127.0.0.1',198,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-08 17:01:32','leaderboard_hover?sid=1347410422665767b1f22454425223eb','1347410422665767b1f22454425223eb'),(35,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-08 19:07:02','leaderboard_logo','1347410422665767b1f22454425223eb'),(36,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1','http://localhost.hosting-choice.com/admin/','2009-02-08 19:09:30','leaderboard_visit','ee4be8f5a49c550bd15121db6ba818bf'),(37,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-08 19:58:32','under_entry','1347410422665767b1f22454425223eb'),(38,'127.0.0.1',195,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1','http://localhost.hosting-choice.com/admin/','2009-02-08 20:50:35','under_entry','ee4be8f5a49c550bd15121db6ba818bf'),(39,'127.0.0.1',1,'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.0.6) Gecko/2009011912 Firefox/3.0.6','http://localhost.hosting-choice.com/admin/','2009-02-11 16:18:58','leaderboard_visit','1347410422665767b1f22454425223eb');
/*!40000 ALTER TABLE `catalog_hit` ENABLE KEYS */;
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
  `active` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `featured` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `catalog_host_user_id` (`user_id`),
  KEY `catalog_host_category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_host`
--

LOCK TABLES `catalog_host` WRITE;
/*!40000 ALTER TABLE `catalog_host` DISABLE KEYS */;
INSERT INTO `catalog_host` VALUES (1,1,1,'BlueHost','bluehost','BlueHost has been providing hosting solutions to thousands of business and personal web sites since 1996. Our internet hosting package helps businesses and individuals get high-powered service at a fraction of the cost.','http://www.tkqlhce.com/click-3316503-10376736',0,0,'',1,'hosts/Picture_7.png',0),(195,1,1,'HostingPad','hostingpad','Webhostingpad.com was formed in 2005 with a team of very successful and proven industry veterans intent on delivering the best value in web hosting. With the growing need for affordable hosting, the company set out to deliver the best web hosting at a price where everyone can afford to have their piece of the world wide web. Webhostingpad.com remains committed to delivering the best value in Internet hosting by providing a safe, reliable and efficient process to create an Internet presence, all with a price structure driven by value.','http://www.webhostingpad.com/2838.html',0,0,'',1,'hosts/Picture_5.png',0),(193,1,1,'HostRocket','hostrocket','HostRocket offers reliable, affordable dedicated and shared web hosting for both professional and personal websites. We provide cheap, secure domain hosting packages ranging from very basic, shared hosting to high bandwidth and high storage dedicated hosting.','http://affiliatecenter.hostrocket.com//idevaffiliate.php?id=5148',0,0,'',1,'hosts/Picture_2.png',0),(194,1,1,'JustHost','justhost','Just Host are dedicated to providing their customers with the most reliable web hosting service possible.\r\nAffordable price plans, secure servers, first class 24/7 technical support and a wide range of features\r\nmake hosting your website with Just Host the obvious choice.','http://www.kqzyfj.com/click-3316503-10589817',0,0,'',1,'hosts/Picture_3.png',0),(196,1,1,'Host Papa','host-papa','At HostPapa, we consider every one of our customers to be a part of our family. That\'s why our motto is \"Let Papa take care of you\".\r\n\r\nWe understand that our customers\' web sites are important and that they need to be able to count on us to ensure that their service is not interrupted.\r\n\r\nWe have established a solid foundation to offer a hosting solution for small-to-medium sized businesses that is reliable, easy-to-use, and customer service-oriented, all for a low cost.','http://hostpapa.com/cgi-bin/affiliates/clickthru.cgi?id=Jasber',0,0,'',1,'hosts/supportsuite.gif',0),(197,1,1,'Yahoo!','yahoo','Yahoo! is committed to making your online business a success. To prove we offer the best web hosting plan, we are pleased to offer our 30-Day Satisfaction Guarantee!\r\nIf you\'re not completely happy with your service within 30 days of ordering Yahoo! Web Hosting, we\'ll refund your hosting fee.','http://www.anrdoezrs.net/click-3316503-10492621',0,0,'',1,'hosts/y3.gif',0),(198,1,1,'GoDaddy','godaddy','GoDaddy.com hosting plans are ideal for most individuals and small businesses. We\'re the affordable, reliable place to host your site, offering features like a 99.9% network uptime commitment and 24/7 support.','http://www.tkqlhce.com/click-3316503-10378494',0,0,'',1,'hosts/10382133.gif.jpeg',0),(199,1,1,'IPOWER','ipower','IPOWER, Inc., founded in October 2001, provides web hosting and web services for small- and medium-sized businesses worldwide looking to build, manage, promote and profit from an online presence. The company, which offers domain registration, web site hosting, e-commerce tools, merchant services, application hosting, online marketing, site optimization services, and web site design, is also famous for the speed and effectiveness of its customer support.','http://www.jdoqocy.com/click-3316503-10398311',0,0,'',1,'hosts/Picture_6.png',0),(200,1,1,'Host Gator','host-gator','HostGator.com, LLC is a world leading provider of shared, reseller, and dedicated web hosting. Privately held and based in Houston, Texas, the company was founded in 2002 by current President and CEO Brent Oxley, who started the company from his dorm room at Florida Atlantic University. Since then, HostGator has grown from a small hosting company with just three servers into a world leading and industry recognized hosting provider with more than 5,000 servers under management. The over one million domains hosted by HostGator make up approximately 1% of the world\'s Internet traffic.','http://www.dpbolvw.net/click-3316503-10410811',0,0,'',1,'hosts/10414006.gif',0),(201,1,1,'PowWeb','powweb','Since 1999, PowWeb has offered a low-cost, feature-rich Web hosting platform that appeals to a broad spectrum of users. Our all-inclusive “One Plan” takes the hassle out of finding the perfect hosting solution. Whether customers are small business owners or are running a state-of-the-art Web 2.0 application site, PowWeb provides the uptime and features they’ll need.','http://www.anrdoezrs.net/click-3316503-10394288',0,0,'',1,'hosts/10315183.gif',0),(202,1,1,'Lunarpages','lunarpages','There are thousands of web hosting services so why choose Lunarpages? When comparing web hosts it is important not only to consider a price difference of a dollar or two. Although we offer more data transfer and storage resources then you will likely ever utilize, we prefer to focus on something much more important, reliable web hosting and great customer service. Above all we take care of you personally and attentively with 24-7 award winning customer support. It\'s all about making sure your website and email remain online and you are happy. It\'s not just technical support to us; it\'s about caring for people since 1998. Phone us any time and become part of the rapidly growing Lunarpages web hosting family. We are rated #1 in the world. Call us now and find out why.\r\n','http://www.anrdoezrs.net/click-3316503-8242916',0,0,'',1,'hosts/logo2.png',0),(203,1,1,'StartLogic','startlogic','StartLogic is a leading provider of Web-hosting solutions and services for global business. Across the globe, businesses depend on StartLogic\'s easy-to-use, advanced and reliable load-balanced architecture, as well as responsive and knowledgable customer service to power their online presence.\r\n\r\nStartLogic offers a full line of solutions for personal, business, government and education customers.','http://www.anrdoezrs.net/click-3316503-10387606',0,0,'',1,'hosts/startlogic_logo.gif',0),(204,1,1,'IX Web Hosting','ix-web-hosting','Reliability and support are major factors when considering a hosting provider. That’s why IX Web Hosting has just built a state-of-the-art Data Center, capable of storing up to 10,000 web servers! IX Web Hosting also provides a full team of round-the clock technicians and a separate Call Center also offering 24/7 customer support. IX offers three plans to fit all features and pricing needs.','http://www.kqzyfj.com/click-3316503-10394256',0,0,'',1,'hosts/header_logo.gif',0),(205,1,1,'FatCow','fatcow','FatCow was born in 1998 and the rest is history. We\'ve grown our company with a dedicated group of talented believers in the notion that simple, old fashioned service and value still ring true. FatCow has focused our entire company on delivering the best value and customer service experience in Web hosting to the small business user. We make every effort to make our services easy to own, easy to use and most importantly to provide real business value. And yes, we like to have fun doing it.','http://www.jdoqocy.com/click-3316503-10492159',0,0,'',1,'hosts/10443943.gif',0),(206,1,1,'Web Hosting Pad','web-hosting-pad','Webhostingpad.com was formed in 2005 with a team of very successful and proven industry veterans intent on delivering the best value in web hosting. With the growing need for affordable hosting, the company set out to deliver the best web hosting at a price where everyone can afford to have their piece of the world wide web. Webhostingpad.com remains committed to delivering the best value in Internet hosting by providing a safe, reliable and efficient process to create an Internet presence, all with a price structure driven by value.','http://www.kqzyfj.com/click-3316503-10555752',0,0,'',1,'hosts/Picture_8.png',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=326 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_karma`
--

LOCK TABLES `catalog_karma` WRITE;
/*!40000 ALTER TABLE `catalog_karma` DISABLE KEYS */;
INSERT INTO `catalog_karma` VALUES (147,144,'127.0.0.1',1),(323,2657,'127.0.0.1',1),(240,304,'127.0.0.1',1),(316,304,'12.217.117.143',1),(321,2654,'127.0.0.1',1),(320,2651,'127.0.0.1',1),(319,2650,'127.0.0.1',1),(324,2652,'127.0.0.1',1),(325,2656,'127.0.0.1',1);
/*!40000 ALTER TABLE `catalog_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_quote`
--

DROP TABLE IF EXISTS `catalog_quote`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_quote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_quote_host_id` (`host_id`),
  KEY `catalog_quote_comment_id` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_quote`
--

LOCK TABLES `catalog_quote` WRITE;
/*!40000 ALTER TABLE `catalog_quote` DISABLE KEYS */;
INSERT INTO `catalog_quote` VALUES (5,193,2668,'This is the most amazing host ever!',0,1),(6,193,2667,'Wow, simply amazing!',0,1),(4,1,2656,'This website is the best website I\'ve ever used.',0,1);
/*!40000 ALTER TABLE `catalog_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_ranktime`
--

DROP TABLE IF EXISTS `catalog_ranktime`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_ranktime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `host_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_ranktime_host_id` (`host_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_ranktime`
--

LOCK TABLES `catalog_ranktime` WRITE;
/*!40000 ALTER TABLE `catalog_ranktime` DISABLE KEYS */;
INSERT INTO `catalog_ranktime` VALUES (2,'2009-01-17 22:49:25',195,2),(3,'2009-01-17 22:49:25',1,3),(4,'2009-01-17 22:49:25',193,4),(5,'2009-01-17 22:49:25',194,5),(6,'2009-01-17 22:49:25',196,6),(7,'2009-01-17 22:49:25',197,7),(8,'2009-01-17 22:49:25',198,8),(9,'2009-01-17 22:49:25',199,9),(10,'2009-01-17 22:49:25',200,10),(11,'2009-01-17 22:49:25',201,11),(12,'2009-01-17 22:49:25',202,12),(13,'2009-01-17 22:49:25',203,13),(14,'2009-01-17 22:49:25',204,14),(15,'2009-01-17 22:49:25',205,15),(16,'2009-01-17 22:49:25',206,16),(18,'2009-01-17 22:50:04',195,2),(19,'2009-01-17 22:50:04',1,3),(20,'2009-01-17 22:50:04',193,4),(21,'2009-01-17 22:50:04',194,5),(22,'2009-01-17 22:50:04',196,6),(23,'2009-01-17 22:50:04',197,7),(24,'2009-01-17 22:50:04',198,8),(25,'2009-01-17 22:50:04',199,9),(26,'2009-01-17 22:50:04',200,10),(27,'2009-01-17 22:50:04',201,11),(28,'2009-01-17 22:50:04',202,12),(29,'2009-01-17 22:50:04',203,13),(30,'2009-01-17 22:50:04',204,14),(31,'2009-01-17 22:50:04',205,15),(32,'2009-01-17 22:50:04',206,16);
/*!40000 ALTER TABLE `catalog_ranktime` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=8141 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_rating`
--

LOCK TABLES `catalog_rating` WRITE;
/*!40000 ALTER TABLE `catalog_rating` DISABLE KEYS */;
INSERT INTO `catalog_rating` VALUES (1060,304,4,5),(1061,304,6,0),(1062,304,5,0),(1063,305,4,0),(1064,305,6,1),(1065,305,5,5),(1141,334,6,1),(1140,334,4,1),(1142,334,5,1),(8101,2654,5,3),(8100,2654,6,3),(8099,2654,4,3),(8098,2653,5,1),(8097,2653,6,1),(8096,2653,4,1),(8095,2652,5,4),(8094,2652,6,4),(8093,2652,4,5),(8074,2645,5,5),(8073,2645,6,5),(8072,2645,4,5),(8078,2647,4,1),(8079,2647,6,0),(8080,2647,5,0),(8092,2651,5,5),(8091,2651,6,5),(8090,2651,4,5),(8084,2649,4,2),(8085,2649,6,2),(8086,2649,5,2),(8087,2650,4,5),(8088,2650,6,4),(8089,2650,5,4),(8102,2656,4,0),(8103,2656,6,0),(8104,2656,5,0),(8105,2657,4,5),(8106,2657,6,5),(8107,2657,5,5),(8108,2658,4,5),(8109,2658,6,5),(8110,2658,5,5),(8140,2668,5,5),(8139,2668,6,5),(8138,2668,4,5),(8137,2667,5,5),(8136,2667,6,5),(8135,2667,4,5),(8123,2663,4,1),(8124,2663,6,1),(8125,2663,5,1),(8126,2664,4,1),(8127,2664,6,1),(8128,2664,5,1),(8134,2666,5,4),(8133,2666,6,4),(8132,2666,4,5);
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
-- Table structure for table `catalog_summary`
--

DROP TABLE IF EXISTS `catalog_summary`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_summary_host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_summary`
--

LOCK TABLES `catalog_summary` WRITE;
/*!40000 ALTER TABLE `catalog_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_summary` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2008-12-13 19:48:41',1,9,'1','Computers',1,''),(2,'2008-12-13 19:48:57',1,9,'2','Internet',1,''),(113,'2009-01-03 02:26:51',1,20,'2','Support',1,''),(112,'2009-01-03 02:26:38',1,18,'1','Features (4/5)',1,''),(6,'2008-12-13 20:47:54',1,9,'1','Accounting',1,''),(7,'2008-12-13 20:54:11',1,9,'1','Accounting',1,''),(8,'2008-12-13 20:54:37',1,9,'1','Accounting',2,'No fields changed.'),(9,'2008-12-13 20:54:57',1,9,'2','Automotive',1,''),(10,'2008-12-13 20:55:00',1,9,'2','Automotive',2,'No fields changed.'),(11,'2008-12-13 20:55:07',1,9,'3','Business Travel',1,''),(12,'2008-12-13 20:55:13',1,9,'4','Economy',1,''),(13,'2008-12-13 20:55:19',1,9,'5','Education',1,''),(14,'2008-12-13 20:55:26',1,9,'6','Food',1,''),(15,'2008-12-13 20:56:35',1,9,'1','Accounting',1,''),(16,'2008-12-13 20:56:44',1,9,'2','Automotive',1,''),(17,'2008-12-13 20:56:51',1,9,'3','Business Travel',1,''),(18,'2008-12-13 20:56:56',1,9,'4','Economy',1,''),(19,'2008-12-13 20:57:02',1,9,'5','Education',1,''),(20,'2008-12-13 20:57:05',1,9,'6','Food',1,''),(21,'2008-12-13 20:57:10',1,9,'7','Games',1,''),(22,'2008-12-13 20:57:16',1,9,'8','Health Care',1,''),(23,'2008-12-13 20:57:27',1,9,'9','Human Resources',1,''),(24,'2008-12-13 20:57:41',1,9,'10','Technology',1,''),(120,'2009-01-04 16:20:00',1,23,'1','BlueHost',2,'Changed price and image.'),(119,'2009-01-04 16:17:04',1,23,'1','BlueHost',1,''),(27,'2008-12-15 01:29:44',1,9,'1','Business',1,''),(28,'2008-12-15 01:30:05',1,9,'2','Art',1,''),(29,'2008-12-15 01:30:19',1,9,'3','Music',1,''),(31,'2008-12-15 01:31:55',1,9,'5','Startups',1,''),(111,'2009-01-03 02:26:34',1,20,'1','Features',1,''),(110,'2009-01-03 02:26:23',1,17,'1','Idologic is the best. They are the most superb hos',1,''),(117,'2009-01-04 15:56:25',1,9,'1','Shared Hosting',2,'Changed slug.'),(36,'2008-12-15 01:52:46',1,9,'8','Law',1,''),(109,'2009-01-03 02:22:11',1,9,'1','Shared Hosting',1,''),(43,'2008-12-23 00:18:22',1,20,'2','RatingType object',1,''),(42,'2008-12-23 00:18:12',1,20,'1','RatingType object',1,''),(44,'2008-12-23 00:18:38',1,20,'3','RatingType object',1,''),(45,'2008-12-23 00:26:58',1,9,'5','Startups',3,''),(46,'2008-12-23 00:27:02',1,9,'3','Music',3,''),(47,'2008-12-23 00:27:05',1,9,'1','Business',3,''),(48,'2008-12-23 00:27:10',1,9,'2','Art',3,''),(49,'2008-12-23 00:28:38',1,9,'5','Startups',3,''),(50,'2008-12-23 00:28:41',1,9,'3','Music',3,''),(51,'2008-12-23 00:28:45',1,9,'2','Art',3,''),(52,'2008-12-23 00:29:02',1,9,'1','Root',2,'Changed name, slug and parent.'),(53,'2008-12-23 00:29:23',1,9,'8','Shared Hosting',1,''),(116,'2009-01-03 02:27:36',1,18,'3','Uptime (4/5)',1,''),(55,'2008-12-23 00:31:53',1,20,'1','Support',1,''),(56,'2008-12-23 00:32:00',1,18,'1','Support (5)',1,''),(57,'2008-12-23 00:33:42',1,17,'1','I really enjoy using this host!',1,''),(58,'2008-12-23 00:33:51',1,20,'2','Uptime',1,''),(59,'2008-12-23 00:34:06',1,18,'2','Uptime (4/5)',1,''),(60,'2008-12-23 00:34:13',1,20,'3','Features',1,''),(61,'2008-12-23 00:34:19',1,18,'3','Features (2/5)',1,''),(62,'2008-12-23 00:34:22',1,17,'1','I really enjoy using this host!',2,'Changed rating.'),(63,'2008-12-23 01:06:24',1,9,'5','Startups',3,''),(64,'2008-12-23 01:07:38',1,9,'3','Music',3,''),(65,'2008-12-23 01:07:41',1,9,'2','Art',3,''),(66,'2008-12-23 01:07:51',1,9,'1','root',2,'Changed name, slug and parent.'),(67,'2008-12-23 01:08:04',1,9,'8','Shared Hosting',1,''),(115,'2009-01-03 02:27:07',1,20,'3','Uptime',1,''),(69,'2008-12-23 01:09:17',1,20,'1','Support',1,''),(70,'2008-12-23 01:09:21',1,18,'1','Support (5/5)',1,''),(71,'2008-12-23 01:09:28',1,20,'2','Uptime',1,''),(72,'2008-12-23 01:09:30',1,18,'2','Uptime (5/5)',1,''),(73,'2008-12-23 01:09:38',1,20,'3','Features',1,''),(74,'2008-12-23 01:09:42',1,18,'3','Features (4/5)',1,''),(75,'2008-12-23 01:09:52',1,17,'1','I really like this host!',1,''),(76,'2008-12-23 01:33:14',1,9,'8','Shared Hosting',1,''),(78,'2008-12-23 01:36:27',1,20,'1','Features',1,''),(79,'2008-12-23 01:36:29',1,18,'1','Features (5/5)',1,''),(80,'2008-12-23 01:36:36',1,20,'2','Uptime',1,''),(81,'2008-12-23 01:36:37',1,18,'2','Uptime (5/5)',1,''),(82,'2008-12-23 01:36:46',1,20,'3','Support',1,''),(83,'2008-12-23 01:36:47',1,18,'3','Support (4/5)',1,''),(84,'2008-12-23 01:36:51',1,17,'1','I love them!',1,''),(85,'2008-12-23 01:45:34',1,20,'1','Features',1,''),(86,'2008-12-23 01:46:19',1,18,'3','Features (5/5)',1,''),(87,'2008-12-23 01:46:38',1,20,'2','Support',1,''),(88,'2008-12-23 01:46:40',1,18,'4','Support (5/5)',1,''),(89,'2008-12-23 01:46:46',1,20,'3','Uptime',1,''),(90,'2008-12-23 01:46:50',1,18,'5','Uptime (4/5)',1,''),(91,'2008-12-23 01:46:53',1,17,'1','I love them!',2,'Changed rating.'),(92,'2008-12-23 23:57:56',1,9,'8','Shared Hosting',1,''),(114,'2009-01-03 02:26:54',1,18,'2','Support (3/5)',1,''),(94,'2008-12-24 00:07:23',1,20,'1','Uptime',1,''),(95,'2008-12-24 00:07:25',1,18,'1','Uptime (5/5)',1,''),(96,'2008-12-24 00:07:38',1,20,'2','Support',1,''),(97,'2008-12-24 00:07:42',1,18,'2','Support (5/5)',1,''),(98,'2008-12-24 00:07:48',1,20,'3','Features',1,''),(99,'2008-12-24 00:07:50',1,18,'3','Features (5/5)',1,''),(100,'2008-12-24 00:08:12',1,17,'1','',1,''),(101,'2008-12-24 00:11:13',1,17,'1','I really like this host. They\'re awesome!',1,''),(102,'2008-12-24 00:11:21',1,20,'1','Uptime',1,''),(103,'2008-12-24 00:11:25',1,18,'1','Uptime (3/5)',1,''),(104,'2008-12-24 00:11:33',1,20,'2','Features',1,''),(105,'2008-12-24 00:11:37',1,18,'2','Features (4/5)',1,''),(106,'2008-12-24 00:11:46',1,20,'3','Support',1,''),(107,'2008-12-24 00:11:50',1,18,'3','Support (5/5)',1,''),(118,'2009-01-04 16:03:15',1,9,'1','Shared Hosting',1,''),(121,'2009-01-04 16:24:57',1,23,'1','BlueHost',2,'Changed image.'),(122,'2009-01-04 16:30:38',1,17,'1','BlueHost is the best host I\'ve seen in a long time',1,''),(123,'2009-01-04 17:01:45',1,20,'1','Features',1,''),(124,'2009-01-04 17:01:49',1,20,'2','Uptime',1,''),(125,'2009-01-04 17:01:56',1,20,'3','Support',1,''),(126,'2009-01-04 19:38:17',1,18,'283','Features (3/5)',1,''),(127,'2009-01-04 19:38:26',1,18,'284','Uptime (5/5)',1,''),(128,'2009-01-04 19:38:38',1,18,'285','Support (3/5)',1,''),(129,'2009-01-04 20:28:11',1,17,'1','BlueHost is awesome. I can\'t believe I\'ve never tr',1,''),(130,'2009-01-04 20:45:22',1,17,'2','BlueHost sucks. They are always down and they neve',1,''),(131,'2009-01-04 20:45:29',1,18,'286','Features (3/5)',1,''),(132,'2009-01-04 20:45:42',1,18,'287','Uptime (0/5)',1,''),(133,'2009-01-04 20:46:10',1,18,'288','Support (1/5)',1,''),(134,'2009-01-04 22:23:46',1,23,'1','BlueHost',2,'Changed image.'),(135,'2009-01-04 22:24:49',1,23,'1','BlueHost',2,'No fields changed.'),(136,'2009-01-04 22:25:17',1,23,'1','BlueHost',2,'Changed image.'),(137,'2009-01-04 22:26:12',1,23,'1','BlueHost',2,'Changed image.'),(138,'2009-01-05 00:10:19',1,17,'42','I\'ve had a neutral experience. I\'m really undecide',1,''),(139,'2009-01-05 00:11:06',1,17,'43','They\'re OK. Not terrible, but certainly not the be',1,''),(140,'2009-01-05 00:11:19',1,18,'404','Features (4/5)',1,''),(141,'2009-01-05 00:14:37',1,17,'43','They\'re OK. Not terrible, but certainly not the be',2,'Changed active.'),(142,'2009-01-05 01:07:51',1,21,'88','Karma object',1,''),(143,'2009-01-05 01:08:18',1,21,'89','Karma object',1,''),(144,'2009-01-05 01:36:47',1,21,'90','Karma object',1,''),(145,'2009-01-06 20:25:35',1,20,'4','Features',1,''),(146,'2009-01-06 20:25:43',1,20,'5','Support',1,''),(147,'2009-01-06 20:25:46',1,20,'6','Uptime',1,''),(148,'2009-01-06 21:27:09',1,17,'142','I love this hosting company. Seriously rocks!',2,'Changed active.'),(149,'2009-01-06 21:35:13',1,17,'144','They totally suck. Like really. Suckage!',2,'Changed active.'),(150,'2009-01-07 00:24:15',1,23,'140','DreamHost',1,''),(151,'2009-01-07 00:24:55',1,23,'140','InMotion',2,'Changed name, slug and url.'),(152,'2009-01-09 18:04:18',1,25,'1','Price (per month)',1,''),(153,'2009-01-09 18:05:42',1,25,'1','Price (per month)',1,''),(154,'2009-01-09 18:06:39',1,25,'2','Bandwidth (GB)',1,''),(155,'2009-01-09 18:06:54',1,25,'3','Space (MB)',1,''),(156,'2009-01-09 18:07:00',1,23,'1','BlueHost',2,'Added feature \"Price (per month) (9.99)\". Added feature \"Bandwidth (GB) (100)\". Added feature \"Space (MB) (100)\".'),(157,'2009-01-09 18:07:21',1,25,'2','Bandwidth (MB)',2,'Changed units and suffix.'),(158,'2009-01-09 20:59:43',1,23,'140','InMotion',2,'Added feature \"Price (5.99)\". Added feature \"Bandwidth (1024)\". Added feature \"Space (1024)\".'),(159,'2009-01-09 22:38:43',1,23,'191','Idologic',1,''),(160,'2009-01-10 14:25:16',1,23,'None','Idologic',3,''),(161,'2009-01-10 23:17:33',1,26,'1','/about.html - About Us',1,''),(162,'2009-01-10 23:17:54',1,26,'2','/submit.html - Submit A Host',1,''),(163,'2009-01-10 23:28:57',1,9,'1','Shared Hosting',2,'Changed description.'),(164,'2009-01-10 23:29:39',1,9,'1','Shared Hosting',2,'Changed description.'),(165,'2009-01-11 01:49:29',1,23,'192','HostMonster',1,''),(166,'2009-01-11 01:51:31',1,23,'192','HostMonster',2,'Added feature \"Price (5.95)\". Added feature \"Bandwidth (0)\". Added feature \"Space (0)\".'),(167,'2009-01-11 02:01:05',1,23,'193','HostRocket',1,''),(168,'2009-01-11 02:02:54',1,23,'194','JustHost',1,''),(169,'2009-01-11 02:06:07',1,25,'1','Price',2,'Changed suffix.'),(170,'2009-01-11 14:28:40',1,3,'2','troy',1,''),(171,'2009-01-11 14:28:50',1,3,'2','troy',2,'Changed is_superuser.'),(172,'2009-01-11 14:29:02',1,3,'2','troy',2,'Changed is_staff.'),(173,'2009-01-11 14:38:59',1,23,'None','InMotion',3,''),(174,'2009-01-11 14:39:16',1,3,'None','troy',3,''),(175,'2009-01-11 14:41:08',1,23,'1','BlueHost',2,'Changed value for feature \"Price (7.95)\". Changed value for feature \"Bandwidth (0)\". Changed value for feature \"Space (0)\".'),(176,'2009-01-11 15:43:38',1,23,'195','HostingPad',1,''),(177,'2009-01-11 15:46:45',1,23,'196','Host Papa',1,''),(178,'2009-01-11 16:01:00',1,23,'197','Yahoo!',1,''),(179,'2009-01-11 16:10:45',1,23,'198','GoDaddy',1,''),(180,'2009-01-11 16:15:39',1,23,'199','IPOWER',1,''),(181,'2009-01-11 16:20:10',1,23,'200','Host Gator',1,''),(182,'2009-01-11 16:26:38',1,23,'201','PowWeb',1,''),(183,'2009-01-11 16:27:31',1,23,'200','Host Gator',2,'Changed url.'),(184,'2009-01-11 16:28:03',1,23,'199','IPOWER',2,'Changed url.'),(185,'2009-01-11 16:28:50',1,23,'198','GoDaddy',2,'Changed url.'),(186,'2009-01-11 16:32:23',1,23,'1','BlueHost',2,'Changed url and image.'),(187,'2009-01-11 16:33:24',1,23,'200','Host Gator',2,'Changed url.'),(188,'2009-01-11 16:34:42',1,23,'199','IPOWER',2,'Changed url.'),(189,'2009-01-11 16:36:09',1,23,'194','JustHost',2,'Changed url.'),(190,'2009-01-11 16:37:06',1,23,'201','PowWeb',2,'Changed url.'),(191,'2009-01-11 16:37:57',1,23,'197','Yahoo!',2,'Changed url.'),(192,'2009-01-11 16:41:50',1,23,'202','Lunarpages',1,''),(193,'2009-01-11 16:47:17',1,23,'203','StartLogic',1,''),(194,'2009-01-11 16:48:43',1,23,'203','StartLogic',2,'Changed image.'),(195,'2009-01-11 16:55:05',1,23,'204','IX Web Hosting',1,''),(196,'2009-01-11 16:57:34',1,23,'205','FatCow',1,''),(197,'2009-01-11 17:15:53',1,23,'206','Web Hosting Pad',1,''),(198,'2009-01-13 00:43:26',1,26,'3','/faq.html - FAQ',1,''),(199,'2009-01-13 23:11:07',1,26,'4','/news.html - News',1,''),(200,'2009-01-15 00:14:13',1,17,'2655','asdfasdfasdfas',1,''),(201,'2009-01-15 00:14:22',1,17,'None','asdfasdfasdfas',3,''),(202,'2009-01-15 00:15:27',1,28,'1','Entry object',1,''),(203,'2009-01-19 20:37:04',1,28,'2','Hosting Choice: First Week In - Brad',1,''),(204,'2009-01-19 20:37:08',1,28,'2','Hosting Choice: First Week In - Brad',2,'No fields changed.'),(205,'2009-01-19 21:02:05',1,17,'None','This is an awesome host. I seriously love them!',3,''),(206,'2009-01-19 21:02:10',1,17,'None','test',3,''),(207,'2009-01-19 21:02:16',1,17,'None','I love this hosting company. Seriously rocks!',3,''),(208,'2009-01-20 02:25:18',1,30,'1','Quote object',1,''),(209,'2009-01-20 02:27:10',1,30,'2','Quote object',1,''),(210,'2009-01-20 02:27:23',1,30,'3','Quote object',1,''),(211,'2009-01-20 02:27:38',1,30,'4','Quote object',1,''),(212,'2009-01-20 03:04:42',1,30,'None','(BlueHost) This website is terrible!',3,''),(213,'2009-01-20 03:04:49',1,30,'None','(BlueHost) Great host!',3,''),(214,'2009-01-22 17:52:57',1,30,'1','(BlueHost) Good Site, Easy to Use',2,'Changed comment.'),(215,'2009-01-30 18:49:33',1,32,'1','FAQ object',1,''),(216,'2009-01-30 18:49:48',1,32,'2','FAQ object',1,''),(217,'2009-01-30 18:50:03',1,32,'3','FAQ object',1,''),(218,'2009-02-03 22:53:41',1,23,'None','HostMonster',3,''),(219,'2009-02-06 00:14:01',1,25,'4','PHP',1,''),(220,'2009-02-06 00:14:06',1,25,'5','Django',1,''),(221,'2009-02-06 00:28:57',1,25,'4','PHP',2,'No fields changed.'),(222,'2009-02-06 00:33:09',1,25,'5','Django',2,'Changed is_tag.'),(223,'2009-02-06 00:33:12',1,25,'5','Django',2,'Changed is_tag.'),(224,'2009-02-06 00:52:28',1,23,'195','HostingPad',2,'Added feature \"Django (1)\". Added feature \"PHP (1)\".'),(225,'2009-02-06 00:56:47',1,25,'6','30-day Money Back',2,'Changed description.'),(226,'2009-02-06 00:56:59',1,25,'6','30-day Money Back',2,'Changed description.'),(227,'2009-02-06 00:57:11',1,25,'7','PHPmyAdmin',1,''),(228,'2009-02-06 00:58:24',1,25,'8','MySQL',1,''),(229,'2009-02-06 00:59:04',1,25,'9','Python',1,''),(230,'2009-02-06 00:59:13',1,25,'10','Ruby',1,''),(231,'2009-02-06 00:59:21',1,25,'11','Ruby on Rails',1,''),(232,'2009-02-06 00:59:28',1,25,'12','Perl',1,''),(233,'2009-02-06 00:59:54',1,25,'13','24/7 Phone Support',1,''),(234,'2009-02-06 01:00:09',1,25,'14','24/7 Online Support',1,''),(235,'2009-02-06 01:00:21',1,25,'15','24/7 E-mail Support',1,''),(236,'2009-02-06 01:00:45',1,25,'16','Backups',1,''),(237,'2009-02-06 01:01:01',1,25,'17','Control Panel',1,''),(238,'2009-02-06 01:01:16',1,25,'18','POP3',1,''),(239,'2009-02-06 01:01:22',1,25,'19','IMAP',1,''),(240,'2009-02-06 01:01:29',1,25,'20','Webmail',1,''),(241,'2009-02-06 01:01:38',1,25,'21','SPAM Filter',1,''),(242,'2009-02-06 01:01:47',1,25,'22','Mail Forwarders',1,''),(243,'2009-02-06 01:01:57',1,25,'23','Mail Autoresponders',1,''),(244,'2009-02-06 01:02:20',1,25,'24','$50 Google AdWords Credit',1,''),(245,'2009-02-06 01:02:41',1,25,'25','E-mail',1,''),(246,'2009-02-06 12:11:38',1,25,'26','$25 Google AdWords Credit',1,''),(247,'2009-02-06 12:11:42',1,25,'27','$50 Yahoo! Ad Credit',1,''),(248,'2009-02-06 12:12:25',1,25,'27','$50 Yahoo! Ad Credit',2,'Changed description.'),(249,'2009-02-06 12:12:34',1,25,'28','FTP',1,''),(250,'2009-02-06 12:14:01',1,25,'None','$50 Yahoo! Ad Credit',3,''),(251,'2009-02-06 12:14:05',1,25,'None','$25 Google AdWords Credit',3,''),(252,'2009-02-06 12:14:08',1,25,'None','$50 Google AdWords Credit',3,''),(253,'2009-02-06 12:16:10',1,25,'None','24/7 E-mail Support',3,''),(254,'2009-02-06 12:16:14',1,25,'None','24/7 Online Support',3,''),(255,'2009-02-06 12:16:17',1,25,'None','24/7 Phone Support',3,''),(256,'2009-02-06 12:16:21',1,25,'None','30-day Money Back',3,''),(257,'2009-02-06 12:17:49',1,25,'29','Money Back Guarantee',1,''),(258,'2009-02-06 12:17:56',1,25,'30','Online Support',1,''),(259,'2009-02-06 12:18:01',1,25,'31','Phone Support',1,''),(260,'2009-02-06 12:18:07',1,25,'32','Email Support',1,''),(261,'2009-02-06 12:18:46',1,25,'33','Google AdWords Credit',1,''),(262,'2009-02-06 12:19:41',1,25,'34','Yahoo! Ad Credit',1,''),(263,'2009-02-06 12:19:51',1,25,'35','Microsoft adCenter Credit',1,''),(264,'2009-02-06 12:20:06',1,25,'36','Uptime Guarantee',1,''),(265,'2009-02-06 12:21:09',1,25,'37','Wordpress',1,''),(266,'2009-02-06 12:21:58',1,25,'38','Addon Domains',1,''),(267,'2009-02-06 12:22:03',1,25,'39','Sub-Domains',1,''),(268,'2009-02-06 12:22:34',1,25,'40','Databases',1,''),(269,'2009-02-06 12:25:44',1,25,'None','E-mail',3,''),(270,'2009-02-06 12:25:51',1,25,'41','Email',1,''),(271,'2009-02-06 12:26:18',1,25,'42','Free Domain',1,''),(272,'2009-02-06 12:27:07',1,23,'1','BlueHost',2,'Added feature \"Django (0)\". Added feature \"PHP (1)\". Added feature \"PHPmyAdmin (1)\". Added feature \"MySQL (1)\". Added feature \"Python (0)\". Added feature \"Ruby (0)\". Added feature \"Ruby on Rails (0)\". Added feature \"Perl (1)\". Added feature \"Free Domain (0)\". Added feature \"Backups (0)\". Added feature \"Control Panel (1)\". Added feature \"POP3 (1)\". Added feature \"IMAP (1)\". Added feature \"Webmail (1)\". Added feature \"SPAM Filter (1)\". Added feature \"Mail Forwarders (1)\". Added feature \"Mail Autoresponders (1)\". Added feature \"Addon Domains (1)\". Added feature \"Sub-Domains (1)\". Added feature \"Databases (1)\". Added feature \"FTP (1)\". Added feature \"Email (1)\". Added feature \"Wordpress (0)\". Added feature \"Phone Support (24/7)\". Added feature \"Online Support (24/7)\". Added feature \"Email Support (24/7)\". Added feature \"Money Back Guarantee (30)\". Added feature \"Uptime Guarantee (99.9%)\". Added feature \"Google AdWords Credit (0)\". Added feature \"Yahoo! Ad Credit (0)\". Added feature \"Microsoft adCenter Credit (0)\".'),(273,'2009-02-06 12:27:16',1,23,'1','BlueHost',2,'Changed value for feature \"Microsoft adCenter Credit (1)\".'),(274,'2009-02-06 12:27:24',1,23,'1','BlueHost',2,'Changed value for feature \"Microsoft adCenter Credit (0)\".'),(275,'2009-02-06 15:14:51',1,33,'2','Advertising Credit',1,''),(276,'2009-02-06 15:16:40',1,25,'35','Microsoft adCenter Credit',2,'Changed group and description.'),(277,'2009-02-06 15:21:21',1,33,'1','Advertising Credit',1,''),(278,'2009-02-06 15:21:29',1,25,'35','Microsoft adCenter Credit',2,'Changed group.'),(279,'2009-02-06 15:21:35',1,25,'34','Yahoo! Ad Credit',2,'Changed group and description.'),(280,'2009-02-06 15:21:41',1,33,'2','Scripts',1,''),(281,'2009-02-06 15:21:44',1,25,'37','Wordpress',2,'Changed group and description.'),(282,'2009-02-06 15:22:06',1,25,'5','Django',2,'Changed group and description.'),(283,'2009-02-06 15:22:11',1,25,'11','Ruby on Rails',2,'Changed group and description.'),(284,'2009-02-06 15:22:21',1,33,'3','Languages',1,''),(285,'2009-02-06 15:22:25',1,25,'4','PHP',2,'Changed group and description.'),(286,'2009-02-06 15:22:45',1,25,'12','Perl',2,'Changed group and description.'),(287,'2009-02-06 15:22:50',1,25,'9','Python',2,'Changed group and description.'),(288,'2009-02-06 15:22:54',1,25,'10','Ruby',2,'Changed group and description.'),(289,'2009-02-06 15:23:00',1,33,'4','Services',1,''),(290,'2009-02-06 15:23:04',1,25,'8','MySQL',2,'Changed group and description.'),(291,'2009-02-06 15:23:50',1,33,'5','Customer Service',1,''),(292,'2009-02-06 15:23:53',1,25,'32','Email Support',2,'Changed group and description.'),(293,'2009-02-06 15:24:03',1,25,'30','Online Support',2,'Changed group and description.'),(294,'2009-02-06 15:24:18',1,25,'31','Phone Support',2,'Changed group and description.'),(295,'2009-02-06 15:24:28',1,33,'6','Features',1,''),(296,'2009-02-06 15:24:32',1,25,'38','Addon Domains',2,'Changed group and description.'),(297,'2009-02-06 15:25:24',1,25,'33','Google AdWords Credit',2,'Changed group and description.'),(298,'2009-02-06 15:26:12',1,25,'16','Backups',2,'Changed group and description.'),(299,'2009-02-06 15:26:32',1,25,'17','Control Panel',2,'Changed group and description.'),(300,'2009-02-06 15:26:44',1,25,'40','Databases',2,'Changed group and description.'),(301,'2009-02-06 15:26:56',1,25,'41','Email',2,'Changed group and description.'),(302,'2009-02-06 15:27:10',1,25,'42','Free Domain',2,'Changed group and description.'),(303,'2009-02-06 15:27:33',1,33,'1','Promotions',2,'Changed value.'),(304,'2009-02-06 15:27:41',1,25,'32','Email Support',2,'No fields changed.'),(305,'2009-02-06 15:27:46',1,25,'28','FTP',2,'Changed group and description.'),(306,'2009-02-06 15:27:51',1,25,'19','IMAP',2,'Changed group and description.'),(307,'2009-02-06 15:27:58',1,25,'23','Mail Autoresponders',2,'Changed group and description.'),(308,'2009-02-06 15:28:03',1,25,'22','Mail Forwarders',2,'Changed group and description.'),(309,'2009-02-06 15:28:13',1,25,'7','PHPmyAdmin',2,'Changed group and description.'),(310,'2009-02-06 15:28:21',1,25,'18','POP3',2,'Changed group and description.'),(311,'2009-02-06 15:28:27',1,25,'21','SPAM Filter',2,'Changed group and description.'),(312,'2009-02-06 15:28:31',1,25,'39','Sub-Domains',2,'Changed group and description.'),(313,'2009-02-06 15:28:36',1,25,'36','Uptime Guarantee',2,'Changed group and description.'),(314,'2009-02-06 15:28:43',1,25,'20','Webmail',2,'Changed group and description.'),(315,'2009-02-06 15:31:54',1,25,'17','Control Panel',2,'Changed group.'),(316,'2009-02-07 19:45:51',1,26,'4','/news.html - News',2,'Changed text.'),(323,'2009-02-15 21:47:31',1,23,'193','HostRocket',2,'Added feature \"Django (1)\". Added feature \"PHP (1)\". Added feature \"PHPmyAdmin (1)\". Added feature \"MySQL (1)\". Added feature \"Python (0)\". Added feature \"Ruby (0)\". Added feature \"Ruby on Rails (0)\". Added feature \"Perl (1)\". Added feature \"Free Domain (0)\". Added feature \"Backups (0)\". Added feature \"Control Panel (1)\". Added feature \"POP3 (1)\". Added feature \"IMAP (1)\". Added feature \"Webmail (1)\". Added feature \"SPAM Filter (1)\". Added feature \"Mail Forwarders (1)\". Added feature \"Mail Autoresponders (1)\". Added feature \"Addon Domains (1)\". Added feature \"Sub-Domains (1)\". Added feature \"Databases (1)\". Added feature \"FTP (1)\". Added feature \"Email (1)\". Added feature \"Wordpress (0)\". Added feature \"Phone Support (24/7)\". Added feature \"Online Support (24/7)\". Added feature \"Email Support (24/7)\". Added feature \"Money Back Guarantee (30)\". Added feature \"Uptime Guarantee (99.9%)\". Added feature \"Google AdWords Credit (0)\". Added feature \"Yahoo! Ad Credit (0)\". Added feature \"Microsoft adCenter Credit (0)\".'),(320,'2009-02-09 00:34:29',1,30,'5','(HostRocket) This is the most amazing host ever!',1,''),(321,'2009-02-09 00:34:48',1,30,'6','(HostRocket) Wow, simply amazing!',1,''),(324,'2009-02-15 21:52:17',1,25,'38','Addon Domains',2,'Changed group.'),(325,'2009-02-15 21:52:22',1,25,'16','Backups',2,'Changed group.'),(326,'2009-02-15 21:53:48',1,25,'2','Bandwidth',2,'Changed group and priority.'),(327,'2009-02-15 21:54:07',1,25,'17','Control Panel',2,'Changed group and priority.'),(328,'2009-02-15 21:54:34',1,25,'5','Django',2,'No fields changed.'),(329,'2009-02-15 21:54:50',1,25,'5','Django',2,'Changed group.'),(330,'2009-02-15 21:54:58',1,25,'41','Email',2,'Changed group.'),(331,'2009-02-15 21:55:03',1,25,'42','Free Domain',2,'Changed group.'),(332,'2009-02-15 21:55:10',1,25,'28','FTP',2,'Changed group.'),(333,'2009-02-15 21:55:17',1,25,'33','Google AdWords Credit',2,'Changed group.'),(334,'2009-02-15 21:55:29',1,25,'19','IMAP',2,'Changed group.'),(335,'2009-02-15 21:55:37',1,25,'23','Mail Autoresponders',2,'Changed group.'),(336,'2009-02-15 21:55:41',1,25,'22','Mail Forwarders',2,'Changed group.'),(337,'2009-02-15 21:56:11',1,25,'40','Databases',2,'Changed group.'),(338,'2009-02-15 21:56:16',1,25,'32','Email Support',2,'Changed group.'),(339,'2009-02-15 21:56:19',1,25,'35','Microsoft adCenter Credit',2,'Changed group.'),(340,'2009-02-15 21:56:25',1,25,'29','Money Back Guarantee',2,'Changed group and description.'),(341,'2009-02-15 21:56:30',1,25,'8','MySQL',2,'Changed group.'),(342,'2009-02-15 21:56:37',1,25,'30','Online Support',2,'Changed group.'),(343,'2009-02-15 21:56:44',1,25,'12','Perl',2,'Changed group.'),(344,'2009-02-15 21:56:48',1,25,'31','Phone Support',2,'Changed group.'),(345,'2009-02-15 21:56:53',1,25,'4','PHP',2,'Changed group.'),(346,'2009-02-15 21:56:58',1,25,'7','PHPmyAdmin',2,'Changed group.'),(347,'2009-02-15 21:57:04',1,25,'18','POP3',2,'Changed group.'),(348,'2009-02-15 21:57:15',1,25,'1','Price',2,'Changed group and priority.'),(349,'2009-02-15 21:57:25',1,25,'5','Django',2,'Changed group.'),(350,'2009-02-15 21:57:29',1,25,'9','Python',2,'Changed group.'),(351,'2009-02-15 21:57:33',1,25,'10','Ruby',2,'Changed group.'),(352,'2009-02-15 21:57:40',1,25,'11','Ruby on Rails',2,'Changed group.'),(353,'2009-02-15 21:57:47',1,25,'3','Space',2,'Changed group and priority.'),(354,'2009-02-15 21:57:53',1,25,'21','SPAM Filter',2,'Changed group.'),(355,'2009-02-15 21:57:59',1,25,'39','Sub-Domains',2,'Changed group.'),(356,'2009-02-15 21:58:05',1,25,'20','Webmail',2,'Changed group.'),(357,'2009-02-15 21:58:09',1,25,'36','Uptime Guarantee',2,'Changed group.'),(358,'2009-02-15 21:58:16',1,25,'37','Wordpress',2,'Changed group.'),(359,'2009-02-15 21:58:22',1,25,'34','Yahoo! Ad Credit',2,'Changed group.'),(360,'2009-02-15 21:59:17',1,25,'16','Backups',2,'Changed group.'),(361,'2009-02-15 22:28:43',1,33,'1','Promotions',2,'Changed priority.'),(362,'2009-02-15 23:28:52',1,33,'6','Features',2,'Changed show.'),(363,'2009-02-15 23:28:57',1,33,'1','Promotions',2,'Changed show.'),(364,'2009-02-15 23:41:43',1,25,'2','Bandwidth',2,'Changed description and show.'),(365,'2009-02-15 23:41:47',1,25,'1','Price',2,'Changed description and show.'),(366,'2009-02-15 23:41:51',1,25,'3','Space',2,'Changed description and show.'),(367,'2009-02-15 23:51:39',1,25,'29','Money Back Guarantee',2,'Changed show.'),(368,'2009-02-15 23:51:42',1,25,'36','Uptime Guarantee',2,'Changed show.');
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'category','catalog','category'),(11,'tag','tagging','tag'),(12,'tagged item','tagging','taggeditem'),(25,'feature type','catalog','featuretype'),(17,'comment','catalog','comment'),(20,'rating type','catalog','ratingtype'),(18,'rating','catalog','rating'),(21,'karma','catalog','karma'),(24,'feature','catalog','feature'),(23,'host','catalog','host'),(26,'page','main','page'),(27,'email','main','email'),(28,'entry','main','entry'),(29,'rank time','catalog','ranktime'),(30,'quote','catalog','quote'),(31,'hit','catalog','hit'),(32,'faq','main','faq'),(33,'feature group','catalog','featuregroup'),(36,'summary','catalog','summary');
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
INSERT INTO `django_session` VALUES ('a8188eb31d18b3dc32260a2669862542','gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1MjliYjBkMDdlMDYwNWI3MGMzYTYwZjFl\nNDBmNTJm\n','2009-01-06 00:05:43'),('0d1d2804d2fa3262e51c3d0a33f2bf6b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-27 19:44:10'),('3179387b8d2426917dbcf8a8c29d40d5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-28 16:02:52'),('d16c81afc06aa3268896c7cd52d55599','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-28 22:05:20'),('3b2fd49105ec05d0019ef034da238a15','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-04 17:05:20'),('116d2a892c753c788595a3a17b2eb9fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-05 23:53:49'),('37393cde8a2139352b30d6c9ba9d1cde','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-06 23:57:16'),('384c22b42894d2175a1af2d893870110','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-17 02:20:19'),('42e01c9ab06500500fe49710bfe24b92','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-13 02:34:22'),('56e25dbe3485a3a421a1cf6de96c6921','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-20 20:25:16'),('e82a11f4c851babc0108b0cef615f09c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-20 21:33:22'),('aa063dcf7341751437b64644d0545c6f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 16:09:43'),('5c65d1f78c5454fd48f8a990cd21310d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 17:46:24'),('939bcdadb0102df7c4786d966347cb83','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 22:38:12'),('7fc5150f09ee93f58fe8e7fa47b895d3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-24 23:17:11'),('fff273b37f0453d8aa844b2ae83160e2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-24 23:27:45'),('cd0a3f9e8ee2a967b52a9ae60d319ec5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-25 01:53:47'),('f4e6d9bc191c2ebb005a515e051149a1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS5lNTliYTY5YjEwYzQwMmUyZWRi\nNGM1NmVhZTA3Y2E2ZA==\n','2009-01-25 14:29:14'),('d1edb9e3d8497f9fc4b1e2bfd7267ad4','gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1MjliYjBkMDdlMDYwNWI3MGMzYTYwZjFl\nNDBmNTJm\n','2009-01-26 01:27:57'),('c823dee1db1144a5c17403644be757e2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-27 00:43:12'),('82918f283d38729874d3a2cbcc86fdd0','gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1MjliYjBkMDdlMDYwNWI3MGMzYTYwZjFl\nNDBmNTJm\n','2009-01-28 23:29:35'),('6baab67d51cbe633ae9a695566119087','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-28 23:56:24'),('9e2b6b86f483ffb5f28f33e74cb56ba6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-02-03 01:18:25'),('5b92dea9846fd73cbee7a35eb8641d12','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-02-13 18:48:35');
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

--
-- Table structure for table `main_email`
--

DROP TABLE IF EXISTS `main_email`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_email`
--

LOCK TABLES `main_email` WRITE;
/*!40000 ALTER TABLE `main_email` DISABLE KEYS */;
INSERT INTO `main_email` VALUES (1,'bjasper@gmail.com','127.0.0.1',1),(2,'cindyloo@heyhey.com','127.0.0.1',1),(3,'blah@blah.com','127.0.0.1',1);
/*!40000 ALTER TABLE `main_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_entry`
--

DROP TABLE IF EXISTS `main_entry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `main_entry_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_entry`
--

LOCK TABLES `main_entry` WRITE;
/*!40000 ALTER TABLE `main_entry` DISABLE KEYS */;
INSERT INTO `main_entry` VALUES (3,'Hosting Choice: First Week In',1,'hosting-choice-first-week-in','Hosting Choice is into its first week and its been a great one. We\'ve gotten lots of hosts and reviews submitted to our catalog.\r\n\r\nHere\'s a current breakdown of our top 10:\r\n\r\n1. <a href=\"http://hosting-choice.com/host/lunarpages.html\">Lunarpages Review</a>\r\n2. <a href=\"http://hosting-choice.com/host/host-gator.html\">Host Gator Review</a>\r\n3. <a href=\"http://hosting-choice.com/host/justhost.html\">JustHost Review</a>\r\n4. <a href=\"http://hosting-choice.com/host/godaddy.html\">GoDaddy Review</a>\r\n5. <a href=\"http://hosting-choice.com/host/web-hosting-pad.html\">Web Hosting Pad Review</a>\r\n6. <a href=\"http://hosting-choice.com/host/ipower.html\">IPOWER Review</a>\r\n7. <a href=\"http://hosting-choice.com/host/fatcow.html\">FatCow Review</a>\r\n8. <a href=\"http://hosting-choice.com/host/yahoo.html\">Yahoo! Review</a>\r\n9. <a href=\"http://hosting-choice.com/host/bluehost.html\">BlueHost Review</a>\r\n10. <a href=\"http://hosting-choice.com/host/startlogic.html\">StartLogic Review</a>   ','2009-01-19 20:38:41');
/*!40000 ALTER TABLE `main_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_faq`
--

DROP TABLE IF EXISTS `main_faq`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_faq`
--

LOCK TABLES `main_faq` WRITE;
/*!40000 ALTER TABLE `main_faq` DISABLE KEYS */;
INSERT INTO `main_faq` VALUES (1,'How much space or bandwidth do I need?','The answer is probably not as much as you think. Most hosts these days offer unlimited bandwidth and space on small shared-hosting plans. Most sites fit into these categories which is why hosts are able to offer it at such a cheap price.',0),(2,'What\'s the catch with Unlimited bandwidth or space?','Hosts are able to offer unlimited plans because most sites barely use any bandwidth or space. They can also do this because they have strict Terms of Service (TOS) policies. These generally disallow file sharing, hosting, streaming or otherwise resource intensive services.',0),(3,'Which host is the best host for me?','There\'s no perfect host for everyone. That\'s why we offer a selection of the best. You can find hosts by their overall rating and then find out more by reading reviews and ratings. We suggest reading the customer reviews before selecting a host to find out what other customers have to say.',0);
/*!40000 ALTER TABLE `main_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_page`
--

DROP TABLE IF EXISTS `main_page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_page`
--

LOCK TABLES `main_page` WRITE;
/*!40000 ALTER TABLE `main_page` DISABLE KEYS */;
INSERT INTO `main_page` VALUES (1,'About Us','about','<p>Hosting Choice helps you find a quality host at a good price. There are too many hosts to choose from. Let Hosting Choice help. We\'ll sort through the confusion and recommend our favorite picks.</p>\r\n\r\n<p>You can contact the owner of this site at <img src=\"/images/email.png\" /></p>'),(2,'Submit A Host','submit','To submit a host please send an e-mail to the following address: <img src=\"/images/email.png\" />.'),(3,'FAQ','faq','<p>Below is a list of frequently asked questions about finding web hosting.</p>\r\n\r\n<ul class=\"normal\">\r\n<li><a href=\"#faq1\">How much space or bandwidth do I need?</a></li>\r\n<li><a href=\"#faq2\">What\'s the catch with Unlimited bandwidth or space?</a></li>\r\n<li><a href=\"#faq3\">Which host is the best host for me?</a></li>\r\n<li><a href=\"#faq4\">If I have experience with one of these hosts can I add a review?</a></li>\r\n<li><a href=\"#faq5\">My host isn\'t listed. Can I add them?</a></li>\r\n<li><a href=\"#faq6\"></a></li>\r\n</ul>\r\n\r\n<a name=\"faq1\"></a>\r\n<h2>How much space or bandwidth do I need?</h2>\r\n<p>The answer is probably not as much as you think. Most hosts these days offer unlimited bandwidth and space on small shared-hosting plans. Most sites fit into these categories which is why hosts are able to offer it at such a cheap price.</p>\r\n\r\n<a name=\"faq2\"></a>\r\n<h2>What\'s the catch with Unlimited bandwidth or space?</h2>\r\n<p>Hosts are able to offer unlimited plans because most sites barely use any bandwidth or space. They can also do this because they have strict Terms of Service (TOS) policies. These generally disallow file sharing, hosting, streaming or otherwise resource intensive services.</p>\r\n\r\n<a name=\"faq3\"></a>\r\n<h2>Which host is the best host for me?</h2>\r\n<p>There\'s no perfect host for everyone. That\'s why we offer a selection of the best. You can find hosts by their overall rating and then find out more by reading reviews and ratings. We suggest reading the customer reviews before selecting a host to find out what other customers have to say.</p>\r\n\r\n<a name=\"faq4\"></a>\r\n<h2>If I have experience with one of these hosts can I add a review?</h2>\r\n<p>Absolutely, and we hope you do. By sharing your experience you help others make better decisions. You can also help your host. A positive review sends their ranking up, which sends them more customers. But be careful, a negative review can have the opposite effect.</p>\r\n\r\n<a name=\"faq5\"></a>\r\n<h2>My host isn\'t listed. Can I add them?</h2>\r\n<p>Yes, if you want to submit your host and write the first review we\'d love to have them. Visit the <a href=\"/submit.html\">Submit A Host</a> page.</p>\r\n\r\n\r\n'),(4,'News','news','## This is the header ##\r\n\r\nThis is a paragraph\r\n\r\nThis is _some_ *more* **text**!\r\n\r\n<a href=\"/test.html\">Boom</a>');
/*!40000 ALTER TABLE `main_page` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-02-16  7:13:35
