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
INSERT INTO `catalog_featuretype` VALUES (1,'Price',1,'price','Top Price Hosts - Price Hosting - Price Web Hosting','Here are the best <strong>Price Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Price hosts</strong> to give you this list of\r\n                <strong>Price hosts</strong>',6,0,0),(2,'Bandwidth',1,'bandwidth','Top Bandwidth Hosts - Bandwidth Hosting - Bandwidth Web Hosting','Here are the best <strong>Bandwidth Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Bandwidth hosts</strong> to give you this list of\r\n                <strong>Bandwidth hosts</strong>',6,0,0),(3,'Space',1,'space','Top Space Hosts - Space Hosting - Space Web Hosting','Here are the best <strong>Space Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Space hosts</strong> to give you this list of\r\n                <strong>Space hosts</strong>',6,0,0),(4,'PHP',1,'php','PHP Hosting - PHP Web Hosting','Here are the best <strong>PHP Hosting\r\n                Providers</strong> in the World! We\'ve taken user reviews\r\n                and compiled the <strong>best PHP hosts</strong> to give you\r\n                this list of <strong>PHP hosts</strong>',3,0,0),(5,'Django',1,'django','Django Hosting - Django Web Hosting','Here are the best <strong>Django Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Django hosts</strong> to give you this list of\r\n                <strong>Django hosts</strong>',2,0,0),(29,'Money Back Guarantee',1,'money-back-guarantee','Top Money Back Guarantee Hosts - Money Back Guarantee Hosting - Money Back Guarantee Web Hosting','Here are the best <strong>Money Back Guarantee Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Money Back Guarantee hosts</strong> to give you this list of\r\n                <strong>Money Back Guarantee hosts</strong>',1,0,0),(7,'PHPmyAdmin',1,'phpmyadmin','PHPmyAdmin Hosting - PHPmyAdmin Web Hosting','Here are the best <strong>PHPmyAdmin Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best PHPmyAdmin hosts</strong> to give you this list of\r\n                <strong>PHPmyAdmin hosts</strong>',2,0,0),(8,'MySQL',1,'mysql','MySQL Hosting - MySQL Web Hosting','Here are the best <strong>MySQL Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best MySQL hosts</strong> to give you this list of\r\n                <strong>MySQL hosts</strong>',4,0,0),(9,'Python',1,'python','Python Hosting - Python Web Hosting','Here are the best <strong>Python Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Python hosts</strong> to give you this list of\r\n                <strong>Python hosts</strong>',3,0,0),(10,'Ruby',1,'ruby','Ruby Hosting - Ruby Web Hosting','Here are the best <strong>Ruby Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Ruby hosts</strong> to give you this list of\r\n                <strong>Ruby hosts</strong>',3,0,0),(11,'Ruby on Rails',1,'ruby-on-rails','Ruby on Rails Hosting - Ruby on Rails Web Hosting','Here are the best <strong>Ruby on Rails Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Ruby on Rails hosts</strong> to give you this list of\r\n                <strong>Ruby on Rails hosts</strong>',2,0,0),(12,'Perl',1,'perl','Perl Hosting - Perl Web Hosting','Here are the best <strong>Perl Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Perl hosts</strong> to give you this list of\r\n                <strong>Perl hosts</strong>',3,0,0),(30,'Online Support',1,'online-support','Top Online Support Hosts - Online Support Hosting - Online Support Web Hosting','Here are the best <strong>Online Support Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Online Support hosts</strong> to give you this list of\r\n                <strong>Online Support hosts</strong>',5,0,0),(31,'Phone Support',1,'phone-support','Top Phone Support Hosts - Phone Support Hosting - Phone Support Web Hosting','Here are the best <strong>Phone Support Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Phone Support hosts</strong> to give you this list of\r\n                <strong>Phone Support hosts</strong>',5,0,0),(32,'Email Support',1,'email-support','Top Email Support Hosts - Email Support Hosting - Email Support Web Hosting','Here are the best <strong>Email Support Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Email Support hosts</strong> to give you this list of\r\n                <strong>Email Support hosts</strong>',5,0,0),(16,'Backups',1,'backups','Backups Hosting - Backups Web Hosting','Here are the best <strong>Backups Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Backups hosts</strong> to give you this list of\r\n                <strong>Backups hosts</strong>',6,0,0),(17,'Control Panel',1,'control-panel','Control Panel Hosting - Control Panel Web Hosting','Here are the best <strong>Control Panel Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Control Panel hosts</strong> to give you this list of\r\n                <strong>Control Panel hosts</strong>',6,0,0),(18,'POP3',1,'pop3','POP3 Hosting - POP3 Web Hosting','Here are the best <strong>POP3 Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best POP3 hosts</strong> to give you this list of\r\n                <strong>POP3 hosts</strong>',4,0,0),(19,'IMAP',1,'imap','IMAP Hosting - IMAP Web Hosting','Here are the best <strong>IMAP Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best IMAP hosts</strong> to give you this list of\r\n                <strong>IMAP hosts</strong>',4,0,0),(20,'Webmail',1,'webmail','Webmail Hosting - Webmail Web Hosting','Here are the best <strong>Webmail Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Webmail hosts</strong> to give you this list of\r\n                <strong>Webmail hosts</strong>',4,0,0),(21,'SPAM Filter',1,'spam-filter','SPAM Filter Hosting - SPAM Filter Web Hosting','Here are the best <strong>SPAM Filter Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best SPAM Filter hosts</strong> to give you this list of\r\n                <strong>SPAM Filter hosts</strong>',6,0,0),(22,'Mail Forwarders',1,'mail-forwarders','Mail Forwarders Hosting - Mail Forwarders Web Hosting','Here are the best <strong>Mail Forwarders Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Mail Forwarders hosts</strong> to give you this list of\r\n                <strong>Mail Forwarders hosts</strong>',6,0,0),(23,'Mail Autoresponders',1,'mail-autoresponders','Mail Autoresponders Hosting - Mail Autoresponders Web Hosting','Here are the best <strong>Mail Autoresponders Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Mail Autoresponders hosts</strong> to give you this list of\r\n                <strong>Mail Autoresponders hosts</strong>',6,0,0),(33,'Google AdWords Credit',1,'google-adwords-credit','Top Google AdWords Credit Hosts - Google AdWords Credit Hosting - Google AdWords Credit Web Hosting','Here are the best <strong>Google AdWords Credit Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Google AdWords Credit hosts</strong> to give you this list of\r\n                <strong>Google AdWords Credit hosts</strong>',1,0,0),(41,'Email',1,'email','Top Email Hosts - Email Hosting - Email Web Hosting','Here are the best <strong>Email Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Email hosts</strong> to give you this list of\r\n                <strong>Email hosts</strong>',4,0,0),(34,'Yahoo! Ad Credit',1,'yahoo-ad-credit','Top Yahoo! Ad Credit Hosts - Yahoo! Ad Credit Hosting - Yahoo! Ad Credit Web Hosting','Here are the best <strong>Yahoo! Ad Credit Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Yahoo! Ad Credit hosts</strong> to give you this list of\r\n                <strong>Yahoo! Ad Credit hosts</strong>',1,0,0),(35,'Microsoft adCenter Credit',1,'microsoft-adcenter-credit','Top Microsoft adCenter Credit Hosts - Microsoft adCenter Credit Hosting - Microsoft adCenter Credit Web Hosting','Here are the best <strong>Microsoft adCenter Credit Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Microsoft adCenter Credit hosts</strong> to give you this list of\r\n                <strong>Microsoft adCenter Credit hosts</strong>',1,0,0),(28,'FTP',1,'ftp','Top FTP Hosts - FTP Hosting - FTP Web Hosting','Here are the best <strong>FTP Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best FTP hosts</strong> to give you this list of\r\n                <strong>FTP hosts</strong>',4,0,0),(36,'Uptime Guarantee',1,'uptime-guarantee','Top Uptime Guarantee Hosts - Uptime Guarantee Hosting - Uptime Guarantee Web Hosting','Here are the best <strong>Uptime Guarantee Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Uptime Guarantee hosts</strong> to give you this list of\r\n                <strong>Uptime Guarantee hosts</strong>',1,0,0),(37,'Wordpress',1,'wordpress','Top Wordpress Hosts - Wordpress Hosting - Wordpress Web Hosting','Here are the best <strong>Wordpress Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Wordpress hosts</strong> to give you this list of\r\n                <strong>Wordpress hosts</strong>',2,0,0),(38,'Addon Domains',1,'addon-domains','Top Addon Domains Hosts - Addon Domains Hosting - Addon Domains Web Hosting','Here are the best <strong>Addon Domains Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Addon Domains hosts</strong> to give you this list of\r\n                <strong>Addon Domains hosts</strong>',6,0,0),(39,'Sub-Domains',1,'sub-domains','Top Sub-Domains Hosts - Sub-Domains Hosting - Sub-Domains Web Hosting','Here are the best <strong>Sub-Domains Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Sub-Domains hosts</strong> to give you this list of\r\n                <strong>Sub-Domains hosts</strong>',6,0,0),(40,'Databases',1,'databases','Top Databases Hosts - Databases Hosting - Databases Web Hosting','Here are the best <strong>Databases Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Databases hosts</strong> to give you this list of\r\n                <strong>Databases hosts</strong>',6,0,0),(42,'Free Domain',1,'free-domain','Top Free Domain Hosts - Free Domain Hosting - Free Domain Web Hosting','Here are the best <strong>Free Domain Hosting Providers</strong>\r\n                in the World! We\'ve taken user reviews and compiled the\r\n                <strong>best Free Domain hosts</strong> to give you this list of\r\n                <strong>Free Domain hosts</strong>',1,0,0);
/*!40000 ALTER TABLE `catalog_featuretype` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `catalog_featuregroup`
--

LOCK TABLES `catalog_featuregroup` WRITE;
/*!40000 ALTER TABLE `catalog_featuregroup` DISABLE KEYS */;
INSERT INTO `catalog_featuregroup` VALUES (1,'Promotions',-100,1),(2,'Scripts',0,0),(3,'Languages',0,0),(4,'Services',0,0),(5,'Customer Service',0,0),(6,'Features',10,1),(8,'None',0,0);
/*!40000 ALTER TABLE `catalog_featuregroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-02-18  7:15:35
