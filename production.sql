-- MySQL dump 10.11
--
-- Host: localhost    Database: hostingchoice
-- ------------------------------------------------------
-- Server version	5.0.51a-3ubuntu5.4

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
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
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
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(31,'Can add tag',11,'add_tag'),(32,'Can change tag',11,'change_tag'),(33,'Can delete tag',11,'delete_tag'),(34,'Can add tagged item',12,'add_taggeditem'),(35,'Can change tagged item',12,'change_taggeditem'),(36,'Can delete tagged item',12,'delete_taggeditem'),(75,'Can delete feature type',25,'delete_featuretype'),(72,'Can delete feature',24,'delete_feature'),(73,'Can add feature type',25,'add_featuretype'),(74,'Can change feature type',25,'change_featuretype'),(50,'Can change comment',17,'change_comment'),(49,'Can add comment',17,'add_comment'),(59,'Can change rating type',20,'change_ratingtype'),(58,'Can add rating type',20,'add_ratingtype'),(51,'Can delete comment',17,'delete_comment'),(52,'Can add rating',18,'add_rating'),(53,'Can change rating',18,'change_rating'),(54,'Can delete rating',18,'delete_rating'),(63,'Can delete karma',21,'delete_karma'),(62,'Can change karma',21,'change_karma'),(61,'Can add karma',21,'add_karma'),(60,'Can delete rating type',20,'delete_ratingtype'),(71,'Can change feature',24,'change_feature'),(70,'Can add feature',24,'add_feature'),(67,'Can add host',23,'add_host'),(68,'Can change host',23,'change_host'),(69,'Can delete host',23,'delete_host'),(76,'Can add page',26,'add_page'),(77,'Can change page',26,'change_page'),(78,'Can delete page',26,'delete_page');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
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
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'Brad','','','bjasper@gmail.com','sha1$f98c5$66d7afb774b8a9b08bf7fa025ee5ee5cb13f7537',1,1,1,'2009-01-11 01:53:47','2008-12-13 19:15:44');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `parent_id` int(11) default NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
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
  `id` int(11) NOT NULL auto_increment,
  `host_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `active` int(11) NOT NULL default '1',
  `ip` varchar(25) default NULL,
  PRIMARY KEY  (`id`),
  KEY `catalog_comment_host_id` (`host_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2655 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_comment`
--

LOCK TABLES `catalog_comment` WRITE;
/*!40000 ALTER TABLE `catalog_comment` DISABLE KEYS */;
INSERT INTO `catalog_comment` VALUES (98,1,'test','2009-01-06 20:22:29','','','',-1,NULL),(143,1,'This is an awesome host. I seriously love them!','2009-01-06 20:42:49','Brad','bjasper@gmail.com','',-1,NULL),(142,1,'I love this hosting company. Seriously rocks!','2009-01-06 20:42:49','Brad','bjasper@gmail.com','',-1,NULL),(144,1,'They totally suck. Like really. Suckage!','2009-01-06 20:42:49','Mike','mike@mike.com','',-1,NULL),(145,1,'This is awesome!','2009-01-06 21:52:43','Brad','bjasper@gmail.com','',-1,NULL),(146,1,'sdfssdfsdf','2009-01-06 21:52:43','Boob','blbo@sdf.com','',-1,NULL),(303,1,'Hey hey hey!','2009-01-06 23:29:43','Jezeba','bjasper@gmail.com','',-1,'127.0.0.1'),(304,1,'This host is awesome!','2009-01-06 23:29:43','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(305,1,'Boom Yeah!','2009-01-06 23:29:43','Jezeba','jez@ba.com','',-1,'127.0.0.1'),(334,1,'I hate them and I\'m pissed!','2009-01-06 23:39:07','PissedOff','pissed@gmail.com','',-1,'127.0.0.1'),(2654,1,'Test','2009-01-11 14:17:24','Brad','bjasper@gmail.com','',1,'127.0.0.1'),(2653,1,'This host sucks!','2009-01-11 14:17:03','Santa','santa@northpole.com','',1,'127.0.0.1'),(2647,1,'This is a terrible host!','2009-01-09 20:59:33','Bradley','bjasper@gmail.com','http://google.com/',-1,'127.0.0.1'),(2652,1,'Good Site, Easy to Use','2009-01-11 14:16:35','EJ','JasperEdwardJ@JohnDeere.com','',-1,'127.0.0.1'),(2645,1,'This website is terrible!','2009-01-09 18:16:03','Jezeba','bradley@boom.com','',-1,'127.0.0.1'),(2651,1,'Great host!','2009-01-11 14:16:35','Laura','lolajasper@gmail.com','',1,'127.0.0.1'),(2649,1,'i have never been so turned on by one basic looking website. change the pea green and i will buy it for one million dollars','2009-01-09 22:37:14','bradley','bjasper@gmail.com','',-1,'127.0.0.1'),(2650,1,'Boom Boom Boom','2009-01-11 02:19:02','Daisy Duke','bjasper@gmail.com','',-1,'127.0.0.1');
/*!40000 ALTER TABLE `catalog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_feature`
--

DROP TABLE IF EXISTS `catalog_feature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_feature` (
  `id` int(11) NOT NULL auto_increment,
  `host_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catalog_feature_host_id` (`host_id`),
  KEY `catalog_feature_name_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_feature`
--

LOCK TABLES `catalog_feature` WRITE;
/*!40000 ALTER TABLE `catalog_feature` DISABLE KEYS */;
INSERT INTO `catalog_feature` VALUES (1,1,1,'7.95'),(2,1,2,'0'),(3,1,3,'0'),(19,195,3,'0'),(18,195,2,'0'),(17,195,1,'4.95'),(8,192,1,'5.95'),(9,192,2,'0'),(10,192,3,'0'),(11,193,1,'6.99'),(12,193,2,'0'),(13,193,3,'0'),(14,194,1,'5.95'),(15,194,2,'0'),(16,194,3,'0'),(20,196,1,'6.95'),(21,196,2,'0'),(22,196,3,'0'),(23,197,1,'8.96'),(24,197,2,'0'),(25,197,3,'0'),(26,198,1,'4.74'),(27,198,2,'300000'),(28,198,3,'10000'),(29,199,1,'4.95'),(30,199,2,'15000000'),(31,199,3,'1500000'),(32,200,1,'6.95'),(33,200,2,'0'),(34,200,3,'0'),(35,201,1,'3.88'),(36,201,2,'15000000'),(37,201,3,'1500000'),(38,202,1,'6.95'),(39,202,2,'15000000'),(40,202,3,'1500000'),(41,203,1,'4.95'),(42,203,2,'60000000'),(43,203,3,'600000000'),(44,204,1,'5.95'),(45,204,2,'0'),(46,204,3,'0'),(47,205,1,'6.50'),(48,205,2,'15000000'),(49,205,3,'1500000'),(50,206,1,'4.95'),(51,206,2,'0'),(52,206,3,'0');
/*!40000 ALTER TABLE `catalog_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_featuretype`
--

DROP TABLE IF EXISTS `catalog_featuretype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_featuretype` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `suffix` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_featuretype`
--

LOCK TABLES `catalog_featuretype` WRITE;
/*!40000 ALTER TABLE `catalog_featuretype` DISABLE KEYS */;
INSERT INTO `catalog_featuretype` VALUES (1,'Price','$','/per month'),(2,'Bandwidth','','MB'),(3,'Space','','MB');
/*!40000 ALTER TABLE `catalog_featuretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_host`
--

DROP TABLE IF EXISTS `catalog_host`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_host` (
  `id` int(11) NOT NULL auto_increment,
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
  PRIMARY KEY  (`id`),
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
INSERT INTO `catalog_host` VALUES (1,1,1,'BlueHost','bluehost','BlueHost has been providing hosting solutions to thousands of business and personal web sites since 1996. Our internet hosting package helps businesses and individuals get high-powered service at a fraction of the cost.','http://www.tkqlhce.com/click-3316503-10376736',0,0,'',0,1,'hosts/Picture_7.png',0),(195,1,1,'HostingPad','hostingpad','Webhostingpad.com was formed in 2005 with a team of very successful and proven industry veterans intent on delivering the best value in web hosting. With the growing need for affordable hosting, the company set out to deliver the best web hosting at a price where everyone can afford to have their piece of the world wide web. Webhostingpad.com remains committed to delivering the best value in Internet hosting by providing a safe, reliable and efficient process to create an Internet presence, all with a price structure driven by value.','http://www.webhostingpad.com/2838.html',0,0,'',0,1,'hosts/Picture_5.png',0),(192,1,1,'HostMonster','hostmonster','HostMonster has been providing hosting solutions to thousands of business and personal web sites since 1996. Our internet hosting package helps businesses and individuals get high-powered service at a fraction of the cost.','http://www.hostmonster.com/track/jasber/hc',0,0,'',0,1,'hosts/Picture_1___.png',0),(193,1,1,'HostRocket','hostrocket','HostRocket offers reliable, affordable dedicated and shared web hosting for both professional and personal websites. We provide cheap, secure domain hosting packages ranging from very basic, shared hosting to high bandwidth and high storage dedicated hosting.','http://affiliatecenter.hostrocket.com//idevaffiliate.php?id=5148',0,0,'',0,1,'hosts/Picture_2.png',0),(194,1,1,'JustHost','justhost','Just Host are dedicated to providing their customers with the most reliable web hosting service possible.\r\nAffordable price plans, secure servers, first class 24/7 technical support and a wide range of features\r\nmake hosting your website with Just Host the obvious choice.','http://www.kqzyfj.com/click-3316503-10589817',0,0,'',0,1,'hosts/Picture_3.png',0),(196,1,1,'Host Papa','host-papa','At HostPapa, we consider every one of our customers to be a part of our family. That\'s why our motto is \"Let Papa take care of you\".\r\n\r\nWe understand that our customers\' web sites are important and that they need to be able to count on us to ensure that their service is not interrupted.\r\n\r\nWe have established a solid foundation to offer a hosting solution for small-to-medium sized businesses that is reliable, easy-to-use, and customer service-oriented, all for a low cost.','http://hostpapa.com/cgi-bin/affiliates/clickthru.cgi?id=Jasber',0,0,'',0,1,'hosts/supportsuite.gif',0),(197,1,1,'Yahoo!','yahoo','Yahoo! is committed to making your online business a success. To prove we offer the best web hosting plan, we are pleased to offer our 30-Day Satisfaction Guarantee!\r\nIf you\'re not completely happy with your service within 30 days of ordering Yahoo! Web Hosting, we\'ll refund your hosting fee.','http://www.anrdoezrs.net/click-3316503-10492621',0,0,'',1,1,'hosts/y3.gif',0),(198,1,1,'GoDaddy','godaddy','GoDaddy.com hosting plans are ideal for most individuals and small businesses. We\'re the affordable, reliable place to host your site, offering features like a 99.9% network uptime commitment and 24/7 support.','http://www.tkqlhce.com/click-3316503-10378494',0,0,'',0,1,'hosts/10382133.gif.jpeg',0),(199,1,1,'IPOWER','ipower','IPOWER, Inc., founded in October 2001, provides web hosting and web services for small- and medium-sized businesses worldwide looking to build, manage, promote and profit from an online presence. The company, which offers domain registration, web site hosting, e-commerce tools, merchant services, application hosting, online marketing, site optimization services, and web site design, is also famous for the speed and effectiveness of its customer support.','http://www.jdoqocy.com/click-3316503-10398311',0,0,'',0,1,'hosts/Picture_6.png',0),(200,1,1,'Host Gator','host-gator','HostGator.com, LLC is a world leading provider of shared, reseller, and dedicated web hosting. Privately held and based in Houston, Texas, the company was founded in 2002 by current President and CEO Brent Oxley, who started the company from his dorm room at Florida Atlantic University. Since then, HostGator has grown from a small hosting company with just three servers into a world leading and industry recognized hosting provider with more than 5,000 servers under management. The over one million domains hosted by HostGator make up approximately 1% of the world\'s Internet traffic.','http://www.dpbolvw.net/click-3316503-10410811',0,0,'',0,1,'hosts/10414006.gif',0),(201,1,1,'PowWeb','powweb','Since 1999, PowWeb has offered a low-cost, feature-rich Web hosting platform that appeals to a broad spectrum of users. Our all-inclusive “One Plan” takes the hassle out of finding the perfect hosting solution. Whether customers are small business owners or are running a state-of-the-art Web 2.0 application site, PowWeb provides the uptime and features they’ll need.','http://www.anrdoezrs.net/click-3316503-10394288',0,0,'',0,1,'hosts/10315183.gif',0),(202,1,1,'Lunarpages','lunarpages','There are thousands of web hosting services so why choose Lunarpages? When comparing web hosts it is important not only to consider a price difference of a dollar or two. Although we offer more data transfer and storage resources then you will likely ever utilize, we prefer to focus on something much more important, reliable web hosting and great customer service. Above all we take care of you personally and attentively with 24-7 award winning customer support. It\'s all about making sure your website and email remain online and you are happy. It\'s not just technical support to us; it\'s about caring for people since 1998. Phone us any time and become part of the rapidly growing Lunarpages web hosting family. We are rated #1 in the world. Call us now and find out why.\r\n','http://www.anrdoezrs.net/click-3316503-8242916',0,0,'',0,1,'hosts/logo2.png',0),(203,1,1,'StartLogic','startlogic','StartLogic is a leading provider of Web-hosting solutions and services for global business. Across the globe, businesses depend on StartLogic\'s easy-to-use, advanced and reliable load-balanced architecture, as well as responsive and knowledgable customer service to power their online presence.\r\n\r\nStartLogic offers a full line of solutions for personal, business, government and education customers.','http://www.anrdoezrs.net/click-3316503-10387606',0,0,'',0,1,'hosts/startlogic_logo.gif',0),(204,1,1,'IX Web Hosting','ix-web-hosting','Reliability and support are major factors when considering a hosting provider. That’s why IX Web Hosting has just built a state-of-the-art Data Center, capable of storing up to 10,000 web servers! IX Web Hosting also provides a full team of round-the clock technicians and a separate Call Center also offering 24/7 customer support. IX offers three plans to fit all features and pricing needs.','http://www.kqzyfj.com/click-3316503-10394256',0,0,'',0,1,'hosts/header_logo.gif',0),(205,1,1,'FatCow','fatcow','FatCow was born in 1998 and the rest is history. We\'ve grown our company with a dedicated group of talented believers in the notion that simple, old fashioned service and value still ring true. FatCow has focused our entire company on delivering the best value and customer service experience in Web hosting to the small business user. We make every effort to make our services easy to own, easy to use and most importantly to provide real business value. And yes, we like to have fun doing it.','http://www.jdoqocy.com/click-3316503-10492159',0,0,'',0,1,'hosts/10443943.gif',0),(206,1,1,'Web Hosting Pad','web-hosting-pad','Webhostingpad.com was formed in 2005 with a team of very successful and proven industry veterans intent on delivering the best value in web hosting. With the growing need for affordable hosting, the company set out to deliver the best web hosting at a price where everyone can afford to have their piece of the world wide web. Webhostingpad.com remains committed to delivering the best value in Internet hosting by providing a safe, reliable and efficient process to create an Internet presence, all with a price structure driven by value.','http://www.kqzyfj.com/click-3316503-10555752',0,0,'',0,1,'hosts/Picture_8.png',0);
/*!40000 ALTER TABLE `catalog_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_karma`
--

DROP TABLE IF EXISTS `catalog_karma`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_karma` (
  `id` int(11) NOT NULL auto_increment,
  `comment_id` int(11) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `comment_id` (`comment_id`,`ip`),
  KEY `catalog_karma_comment_id` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=322 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_karma`
--

LOCK TABLES `catalog_karma` WRITE;
/*!40000 ALTER TABLE `catalog_karma` DISABLE KEYS */;
INSERT INTO `catalog_karma` VALUES (147,144,'127.0.0.1',1),(148,143,'127.0.0.1',1),(240,304,'127.0.0.1',1),(316,304,'12.217.117.143',1),(321,2654,'127.0.0.1',1),(320,2651,'127.0.0.1',1),(319,2650,'127.0.0.1',1);
/*!40000 ALTER TABLE `catalog_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rating`
--

DROP TABLE IF EXISTS `catalog_rating`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_rating` (
  `id` int(11) NOT NULL auto_increment,
  `comment_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `value` double unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catalog_rating_comment_id` (`comment_id`),
  KEY `catalog_rating_type_id` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8102 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_rating`
--

LOCK TABLES `catalog_rating` WRITE;
/*!40000 ALTER TABLE `catalog_rating` DISABLE KEYS */;
INSERT INTO `catalog_rating` VALUES (1060,304,4,5),(1061,304,6,0),(1062,304,5,0),(1063,305,4,0),(1064,305,6,1),(1065,305,5,5),(1141,334,6,1),(1140,334,4,1),(1142,334,5,1),(8101,2654,5,3),(8100,2654,6,3),(8099,2654,4,3),(8098,2653,5,1),(8097,2653,6,1),(8096,2653,4,1),(8095,2652,5,4),(8094,2652,6,4),(8093,2652,4,5),(8074,2645,5,5),(8073,2645,6,5),(8072,2645,4,5),(8078,2647,4,1),(8079,2647,6,0),(8080,2647,5,0),(8092,2651,5,5),(8091,2651,6,5),(8090,2651,4,5),(8084,2649,4,2),(8085,2649,6,2),(8086,2649,5,2),(8087,2650,4,5),(8088,2650,6,4),(8089,2650,5,4);
/*!40000 ALTER TABLE `catalog_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_ratingtype`
--

DROP TABLE IF EXISTS `catalog_ratingtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `catalog_ratingtype` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `limit` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
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
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2008-12-13 19:48:41',1,9,'1','Computers',1,''),(2,'2008-12-13 19:48:57',1,9,'2','Internet',1,''),(113,'2009-01-03 02:26:51',1,20,'2','Support',1,''),(112,'2009-01-03 02:26:38',1,18,'1','Features (4/5)',1,''),(6,'2008-12-13 20:47:54',1,9,'1','Accounting',1,''),(7,'2008-12-13 20:54:11',1,9,'1','Accounting',1,''),(8,'2008-12-13 20:54:37',1,9,'1','Accounting',2,'No fields changed.'),(9,'2008-12-13 20:54:57',1,9,'2','Automotive',1,''),(10,'2008-12-13 20:55:00',1,9,'2','Automotive',2,'No fields changed.'),(11,'2008-12-13 20:55:07',1,9,'3','Business Travel',1,''),(12,'2008-12-13 20:55:13',1,9,'4','Economy',1,''),(13,'2008-12-13 20:55:19',1,9,'5','Education',1,''),(14,'2008-12-13 20:55:26',1,9,'6','Food',1,''),(15,'2008-12-13 20:56:35',1,9,'1','Accounting',1,''),(16,'2008-12-13 20:56:44',1,9,'2','Automotive',1,''),(17,'2008-12-13 20:56:51',1,9,'3','Business Travel',1,''),(18,'2008-12-13 20:56:56',1,9,'4','Economy',1,''),(19,'2008-12-13 20:57:02',1,9,'5','Education',1,''),(20,'2008-12-13 20:57:05',1,9,'6','Food',1,''),(21,'2008-12-13 20:57:10',1,9,'7','Games',1,''),(22,'2008-12-13 20:57:16',1,9,'8','Health Care',1,''),(23,'2008-12-13 20:57:27',1,9,'9','Human Resources',1,''),(24,'2008-12-13 20:57:41',1,9,'10','Technology',1,''),(120,'2009-01-04 16:20:00',1,23,'1','BlueHost',2,'Changed price and image.'),(119,'2009-01-04 16:17:04',1,23,'1','BlueHost',1,''),(27,'2008-12-15 01:29:44',1,9,'1','Business',1,''),(28,'2008-12-15 01:30:05',1,9,'2','Art',1,''),(29,'2008-12-15 01:30:19',1,9,'3','Music',1,''),(31,'2008-12-15 01:31:55',1,9,'5','Startups',1,''),(111,'2009-01-03 02:26:34',1,20,'1','Features',1,''),(110,'2009-01-03 02:26:23',1,17,'1','Idologic is the best. They are the most superb hos',1,''),(117,'2009-01-04 15:56:25',1,9,'1','Shared Hosting',2,'Changed slug.'),(36,'2008-12-15 01:52:46',1,9,'8','Law',1,''),(109,'2009-01-03 02:22:11',1,9,'1','Shared Hosting',1,''),(43,'2008-12-23 00:18:22',1,20,'2','RatingType object',1,''),(42,'2008-12-23 00:18:12',1,20,'1','RatingType object',1,''),(44,'2008-12-23 00:18:38',1,20,'3','RatingType object',1,''),(45,'2008-12-23 00:26:58',1,9,'5','Startups',3,''),(46,'2008-12-23 00:27:02',1,9,'3','Music',3,''),(47,'2008-12-23 00:27:05',1,9,'1','Business',3,''),(48,'2008-12-23 00:27:10',1,9,'2','Art',3,''),(49,'2008-12-23 00:28:38',1,9,'5','Startups',3,''),(50,'2008-12-23 00:28:41',1,9,'3','Music',3,''),(51,'2008-12-23 00:28:45',1,9,'2','Art',3,''),(52,'2008-12-23 00:29:02',1,9,'1','Root',2,'Changed name, slug and parent.'),(53,'2008-12-23 00:29:23',1,9,'8','Shared Hosting',1,''),(116,'2009-01-03 02:27:36',1,18,'3','Uptime (4/5)',1,''),(55,'2008-12-23 00:31:53',1,20,'1','Support',1,''),(56,'2008-12-23 00:32:00',1,18,'1','Support (5)',1,''),(57,'2008-12-23 00:33:42',1,17,'1','I really enjoy using this host!',1,''),(58,'2008-12-23 00:33:51',1,20,'2','Uptime',1,''),(59,'2008-12-23 00:34:06',1,18,'2','Uptime (4/5)',1,''),(60,'2008-12-23 00:34:13',1,20,'3','Features',1,''),(61,'2008-12-23 00:34:19',1,18,'3','Features (2/5)',1,''),(62,'2008-12-23 00:34:22',1,17,'1','I really enjoy using this host!',2,'Changed rating.'),(63,'2008-12-23 01:06:24',1,9,'5','Startups',3,''),(64,'2008-12-23 01:07:38',1,9,'3','Music',3,''),(65,'2008-12-23 01:07:41',1,9,'2','Art',3,''),(66,'2008-12-23 01:07:51',1,9,'1','root',2,'Changed name, slug and parent.'),(67,'2008-12-23 01:08:04',1,9,'8','Shared Hosting',1,''),(115,'2009-01-03 02:27:07',1,20,'3','Uptime',1,''),(69,'2008-12-23 01:09:17',1,20,'1','Support',1,''),(70,'2008-12-23 01:09:21',1,18,'1','Support (5/5)',1,''),(71,'2008-12-23 01:09:28',1,20,'2','Uptime',1,''),(72,'2008-12-23 01:09:30',1,18,'2','Uptime (5/5)',1,''),(73,'2008-12-23 01:09:38',1,20,'3','Features',1,''),(74,'2008-12-23 01:09:42',1,18,'3','Features (4/5)',1,''),(75,'2008-12-23 01:09:52',1,17,'1','I really like this host!',1,''),(76,'2008-12-23 01:33:14',1,9,'8','Shared Hosting',1,''),(78,'2008-12-23 01:36:27',1,20,'1','Features',1,''),(79,'2008-12-23 01:36:29',1,18,'1','Features (5/5)',1,''),(80,'2008-12-23 01:36:36',1,20,'2','Uptime',1,''),(81,'2008-12-23 01:36:37',1,18,'2','Uptime (5/5)',1,''),(82,'2008-12-23 01:36:46',1,20,'3','Support',1,''),(83,'2008-12-23 01:36:47',1,18,'3','Support (4/5)',1,''),(84,'2008-12-23 01:36:51',1,17,'1','I love them!',1,''),(85,'2008-12-23 01:45:34',1,20,'1','Features',1,''),(86,'2008-12-23 01:46:19',1,18,'3','Features (5/5)',1,''),(87,'2008-12-23 01:46:38',1,20,'2','Support',1,''),(88,'2008-12-23 01:46:40',1,18,'4','Support (5/5)',1,''),(89,'2008-12-23 01:46:46',1,20,'3','Uptime',1,''),(90,'2008-12-23 01:46:50',1,18,'5','Uptime (4/5)',1,''),(91,'2008-12-23 01:46:53',1,17,'1','I love them!',2,'Changed rating.'),(92,'2008-12-23 23:57:56',1,9,'8','Shared Hosting',1,''),(114,'2009-01-03 02:26:54',1,18,'2','Support (3/5)',1,''),(94,'2008-12-24 00:07:23',1,20,'1','Uptime',1,''),(95,'2008-12-24 00:07:25',1,18,'1','Uptime (5/5)',1,''),(96,'2008-12-24 00:07:38',1,20,'2','Support',1,''),(97,'2008-12-24 00:07:42',1,18,'2','Support (5/5)',1,''),(98,'2008-12-24 00:07:48',1,20,'3','Features',1,''),(99,'2008-12-24 00:07:50',1,18,'3','Features (5/5)',1,''),(100,'2008-12-24 00:08:12',1,17,'1','',1,''),(101,'2008-12-24 00:11:13',1,17,'1','I really like this host. They\'re awesome!',1,''),(102,'2008-12-24 00:11:21',1,20,'1','Uptime',1,''),(103,'2008-12-24 00:11:25',1,18,'1','Uptime (3/5)',1,''),(104,'2008-12-24 00:11:33',1,20,'2','Features',1,''),(105,'2008-12-24 00:11:37',1,18,'2','Features (4/5)',1,''),(106,'2008-12-24 00:11:46',1,20,'3','Support',1,''),(107,'2008-12-24 00:11:50',1,18,'3','Support (5/5)',1,''),(118,'2009-01-04 16:03:15',1,9,'1','Shared Hosting',1,''),(121,'2009-01-04 16:24:57',1,23,'1','BlueHost',2,'Changed image.'),(122,'2009-01-04 16:30:38',1,17,'1','BlueHost is the best host I\'ve seen in a long time',1,''),(123,'2009-01-04 17:01:45',1,20,'1','Features',1,''),(124,'2009-01-04 17:01:49',1,20,'2','Uptime',1,''),(125,'2009-01-04 17:01:56',1,20,'3','Support',1,''),(126,'2009-01-04 19:38:17',1,18,'283','Features (3/5)',1,''),(127,'2009-01-04 19:38:26',1,18,'284','Uptime (5/5)',1,''),(128,'2009-01-04 19:38:38',1,18,'285','Support (3/5)',1,''),(129,'2009-01-04 20:28:11',1,17,'1','BlueHost is awesome. I can\'t believe I\'ve never tr',1,''),(130,'2009-01-04 20:45:22',1,17,'2','BlueHost sucks. They are always down and they neve',1,''),(131,'2009-01-04 20:45:29',1,18,'286','Features (3/5)',1,''),(132,'2009-01-04 20:45:42',1,18,'287','Uptime (0/5)',1,''),(133,'2009-01-04 20:46:10',1,18,'288','Support (1/5)',1,''),(134,'2009-01-04 22:23:46',1,23,'1','BlueHost',2,'Changed image.'),(135,'2009-01-04 22:24:49',1,23,'1','BlueHost',2,'No fields changed.'),(136,'2009-01-04 22:25:17',1,23,'1','BlueHost',2,'Changed image.'),(137,'2009-01-04 22:26:12',1,23,'1','BlueHost',2,'Changed image.'),(138,'2009-01-05 00:10:19',1,17,'42','I\'ve had a neutral experience. I\'m really undecide',1,''),(139,'2009-01-05 00:11:06',1,17,'43','They\'re OK. Not terrible, but certainly not the be',1,''),(140,'2009-01-05 00:11:19',1,18,'404','Features (4/5)',1,''),(141,'2009-01-05 00:14:37',1,17,'43','They\'re OK. Not terrible, but certainly not the be',2,'Changed active.'),(142,'2009-01-05 01:07:51',1,21,'88','Karma object',1,''),(143,'2009-01-05 01:08:18',1,21,'89','Karma object',1,''),(144,'2009-01-05 01:36:47',1,21,'90','Karma object',1,''),(145,'2009-01-06 20:25:35',1,20,'4','Features',1,''),(146,'2009-01-06 20:25:43',1,20,'5','Support',1,''),(147,'2009-01-06 20:25:46',1,20,'6','Uptime',1,''),(148,'2009-01-06 21:27:09',1,17,'142','I love this hosting company. Seriously rocks!',2,'Changed active.'),(149,'2009-01-06 21:35:13',1,17,'144','They totally suck. Like really. Suckage!',2,'Changed active.'),(150,'2009-01-07 00:24:15',1,23,'140','DreamHost',1,''),(151,'2009-01-07 00:24:55',1,23,'140','InMotion',2,'Changed name, slug and url.'),(152,'2009-01-09 18:04:18',1,25,'1','Price (per month)',1,''),(153,'2009-01-09 18:05:42',1,25,'1','Price (per month)',1,''),(154,'2009-01-09 18:06:39',1,25,'2','Bandwidth (GB)',1,''),(155,'2009-01-09 18:06:54',1,25,'3','Space (MB)',1,''),(156,'2009-01-09 18:07:00',1,23,'1','BlueHost',2,'Added feature \"Price (per month) (9.99)\". Added feature \"Bandwidth (GB) (100)\". Added feature \"Space (MB) (100)\".'),(157,'2009-01-09 18:07:21',1,25,'2','Bandwidth (MB)',2,'Changed units and suffix.'),(158,'2009-01-09 20:59:43',1,23,'140','InMotion',2,'Added feature \"Price (5.99)\". Added feature \"Bandwidth (1024)\". Added feature \"Space (1024)\".'),(159,'2009-01-09 22:38:43',1,23,'191','Idologic',1,''),(160,'2009-01-10 14:25:16',1,23,'None','Idologic',3,''),(161,'2009-01-10 23:17:33',1,26,'1','/about.html - About Us',1,''),(162,'2009-01-10 23:17:54',1,26,'2','/submit.html - Submit A Host',1,''),(163,'2009-01-10 23:28:57',1,9,'1','Shared Hosting',2,'Changed description.'),(164,'2009-01-10 23:29:39',1,9,'1','Shared Hosting',2,'Changed description.'),(165,'2009-01-11 01:49:29',1,23,'192','HostMonster',1,''),(166,'2009-01-11 01:51:31',1,23,'192','HostMonster',2,'Added feature \"Price (5.95)\". Added feature \"Bandwidth (0)\". Added feature \"Space (0)\".'),(167,'2009-01-11 02:01:05',1,23,'193','HostRocket',1,''),(168,'2009-01-11 02:02:54',1,23,'194','JustHost',1,''),(169,'2009-01-11 02:06:07',1,25,'1','Price',2,'Changed suffix.'),(170,'2009-01-11 14:28:40',1,3,'2','troy',1,''),(171,'2009-01-11 14:28:50',1,3,'2','troy',2,'Changed is_superuser.'),(172,'2009-01-11 14:29:02',1,3,'2','troy',2,'Changed is_staff.'),(173,'2009-01-11 14:38:59',1,23,'None','InMotion',3,''),(174,'2009-01-11 14:39:16',1,3,'None','troy',3,''),(175,'2009-01-11 14:41:08',1,23,'1','BlueHost',2,'Changed value for feature \"Price (7.95)\". Changed value for feature \"Bandwidth (0)\". Changed value for feature \"Space (0)\".'),(176,'2009-01-11 15:43:38',1,23,'195','HostingPad',1,''),(177,'2009-01-11 15:46:45',1,23,'196','Host Papa',1,''),(178,'2009-01-11 16:01:00',1,23,'197','Yahoo!',1,''),(179,'2009-01-11 16:10:45',1,23,'198','GoDaddy',1,''),(180,'2009-01-11 16:15:39',1,23,'199','IPOWER',1,''),(181,'2009-01-11 16:20:10',1,23,'200','Host Gator',1,''),(182,'2009-01-11 16:26:38',1,23,'201','PowWeb',1,''),(183,'2009-01-11 16:27:31',1,23,'200','Host Gator',2,'Changed url.'),(184,'2009-01-11 16:28:03',1,23,'199','IPOWER',2,'Changed url.'),(185,'2009-01-11 16:28:50',1,23,'198','GoDaddy',2,'Changed url.'),(186,'2009-01-11 16:32:23',1,23,'1','BlueHost',2,'Changed url and image.'),(187,'2009-01-11 16:33:24',1,23,'200','Host Gator',2,'Changed url.'),(188,'2009-01-11 16:34:42',1,23,'199','IPOWER',2,'Changed url.'),(189,'2009-01-11 16:36:09',1,23,'194','JustHost',2,'Changed url.'),(190,'2009-01-11 16:37:06',1,23,'201','PowWeb',2,'Changed url.'),(191,'2009-01-11 16:37:57',1,23,'197','Yahoo!',2,'Changed url.'),(192,'2009-01-11 16:41:50',1,23,'202','Lunarpages',1,''),(193,'2009-01-11 16:47:17',1,23,'203','StartLogic',1,''),(194,'2009-01-11 16:48:43',1,23,'203','StartLogic',2,'Changed image.'),(195,'2009-01-11 16:55:05',1,23,'204','IX Web Hosting',1,''),(196,'2009-01-11 16:57:34',1,23,'205','FatCow',1,''),(197,'2009-01-11 17:15:53',1,23,'206','Web Hosting Pad',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'category','catalog','category'),(11,'tag','tagging','tag'),(12,'tagged item','tagging','taggeditem'),(25,'feature type','catalog','featuretype'),(17,'comment','catalog','comment'),(20,'rating type','catalog','ratingtype'),(18,'rating','catalog','rating'),(21,'karma','catalog','karma'),(24,'feature','catalog','feature'),(23,'host','catalog','host'),(26,'page','main','page');
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
  PRIMARY KEY  (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a8188eb31d18b3dc32260a2669862542','gAJ9cQFVCnRlc3Rjb29raWVxAlUGd29ya2VkcQNzLjA1MjliYjBkMDdlMDYwNWI3MGMzYTYwZjFl\nNDBmNTJm\n','2009-01-06 00:05:43'),('0d1d2804d2fa3262e51c3d0a33f2bf6b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-27 19:44:10'),('3179387b8d2426917dbcf8a8c29d40d5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-28 16:02:52'),('d16c81afc06aa3268896c7cd52d55599','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2008-12-28 22:05:20'),('3b2fd49105ec05d0019ef034da238a15','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-04 17:05:20'),('116d2a892c753c788595a3a17b2eb9fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-05 23:53:49'),('37393cde8a2139352b30d6c9ba9d1cde','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-06 23:57:16'),('384c22b42894d2175a1af2d893870110','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-17 02:20:19'),('42e01c9ab06500500fe49710bfe24b92','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-13 02:34:22'),('56e25dbe3485a3a421a1cf6de96c6921','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-20 20:25:16'),('e82a11f4c851babc0108b0cef615f09c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-20 21:33:22'),('aa063dcf7341751437b64644d0545c6f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 16:09:43'),('5c65d1f78c5454fd48f8a990cd21310d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 17:46:24'),('939bcdadb0102df7c4786d966347cb83','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-23 22:38:12'),('7fc5150f09ee93f58fe8e7fa47b895d3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-24 23:17:11'),('fff273b37f0453d8aa844b2ae83160e2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-24 23:27:45'),('cd0a3f9e8ee2a967b52a9ae60d319ec5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5hYjU3MTczNWVmZWNlYWJkOGVh\nMjI4ZDI0Mzc1MmFhZg==\n','2009-01-25 01:53:47'),('f4e6d9bc191c2ebb005a515e051149a1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS5lNTliYTY5YjEwYzQwMmUyZWRi\nNGM1NmVhZTA3Y2E2ZA==\n','2009-01-25 14:29:14');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
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
-- Table structure for table `main_page`
--

DROP TABLE IF EXISTS `main_page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `main_page` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `main_page`
--

LOCK TABLES `main_page` WRITE;
/*!40000 ALTER TABLE `main_page` DISABLE KEYS */;
INSERT INTO `main_page` VALUES (1,'About Us','about','<p>Hosting Choice helps you find a quality host at a good price. There are too many hosts to choose from. Let Hosting Choice help. We\'ll sort through the confusion and recommend our favorite picks.</p>\r\n\r\n<p>You can contact the owner of this site at <img src=\"/images/email.png\" /></p>'),(2,'Submit A Host','submit','To submit a host please send an e-mail to the following address: <img src=\"/images/email.png\" />.');
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

-- Dump completed on 2009-01-12  3:54:43
