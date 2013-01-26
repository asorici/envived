-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: envived
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add user profile',8,'add_userprofile'),(23,'Can change user profile',8,'change_userprofile'),(24,'Can delete user profile',8,'delete_userprofile'),(25,'Can add environment',9,'add_environment'),(26,'Can change environment',9,'change_environment'),(27,'Can delete environment',9,'delete_environment'),(28,'Can add layout',10,'add_layout'),(29,'Can change layout',10,'change_layout'),(30,'Can delete layout',10,'delete_layout'),(31,'Can add area',11,'add_area'),(32,'Can change area',11,'change_area'),(33,'Can delete area',11,'delete_area'),(34,'Can add feature',12,'add_feature'),(35,'Can change feature',12,'change_feature'),(36,'Can delete feature',12,'delete_feature'),(37,'Can add announcement',13,'add_announcement'),(38,'Can change announcement',13,'change_announcement'),(39,'Can delete announcement',13,'delete_announcement'),(40,'Can add annotation',14,'add_annotation'),(41,'Can change annotation',14,'change_annotation'),(42,'Can delete annotation',14,'delete_annotation'),(43,'Can add history',15,'add_history'),(44,'Can change history',15,'change_history'),(45,'Can delete history',15,'delete_history'),(46,'Can add privacy',16,'add_privacy'),(47,'Can change privacy',16,'change_privacy'),(48,'Can delete privacy',16,'delete_privacy'),(49,'Can add user context',17,'add_usercontext'),(50,'Can change user context',17,'change_usercontext'),(51,'Can delete user context',17,'delete_usercontext'),(52,'Can add log entry',18,'add_logentry'),(53,'Can change log entry',18,'change_logentry'),(54,'Can delete log entry',18,'delete_logentry'),(55,'Can add api access',19,'add_apiaccess'),(56,'Can change api access',19,'change_apiaccess'),(57,'Can delete api access',19,'delete_apiaccess'),(58,'Can add api key',20,'add_apikey'),(59,'Can change api key',20,'change_apikey'),(60,'Can delete api key',20,'delete_apikey'),(61,'Can add registration profile',21,'add_registrationprofile'),(62,'Can change registration profile',21,'change_registrationprofile'),(63,'Can delete registration profile',21,'delete_registrationprofile'),(64,'Can add facebook user',22,'add_facebookuser'),(65,'Can change facebook user',22,'change_facebookuser'),(66,'Can delete facebook user',22,'delete_facebookuser'),(67,'Can add facebook like',23,'add_facebooklike'),(68,'Can change facebook like',23,'change_facebooklike'),(69,'Can delete facebook like',23,'delete_facebooklike'),(70,'Can add facebook profile',24,'add_facebookprofile'),(71,'Can change facebook profile',24,'change_facebookprofile'),(72,'Can delete facebook profile',24,'delete_facebookprofile'),(73,'Can add research profile',25,'add_researchprofile'),(74,'Can change research profile',25,'change_researchprofile'),(75,'Can delete research profile',25,'delete_researchprofile'),(76,'Can add description feature',26,'add_descriptionfeature'),(77,'Can change description feature',26,'change_descriptionfeature'),(78,'Can delete description feature',26,'delete_descriptionfeature'),(79,'Can add program feature',27,'add_programfeature'),(80,'Can change program feature',27,'change_programfeature'),(81,'Can delete program feature',27,'delete_programfeature'),(82,'Can add session',28,'add_session'),(83,'Can change session',28,'change_session'),(84,'Can delete session',28,'delete_session'),(88,'Can add people feature',30,'add_peoplefeature'),(89,'Can change people feature',30,'change_peoplefeature'),(90,'Can delete people feature',30,'delete_peoplefeature'),(91,'Can add description annotation',31,'add_descriptionannotation'),(92,'Can change description annotation',31,'change_descriptionannotation'),(93,'Can delete description annotation',31,'delete_descriptionannotation'),(97,'Can add facebook profile',33,'add_facebookprofile'),(98,'Can change facebook profile',33,'change_facebookprofile'),(99,'Can delete facebook profile',33,'delete_facebookprofile'),(100,'Can add user sub profile',34,'add_usersubprofile'),(101,'Can change user sub profile',34,'change_usersubprofile'),(102,'Can delete user sub profile',34,'delete_usersubprofile'),(103,'Can add program annotation',35,'add_programannotation'),(104,'Can change program annotation',35,'change_programannotation'),(105,'Can delete program annotation',35,'delete_programannotation'),(106,'Can add order feature',36,'add_orderfeature'),(107,'Can change order feature',36,'change_orderfeature'),(108,'Can delete order feature',36,'delete_orderfeature'),(109,'Can add menu category',37,'add_menucategory'),(110,'Can change menu category',37,'change_menucategory'),(111,'Can delete menu category',37,'delete_menucategory'),(112,'Can add menu item',38,'add_menuitem'),(113,'Can change menu item',38,'change_menuitem'),(114,'Can delete menu item',38,'delete_menuitem'),(115,'Can add order annotation',39,'add_orderannotation'),(116,'Can change order annotation',39,'change_orderannotation'),(117,'Can delete order annotation',39,'delete_orderannotation'),(118,'Can add presentation',40,'add_presentation'),(119,'Can change presentation',40,'change_presentation'),(120,'Can delete presentation',40,'delete_presentation'),(121,'Can add speaker',41,'add_speaker'),(122,'Can change speaker',41,'change_speaker'),(123,'Can delete speaker',41,'delete_speaker');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'alex','','','alex@email.com','sha1$9e9fb$3f783df6b25864034f838071daf0db757fe5dd51',1,1,1,'2013-01-19 13:48:30','2012-02-28 17:21:18'),(2,'user_1_email_com','Alexandru','Sorici','user_1@email.com','sha1$821a0$6acd13a4a62dc170eeb30b920c1975cf9d0f7a72',0,1,0,'2013-01-19 18:27:06','2012-02-28 17:21:39'),(3,'user_2_email_com','Andrei','Ciortea','user_2@email.com','sha1$edc72$0bdf75222a59fe66e9eb49efd28651dc33fa640c',0,1,0,'2012-07-18 13:28:11','2012-02-28 17:21:39'),(4,'user_3_email_com','Mihai','Trascau','user_3@email.com','sha1$3bb5f$a7e80547450c5fe4778777e6985f73bbe425311e',0,1,0,'2012-06-10 18:24:45','2012-02-28 17:21:39'),(5,'user_4_email_com','Tudor','Berariu','user_4@email.com','sha1$1e901$e671651a899fb4f32670259ebd0deba00f7a6a73',0,1,0,'2012-02-28 17:21:39','2012-02-28 17:21:39'),(87,'aiwo_admin','AIWO','Admin','tech@aiolympics.ro','sha1$43b36$308c96475be3a72fef20be1b071bf991a6247ca8',1,1,1,'2013-01-25 20:41:01','2013-01-25 20:41:01');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_annotation`
--

DROP TABLE IF EXISTS `coresql_annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_annotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `environment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longtext,
  `category` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_annotation_202f16e9` (`area_id`),
  KEY `coresql_annotation_25ab32ac` (`environment_id`),
  KEY `coresql_annotation_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=508 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_annotation`
--

LOCK TABLES `coresql_annotation` WRITE;
/*!40000 ALTER TABLE `coresql_annotation` DISABLE KEYS */;
INSERT INTO `coresql_annotation` VALUES (1,1,NULL,NULL,'dummy annotation 1 for area area_1','default','2012-02-28 17:21:41'),(2,1,NULL,5,'dummy annotation 2 for area area_1','default','2012-02-28 17:21:43'),(3,1,NULL,NULL,'dummy annotation 3 for area area_1','default','2012-02-28 17:21:45'),(4,2,NULL,4,'dummy annotation 1 for area area_2','default','2012-02-28 17:21:47'),(5,2,NULL,NULL,'dummy annotation 2 for area area_2','default','2012-02-28 17:21:49'),(6,2,NULL,3,'dummy annotation 3 for area area_2','default','2012-02-28 17:21:51'),(7,3,NULL,NULL,'dummy annotation 1 for area area_3','default','2012-02-28 17:21:53'),(8,3,NULL,NULL,'dummy annotation 2 for area area_3','default','2012-02-28 17:21:55'),(9,3,NULL,NULL,'dummy annotation 3 for area area_3','default','2012-02-28 17:21:57'),(10,4,NULL,1,'dummy annotation 1 for area area_4','default','2012-02-28 17:21:59'),(11,4,NULL,2,'dummy annotation 2 for area area_4','default','2012-02-28 17:22:01'),(12,4,NULL,NULL,'dummy annotation 3 for area area_4','default','2012-02-28 17:22:03'),(38,5,NULL,2,'','default','2012-07-05 18:21:23'),(507,1,NULL,NULL,NULL,'order','2013-01-24 02:29:34'),(502,1,NULL,2,NULL,'order','2013-01-19 18:28:45'),(503,1,NULL,2,NULL,'order','2013-01-19 18:32:12'),(504,1,NULL,2,NULL,'order','2013-01-19 18:32:37'),(506,1,NULL,NULL,NULL,'order','2013-01-24 02:19:10'),(485,1,NULL,NULL,NULL,'order','2012-11-17 00:57:02'),(483,1,NULL,NULL,NULL,'order','2012-11-17 00:54:29'),(466,1,NULL,2,NULL,'order','2012-10-30 19:17:32'),(481,1,NULL,NULL,NULL,'order','2012-11-17 00:41:38'),(468,1,NULL,2,NULL,'order','2012-11-02 11:19:08'),(469,1,NULL,NULL,NULL,'order','2012-11-16 23:54:59'),(470,1,NULL,NULL,NULL,'order','2012-11-16 23:55:07'),(471,1,NULL,NULL,NULL,'order','2012-11-16 23:57:35'),(472,1,NULL,NULL,NULL,'order','2012-11-16 23:57:40'),(473,1,NULL,NULL,NULL,'order','2012-11-17 00:21:55'),(474,1,NULL,NULL,NULL,'order','2012-11-17 00:22:00'),(475,1,NULL,NULL,NULL,'order','2012-11-17 00:22:08'),(476,1,NULL,NULL,NULL,'order','2012-11-17 00:25:13'),(477,1,NULL,NULL,NULL,'order','2012-11-17 00:25:19'),(478,1,NULL,NULL,NULL,'order','2012-11-17 00:33:25'),(479,1,NULL,NULL,NULL,'order','2012-11-17 00:33:30'),(480,1,NULL,NULL,NULL,'order','2012-11-17 00:41:33');
/*!40000 ALTER TABLE `coresql_annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_announcement`
--

DROP TABLE IF EXISTS `coresql_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `environment_id` int(11) DEFAULT NULL,
  `data` longtext NOT NULL,
  `repeatEvery` varchar(50) NOT NULL,
  `triggers` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_announcement_202f16e9` (`area_id`),
  KEY `coresql_announcement_25ab32ac` (`environment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_announcement`
--

LOCK TABLES `coresql_announcement` WRITE;
/*!40000 ALTER TABLE `coresql_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_announcement_followed_by`
--

DROP TABLE IF EXISTS `coresql_announcement_followed_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_announcement_followed_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announcement_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `announcement_id` (`announcement_id`,`userprofile_id`),
  KEY `coresql_announcement_followed_by_7a84938b` (`announcement_id`),
  KEY `coresql_announcement_followed_by_1be3128f` (`userprofile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_announcement_followed_by`
--

LOCK TABLES `coresql_announcement_followed_by` WRITE;
/*!40000 ALTER TABLE `coresql_announcement_followed_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_announcement_followed_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_area`
--

DROP TABLE IF EXISTS `coresql_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `environment_id` int(11) NOT NULL,
  `areaType` varchar(50) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `name` varchar(140) NOT NULL,
  `tags` longtext,
  `layout_id` int(11) NOT NULL,
  `shape` longtext,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_area_25ab32ac` (`environment_id`),
  KEY `coresql_area_40833a8c` (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_area`
--

LOCK TABLES `coresql_area` WRITE;
/*!40000 ALTER TABLE `coresql_area` DISABLE KEYS */;
INSERT INTO `coresql_area` VALUES (1,1,'interest',NULL,'area_1','tag1;tag2;tag3',1,'POLYGON 10.0:10.0 100.0:400.0','2013-01-24 02:29:34'),(2,1,'interest',NULL,'area_2','tag1;tag2;tag3',1,'POLYGON 10.0:10.0 100.0:400.0','2012-07-31 00:57:30'),(3,1,'interest',NULL,'area_3','tag1;tag2;tag3',1,'POLYGON 10.0:10.0 100.0:400.0','2012-02-28 17:21:39'),(4,1,'interest',NULL,'area_4','tag1;tag2;tag3',1,'POLYGON 10.0:10.0 100.0:400.0','2012-02-28 17:21:39'),(5,11,'interest',NULL,'Blue Hall','',2,NULL,'2012-07-31 00:33:12'),(6,11,'interest',NULL,'Room 443D','',2,NULL,'2012-06-09 00:37:20'),(7,11,'interest',NULL,'Room 443C','',2,NULL,'2012-06-09 00:37:20'),(8,11,'interest',NULL,'University Hall','',2,NULL,'2012-06-09 00:37:20'),(9,12,'interest',87,'AI Talks','artificial intelligence;presentations;tech talks',3,NULL,'2013-01-25 20:43:48');
/*!40000 ALTER TABLE `coresql_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_descriptionannotation`
--

DROP TABLE IF EXISTS `coresql_descriptionannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_descriptionannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`annotation_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_descriptionannotation`
--

LOCK TABLES `coresql_descriptionannotation` WRITE;
/*!40000 ALTER TABLE `coresql_descriptionannotation` DISABLE KEYS */;
INSERT INTO `coresql_descriptionannotation` VALUES (38,'some dummy text for area 5');
/*!40000 ALTER TABLE `coresql_descriptionannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_descriptionfeature`
--

DROP TABLE IF EXISTS `coresql_descriptionfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_descriptionfeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  `newest_info` mediumtext,
  `img_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_descriptionfeature`
--

LOCK TABLES `coresql_descriptionfeature` WRITE;
/*!40000 ALTER TABLE `coresql_descriptionfeature` DISABLE KEYS */;
INSERT INTO `coresql_descriptionfeature` VALUES (3,'Order from Ciortea\'s, the coolest bar in town!',NULL,NULL),(5,'Order from Ciortea\'s, the coolest bar in town!',NULL,NULL),(1,'Order from Ciortea\'s, the coolest bar in town! Situated on the intersection between Calea Victoriei and Bld. Regina Elisabeta, it is the place to be after a hard day\'s work. Enjoy a varied menu and a pleasurable ambiance with your friends and family.','Chech out the latest cocktails we have added.','http://192.168.1.106:8000/envsocial/media/images/placeholder.jpg'),(33,'The 2nd International Conference on Web Intelligence, Mining and Semantics (WIMS\'12) is organised under the auspices of University of Craiova. This is the second in a new series of conferences concerned with intelligent approaches to transform the World Wide Web into a global reasoning and semantics-driven computing machine. ',NULL,NULL),(35,'The Blue Hall will host the talks by the invited speakers and Tutorial 1.',NULL,NULL),(37,'Room 443D will host Sessions 1, 3, 5, 7, 9 and Tutorials 2 and 4.',NULL,NULL),(39,'Room 443C will host Sessions 2, 4, 6, 8, 10 and Tutorials 3 and 5.',NULL,NULL),(41,'University Hall will host Poster Sessions and Coffee Breaks.',NULL,NULL);
/*!40000 ALTER TABLE `coresql_descriptionfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_environment`
--

DROP TABLE IF EXISTS `coresql_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_environment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `name` varchar(140) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `tags` longtext,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_environment_5d52dd10` (`owner_id`),
  KEY `coresql_environment_63f17a16` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_environment`
--

LOCK TABLES `coresql_environment` WRITE;
/*!40000 ALTER TABLE `coresql_environment` DISABLE KEYS */;
INSERT INTO `coresql_environment` VALUES (1,2,'Environment1',NULL,'tag1;tag2;tag3',500,500,NULL,NULL,'2012-11-01 12:25:10'),(12,87,'AIWO 2013',NULL,'artificial intelligence;AI presentations;AI exhibitions;AI competition;Crafting Quest 3',NULL,NULL,44.435856,26.047433,'2013-01-25 20:42:35'),(11,2,'WIMS 2012 Conference',NULL,'conference;web intelligence;mining and semantics',500,500,NULL,NULL,'2012-06-09 00:37:20');
/*!40000 ALTER TABLE `coresql_environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_facebookprofile`
--

DROP TABLE IF EXISTS `coresql_facebookprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_facebookprofile` (
  `usersubprofile_ptr_id` int(11) NOT NULL,
  `about_me` longtext NOT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  `access_token` longtext NOT NULL,
  `facebook_name` varchar(255) NOT NULL,
  `facebook_profile_url` longtext NOT NULL,
  `website_url` longtext NOT NULL,
  `blog_url` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `raw_data` longtext NOT NULL,
  PRIMARY KEY (`usersubprofile_ptr_id`),
  UNIQUE KEY `facebook_id` (`facebook_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_facebookprofile`
--

LOCK TABLES `coresql_facebookprofile` WRITE;
/*!40000 ALTER TABLE `coresql_facebookprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_facebookprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_feature`
--

DROP TABLE IF EXISTS `coresql_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `environment_id` int(11) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `is_general` tinyint(1) NOT NULL DEFAULT '0',
  `version` smallint(6) NOT NULL DEFAULT '1',
  `data` longtext,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_area_category` (`area_id`,`category`),
  UNIQUE KEY `uc_environment_category` (`environment_id`,`category`),
  KEY `coresql_feature_202f16e9` (`area_id`),
  KEY `coresql_feature_25ab32ac` (`environment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_feature`
--

LOCK TABLES `coresql_feature` WRITE;
/*!40000 ALTER TABLE `coresql_feature` DISABLE KEYS */;
INSERT INTO `coresql_feature` VALUES (1,NULL,1,'description',0,1,'test data for environment1','2012-10-30 18:02:26'),(2,NULL,1,'order',1,1,'{\"order_menu\": [{\"category\": \"Andrei\'s Beer\", \"items\": [{\"price\": \"free\", \"name\": \"RedBeer\", \"description\": \"Coolest beer in town!\"}, {\"price\": \"free\", \"name\": \"YellowBeer\", \"description\": \"Coolest beer in town!\"}, {\"price\": \"free\", \"name\": \"BlueBeer\", \"description\": \"Coolest beer in town!\"}]}, {\"category\": \"Andrei\'s Chips\", \"items\": [{\"price\": \"free\", \"name\": \"RedChips\", \"description\": \"Coolest chips in town!\"}, {\"price\": \"free\", \"name\": \"YellowChips\", \"description\": \"Coolest chips in town!\"}, {\"price\": \"free\", \"name\": \"BlueChips\", \"description\": \"Coolest chips in town!\"}]}]}','2013-01-22 13:09:45'),(3,1,NULL,'description',0,1,'test data for area_1','2012-03-14 12:21:19'),(5,2,NULL,'description',0,1,'test data for area_2','2012-03-14 12:21:19'),(7,3,NULL,'description',0,1,'test data for area_3','2012-03-14 12:21:19'),(9,4,NULL,'description',0,1,'test data for area_4','2012-03-14 12:21:19'),(35,5,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(33,NULL,11,'description',0,1,NULL,'2012-06-09 00:37:20'),(43,NULL,12,'program',1,1,NULL,'2013-01-25 20:46:43'),(36,5,NULL,'people',0,1,NULL,'2012-06-09 00:37:20'),(37,6,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(38,6,NULL,'people',0,1,NULL,'2012-06-09 00:37:20'),(39,7,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(40,7,NULL,'people',0,1,NULL,'2012-06-09 00:37:20'),(41,8,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(42,8,NULL,'people',0,1,NULL,'2012-06-09 00:37:20');
/*!40000 ALTER TABLE `coresql_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_history`
--

DROP TABLE IF EXISTS `coresql_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `environment_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_history_403f60f` (`user_id`),
  KEY `coresql_history_202f16e9` (`area_id`),
  KEY `coresql_history_25ab32ac` (`environment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_history`
--

LOCK TABLES `coresql_history` WRITE;
/*!40000 ALTER TABLE `coresql_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_layout`
--

DROP TABLE IF EXISTS `coresql_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `environment_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `mapURL` varchar(200) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_layout_25ab32ac` (`environment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_layout`
--

LOCK TABLES `coresql_layout` WRITE;
/*!40000 ALTER TABLE `coresql_layout` DISABLE KEYS */;
INSERT INTO `coresql_layout` VALUES (1,1,0,'http://acme.aquasoft.com/some-dummy-layout-url','2012-02-28 17:21:39'),(2,11,0,NULL,'2012-06-09 00:37:20'),(3,12,0,'','2013-01-25 20:42:56'),(4,12,1,'','2013-01-25 20:43:02');
/*!40000 ALTER TABLE `coresql_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_menucategory`
--

DROP TABLE IF EXISTS `coresql_menucategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_menucategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `categ_type` varchar(32) NOT NULL DEFAULT 'drinks',
  `num_orders_current` int(11) NOT NULL DEFAULT '0',
  `num_orders_prev` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `coresql_menucategory_143efa3` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_menucategory`
--

LOCK TABLES `coresql_menucategory` WRITE;
/*!40000 ALTER TABLE `coresql_menucategory` DISABLE KEYS */;
INSERT INTO `coresql_menucategory` VALUES (1,2,'Andrei\'s Beer','drinks',0,1),(2,2,'Andrei\'s Chips','food',0,0),(3,2,'Andrei\'s Cookies','desert',0,0),(4,2,'Andrei\'s Wine','drinks',0,1),(5,2,'Andrei\'s Seefood','food',0,0),(6,2,'Andrei\'s Cocktails','drinks',0,0);
/*!40000 ALTER TABLE `coresql_menucategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_menuitem`
--

DROP TABLE IF EXISTS `coresql_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` longtext,
  `price` float NOT NULL,
  `num_orders_current` int(11) NOT NULL DEFAULT '0',
  `num_orders_prev` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `coresql_menuitem_42dc49bc` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_menuitem`
--

LOCK TABLES `coresql_menuitem` WRITE;
/*!40000 ALTER TABLE `coresql_menuitem` DISABLE KEYS */;
INSERT INTO `coresql_menuitem` VALUES (1,1,'RedBeer','Coolest beer in town!',3,0,0),(2,1,'YellowBeer','Coolest beer in town!',2.5,0,0),(3,1,'BlueBeer','Coolest beer in town!',4,0,0),(4,2,'RedChips','Coolest chips in town!',3,0,0),(5,2,'YellowChips','Coolest chips in town!',3,0,0),(6,2,'BlueChips','Coolest chips in town!',3,0,0),(7,1,'Orange Beer','Best Orange Beer in town!',4.5,0,0),(8,1,'Green Beer','Best Green Beer in town!',6.5,0,0),(9,1,'Dark Beer','Best Dark Beer in town!',5,0,0),(10,1,'Blond Beer','Best Blond Beer in town!',5.5,0,1),(11,2,'Orange Chips','',4,0,0),(12,2,'Green Chips','Best green chips in town!',4.5,0,0),(13,2,'Dark Chips','The name sounds silly :-)',4.5,0,0),(14,2,'Blond Chips','That\'s more like it :-)',4,0,0),(15,3,'Gold Cookies','You have to try these just by the sound of their name + they\'re a bargain.',4.99,0,0),(16,4,'Gold Wine','Best Wine in town!',23.5,0,0),(17,4,'Silver Wine','Second best wine in town!',17.99,0,0),(18,4,'Bronze Wine','Third best wine in town!',12.5,0,1),(19,5,'Crabs','Yummy crabs',21.99,0,0),(20,5,'Lobster','You must try this lobster!',51.5,0,0),(21,5,'Clams','The french agree that these are the best clams in town!',12.5,0,0),(22,6,'Gold Cocktail','Served to you in a gold cup :-)',10,0,0),(23,6,'Silver Cocktail','It glances in the light like snow on a new ski slope.',10,0,0);
/*!40000 ALTER TABLE `coresql_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_orderannotation`
--

DROP TABLE IF EXISTS `coresql_orderannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_orderannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `order` longtext NOT NULL,
  PRIMARY KEY (`annotation_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_orderannotation`
--

LOCK TABLES `coresql_orderannotation` WRITE;
/*!40000 ALTER TABLE `coresql_orderannotation` DISABLE KEYS */;
INSERT INTO `coresql_orderannotation` VALUES (468,'{\"item_id_list\": [{\"id\": 8, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Beer\", \"items\": \"1 x Green Beer (6.5 RON)\\n\"}]}'),(469,'{\"item_id_list\": [{\"id\": 18, \"quantity\": 2}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"2 x Bronze Wine (12.5 RON)\\n\"}]}'),(470,'{\"item_id_list\": [{\"id\": 3, \"quantity\": 1}, {\"id\": 10, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Beer\", \"items\": \"1 x BlueBeer (4.0 RON)\\n1 x Blond Beer (5.5 RON)\\n\"}]}'),(471,'{\"item_id_list\": [{\"id\": 3, \"quantity\": 2}, {\"id\": 8, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Beer\", \"items\": \"2 x BlueBeer (4.0 RON)\\n1 x Green Beer (6.5 RON)\\n\"}]}'),(472,'{\"item_id_list\": [{\"id\": 12, \"quantity\": 2}, {\"id\": 13, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Chips\", \"items\": \"2 x Green Chips (4.5 RON)\\n1 x Dark Chips (4.5 RON)\\n\"}]}'),(473,'{\"item_id_list\": [{\"id\": 3, \"quantity\": 1}, {\"id\": 9, \"quantity\": 2}, {\"id\": 10, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Beer\", \"items\": \"1 x BlueBeer (4.0 RON)\\n2 x Dark Beer (5.0 RON)\\n1 x Blond Beer (5.5 RON)\\n\"}]}'),(474,'{\"item_id_list\": [{\"id\": 15, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Cookies\", \"items\": \"1 x Gold Cookies (4.99 RON)\\n\"}]}'),(475,'{\"item_id_list\": [{\"id\": 11, \"quantity\": 1}, {\"id\": 12, \"quantity\": 2}, {\"id\": 13, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Chips\", \"items\": \"1 x Orange Chips (4.0 RON)\\n2 x Green Chips (4.5 RON)\\n1 x Dark Chips (4.5 RON)\\n\"}]}'),(476,'{\"item_id_list\": [{\"id\": 22, \"quantity\": 2}, {\"id\": 23, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Cocktails\", \"items\": \"2 x Gold Cocktail (10.0 RON)\\n1 x Silver Cocktail (9.0 RON)\\n\"}]}'),(477,'{\"item_id_list\": [{\"id\": 6, \"quantity\": 1}, {\"id\": 13, \"quantity\": 1}, {\"id\": 14, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Chips\", \"items\": \"1 x BlueChips (3.0 RON)\\n1 x Dark Chips (4.5 RON)\\n1 x Blond Chips (4.0 RON)\\n\"}]}'),(478,'{\"item_id_list\": [{\"id\": 23, \"quantity\": 2}], \"order\": [{\"category\": \"Andrei\'s Cocktails\", \"items\": \"2 x Silver Cocktail (9.0 RON)\\n\"}]}'),(479,'{\"item_id_list\": [{\"id\": 12, \"quantity\": 1}, {\"id\": 13, \"quantity\": 1}, {\"id\": 14, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Chips\", \"items\": \"1 x Green Chips (4.5 RON)\\n1 x Dark Chips (4.5 RON)\\n1 x Blond Chips (4.0 RON)\\n\"}]}'),(480,'{\"item_id_list\": [{\"id\": 3, \"quantity\": 1}, {\"id\": 8, \"quantity\": 1}, {\"id\": 9, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Beer\", \"items\": \"1 x BlueBeer (4.0 RON)\\n1 x Green Beer (6.5 RON)\\n1 x Dark Beer (5.0 RON)\\n\"}]}'),(481,'{\"item_id_list\": [{\"id\": 6, \"quantity\": 1}, {\"id\": 11, \"quantity\": 1}, {\"id\": 12, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Chips\", \"items\": \"1 x BlueChips (3.0 RON)\\n1 x Orange Chips (4.0 RON)\\n1 x Green Chips (4.5 RON)\\n\"}]}'),(483,'{\"item_id_list\": [{\"id\": 16, \"quantity\": 2}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"2 x Gold Wine (23.5 RON)\\n\"}]}'),(485,'{\"item_id_list\": [{\"id\": 22, \"quantity\": 1}, {\"id\": 23, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Cocktails\", \"items\": \"1 x Gold Cocktail (10.0 RON)\\n1 x Silver Cocktail (9.0 RON)\\n\"}]}'),(502,'{\"item_id_list\": [{\"id\": 18, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"1 x Bronze Wine (12.5 RON)\\n\"}], \"order_request_type\": \"new_order\"}'),(503,'{\"item_id_list\": [{\"id\": 18, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"1 x Bronze Wine (12.5 RON)\\n\"}], \"order_request_type\": \"new_order\"}'),(504,'{\"item_id_list\": [{\"id\": 18, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"1 x Bronze Wine (12.5 RON)\\n\"}], \"order_request_type\": \"new_order\"}'),(506,'{\"item_id_list\": [{\"id\": 10, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Beer\", \"items\": \"1 x Blond Beer (5.5 RON)\\n\"}], \"order_request_type\": \"new_order\"}'),(507,'{\"item_id_list\": [{\"id\": 18, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"1 x Bronze Wine (12.5 RON)\\n\"}], \"order_request_type\": \"new_order\"}'),(466,'{\"item_id_list\": [{\"id\": 3, \"quantity\": 1}, {\"id\": 10, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Beer\", \"items\": \"1 x BlueBeer (4.0 RON)\\n1 x Blond Beer (5.5 RON)\\n\"}]}');
/*!40000 ALTER TABLE `coresql_orderannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_orderfeature`
--

DROP TABLE IF EXISTS `coresql_orderfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_orderfeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_orderfeature`
--

LOCK TABLES `coresql_orderfeature` WRITE;
/*!40000 ALTER TABLE `coresql_orderfeature` DISABLE KEYS */;
INSERT INTO `coresql_orderfeature` VALUES (2,'Order menu for Ciortea\'s.'),(4,'Order menu for Area 1.'),(6,'Order menu for Area 2.'),(8,'Order menu for Area 3.'),(10,'Order menu for Area 4.');
/*!40000 ALTER TABLE `coresql_orderfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_peoplefeature`
--

DROP TABLE IF EXISTS `coresql_peoplefeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_peoplefeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_peoplefeature`
--

LOCK TABLES `coresql_peoplefeature` WRITE;
/*!40000 ALTER TABLE `coresql_peoplefeature` DISABLE KEYS */;
INSERT INTO `coresql_peoplefeature` VALUES (36,'people feature for Blue Hall'),(38,'people feature for Room 443D'),(40,'people feature for Room 443C'),(42,'people feature for University Hall');
/*!40000 ALTER TABLE `coresql_peoplefeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_presentation`
--

DROP TABLE IF EXISTS `coresql_presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_presentation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `abstract` longtext,
  `tags` longtext,
  PRIMARY KEY (`id`),
  KEY `coresql_presentation_6b4dc4c3` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_presentation`
--

LOCK TABLES `coresql_presentation` WRITE;
/*!40000 ALTER TABLE `coresql_presentation` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_presentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_presentation_speakers`
--

DROP TABLE IF EXISTS `coresql_presentation_speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_presentation_speakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `presentation_id` int(11) NOT NULL,
  `speaker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `presentation_id` (`presentation_id`,`speaker_id`),
  KEY `coresql_presentation_speakers_3abc95a8` (`presentation_id`),
  KEY `coresql_presentation_speakers_7171bad0` (`speaker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_presentation_speakers`
--

LOCK TABLES `coresql_presentation_speakers` WRITE;
/*!40000 ALTER TABLE `coresql_presentation_speakers` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_presentation_speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_privacy`
--

DROP TABLE IF EXISTS `coresql_privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_privacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `environment_id` int(11) NOT NULL,
  `relation` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_privacy_403f60f` (`user_id`),
  KEY `coresql_privacy_25ab32ac` (`environment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_privacy`
--

LOCK TABLES `coresql_privacy` WRITE;
/*!40000 ALTER TABLE `coresql_privacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_privacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_programannotation`
--

DROP TABLE IF EXISTS `coresql_programannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_programannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `presentation_id` int(11) NOT NULL,
  PRIMARY KEY (`annotation_ptr_id`),
  KEY `coresql_programannotation_3abc95a8` (`presentation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_programannotation`
--

LOCK TABLES `coresql_programannotation` WRITE;
/*!40000 ALTER TABLE `coresql_programannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_programannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_programfeature`
--

DROP TABLE IF EXISTS `coresql_programfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_programfeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_programfeature`
--

LOCK TABLES `coresql_programfeature` WRITE;
/*!40000 ALTER TABLE `coresql_programfeature` DISABLE KEYS */;
INSERT INTO `coresql_programfeature` VALUES (43,'The schedule for the artificial intelligence tech talks at AIWO 2013.');
/*!40000 ALTER TABLE `coresql_programfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_researchprofile`
--

DROP TABLE IF EXISTS `coresql_researchprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_researchprofile` (
  `usersubprofile_ptr_id` int(11) NOT NULL,
  `affiliation` varchar(256) DEFAULT NULL,
  `research_interests` longtext,
  PRIMARY KEY (`usersubprofile_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_researchprofile`
--

LOCK TABLES `coresql_researchprofile` WRITE;
/*!40000 ALTER TABLE `coresql_researchprofile` DISABLE KEYS */;
INSERT INTO `coresql_researchprofile` VALUES (1,'Unversity Politehnica of Bucharest','multi-agent systems;context representation and management;ambient intelligence'),(2,'Unversity Politehnica of Bucharest','multi-agent systems;privacy aware systems;ambient intelligence');
/*!40000 ALTER TABLE `coresql_researchprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_session`
--

DROP TABLE IF EXISTS `coresql_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `tag` varchar(8) NOT NULL,
  `program_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_session_7eef53e3` (`program_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_session`
--

LOCK TABLES `coresql_session` WRITE;
/*!40000 ALTER TABLE `coresql_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_speaker`
--

DROP TABLE IF EXISTS `coresql_speaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_speaker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `affiliation` varchar(128) NOT NULL,
  `position` varchar(64) NOT NULL,
  `biography` longtext,
  `email` varchar(75) DEFAULT NULL,
  `online_profile_link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_speaker`
--

LOCK TABLES `coresql_speaker` WRITE;
/*!40000 ALTER TABLE `coresql_speaker` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_speaker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_usercontext`
--

DROP TABLE IF EXISTS `coresql_usercontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_usercontext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `currentEnvironment_id` int(11) DEFAULT NULL,
  `currentArea_id` int(11) DEFAULT NULL,
  `virtual` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `coresql_usercontext_249eae84` (`currentEnvironment_id`),
  KEY `coresql_usercontext_46c8d4e7` (`currentArea_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_usercontext`
--

LOCK TABLES `coresql_usercontext` WRITE;
/*!40000 ALTER TABLE `coresql_usercontext` DISABLE KEYS */;
INSERT INTO `coresql_usercontext` VALUES (1,2,1,1,0),(2,3,NULL,NULL,0),(4,4,NULL,NULL,0),(10,1,1,1,0);
/*!40000 ALTER TABLE `coresql_usercontext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_userprofile`
--

DROP TABLE IF EXISTS `coresql_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL,
  `c2dm_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_userprofile`
--

LOCK TABLES `coresql_userprofile` WRITE;
/*!40000 ALTER TABLE `coresql_userprofile` DISABLE KEYS */;
INSERT INTO `coresql_userprofile` VALUES (1,1,'2012-02-28 17:21:18',0,NULL),(2,2,'2013-01-19 18:35:21',0,'APA91bGSQflaqx8CYmVVCRaeT8SqaR4OXYkgVuqGSbYiI3K-84hRK5bXOBT-ZVkqsv8iMWrH9UaTFUg2vUDnWWS0ragZyKCBlnXvhGrSZhBYjjfCfDpMIVQ2RaTDZYo6f7J-w2ibPcT6QyIsOWQRqTLja3nfJ6LQwQ'),(3,3,'2012-07-18 13:30:05',0,NULL),(4,4,'2012-02-28 17:21:39',0,NULL),(5,5,'2012-02-28 17:21:39',0,NULL),(87,87,'2013-01-25 20:41:01',0,NULL);
/*!40000 ALTER TABLE `coresql_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coresql_usersubprofile`
--

DROP TABLE IF EXISTS `coresql_usersubprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coresql_usersubprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_usersubprofile_1be3128f` (`userprofile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_usersubprofile`
--

LOCK TABLES `coresql_usersubprofile` WRITE;
/*!40000 ALTER TABLE `coresql_usersubprofile` DISABLE KEYS */;
INSERT INTO `coresql_usersubprofile` VALUES (1,2),(2,3);
/*!40000 ALTER TABLE `coresql_usersubprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-06-09 00:35:38',1,9,'9','WIMS 2012 Conference(9)',3,''),(2,'2012-06-09 00:37:00',1,9,'10','WIMS 2012 Conference(10)',3,''),(3,'2012-07-06 13:37:55',1,25,'1','Unversity Politehnica of Bucharest ## [u\'multi-agent systems\', u\'context representation\', u\'ambient intelligence\']',1,''),(4,'2012-07-06 13:38:16',1,25,'1','Unversity Politehnica of Bucharest ## [u\'<coresql.db.objects.TagList object at 0xa1e99cc>\']',2,'Changed userprofile and research_interests.'),(5,'2012-07-06 13:38:51',1,25,'2','Unversity Politehnica of Bucharest ## [u\'multi-agent systems\', u\'privacy aware systems\', u\'ambient intelligence\']',1,''),(6,'2012-07-06 14:59:15',1,25,'1','Unversity Politehnica of Bucharest ## [u\'multi-agent systems\', u\'context representation and management\', u\'ambient intelligence\']',2,'Changed research_interests.'),(7,'2012-07-11 22:36:53',1,37,'1','Andrei\'s Beer in menu -> Order menu for Environment 1.',1,''),(8,'2012-07-11 22:37:06',1,37,'2','Andrei\'s Chips in menu -> Order menu for Environment 1.',1,''),(9,'2012-07-11 22:37:52',1,38,'1','MenuItem object',1,''),(10,'2012-07-11 22:39:59',1,38,'2','MenuItem object',1,''),(11,'2012-07-11 22:41:12',1,38,'3','BlueBeer in category -> Andrei\'s Beer',1,''),(12,'2012-07-11 22:41:50',1,38,'4','RedChips in category -> Andrei\'s Beer',1,''),(13,'2012-07-11 22:42:15',1,38,'5','YellowChips in category -> Andrei\'s Chips',1,''),(14,'2012-07-11 22:44:03',1,38,'6','BlueChips in category -> Andrei\'s Chips',1,''),(15,'2012-07-11 23:14:15',1,38,'4','RedChips in category -> Andrei\'s Chips',2,'Changed category.'),(16,'2012-07-30 16:20:58',1,14,'128','user_1_email_com: anonymous=False - area_1',3,''),(17,'2012-07-30 16:20:58',1,14,'127','user_1_email_com: anonymous=False - area_1',3,''),(18,'2012-07-30 16:20:58',1,14,'126','user_1_email_com: anonymous=False - area_1',3,''),(19,'2012-07-30 16:20:58',1,14,'125','user_1_email_com: anonymous=False - area_1',3,''),(20,'2012-07-30 16:20:58',1,14,'123','user_1_email_com: anonymous=False - area_2',3,''),(21,'2012-08-21 12:09:08',1,38,'7','Orange Beer in category -> Andrei\'s Beer',1,''),(22,'2012-08-21 12:09:27',1,38,'8','Green Beer in category -> Andrei\'s Beer',1,''),(23,'2012-08-21 12:09:53',1,38,'9','Dark Beer in category -> Andrei\'s Beer',1,''),(24,'2012-08-21 12:10:15',1,38,'10','Blond Beer in category -> Andrei\'s Beer',1,''),(25,'2012-08-21 12:10:32',1,38,'11','Orange Chips in category -> Andrei\'s Chips',1,''),(26,'2012-08-21 12:10:56',1,38,'12','Green Chips in category -> Andrei\'s Chips',1,''),(27,'2012-08-21 12:11:28',1,38,'13','Dark Chips in category -> Andrei\'s Chips',1,''),(28,'2012-08-21 12:11:45',1,38,'14','Blond Chips in category -> Andrei\'s Chips',1,''),(29,'2012-08-21 12:12:26',1,37,'3','Andrei\'s Cookies in menu -> Order menu for Ciortea\'s.',1,''),(30,'2012-08-21 12:14:51',1,37,'4','Andrei\'s Wine in menu -> Order menu for Ciortea\'s.',1,''),(31,'2012-08-21 12:15:07',1,37,'5','Andrei\'s Seefood in menu -> Order menu for Ciortea\'s.',1,''),(32,'2012-08-21 12:16:00',1,38,'15','Gold Cookies in category -> Andrei\'s Cookies',1,''),(33,'2012-08-21 12:16:30',1,38,'16','Gold Wine in category -> Andrei\'s Wine',1,''),(34,'2012-08-21 12:16:59',1,38,'17','Silver Wine in category -> Andrei\'s Wine',1,''),(35,'2012-08-21 12:18:17',1,38,'18','Bronze Wine in category -> Andrei\'s Wine',1,''),(36,'2012-08-21 12:18:46',1,38,'19','Crabs in category -> Andrei\'s Seefood',1,''),(37,'2012-08-21 12:19:18',1,38,'20','Lobster in category -> Andrei\'s Seefood',1,''),(38,'2012-08-21 12:20:19',1,38,'21','Clams in category -> Andrei\'s Seefood',1,''),(39,'2012-10-29 10:48:41',1,37,'6','Andrei\'s Cocktails in menu -> Order menu for Ciortea\'s.',1,''),(40,'2012-10-29 10:49:22',1,38,'22','Gold Cocktail in category -> Andrei\'s Cocktails',1,''),(41,'2012-10-29 10:50:12',1,38,'23','Silver Cocktail in category -> Andrei\'s Cocktails',1,''),(42,'2012-10-30 18:02:26',1,26,'1','feature type(description) for env(Environment1)',2,'Changed description, newest_info and img_url.'),(43,'2013-01-22 13:00:06',1,38,'23','Silver Cocktail in category -> Andrei\'s Cocktails',2,'Changed price.'),(44,'2013-01-22 13:00:56',1,38,'23','Silver Cocktail in category -> Andrei\'s Cocktails',2,'Changed price.'),(45,'2013-01-22 13:01:46',1,38,'23','Silver Cocktail in category -> Andrei\'s Cocktails',2,'Changed price.'),(46,'2013-01-25 20:40:12',1,3,'41','090328112f094ac389662e4fa989fb',3,''),(47,'2013-01-25 20:40:12',1,3,'48','0bc602973f694d90b59ba3c9d63a8b',3,''),(48,'2013-01-25 20:40:12',1,3,'13','13eb382636654a7d936612055ced04',3,''),(49,'2013-01-25 20:40:12',1,3,'37','16ebd4f955964b60808f2322c1e96e',3,''),(50,'2013-01-25 20:40:12',1,3,'15','1769bc7d53cb47ab88d1d339463436',3,''),(51,'2013-01-25 20:40:12',1,3,'77','1bcc7bde69894bd7adec2b1ab37592',3,''),(52,'2013-01-25 20:40:12',1,3,'45','23922e511bb1433d8bf3d3b8af26fb',3,''),(53,'2013-01-25 20:40:12',1,3,'55','28c85b33d0184eab84c91d6ca002fa',3,''),(54,'2013-01-25 20:40:12',1,3,'19','2913b88d44874b849678c82643dbaf',3,''),(55,'2013-01-25 20:40:12',1,3,'38','2a9bf78000b047d08ac43a4a852fbe',3,''),(56,'2013-01-25 20:40:12',1,3,'32','2c79646e7e374cb8aebbc26cca7b5d',3,''),(57,'2013-01-25 20:40:12',1,3,'35','2fdda7b4e59440059e099a88da14c2',3,''),(58,'2013-01-25 20:40:12',1,3,'23','314da26ef4664216be101e67b74118',3,''),(59,'2013-01-25 20:40:12',1,3,'69','376675bfc91340e58cb95a0ef4caf9',3,''),(60,'2013-01-25 20:40:12',1,3,'72','3976a7c6343e49199afbdc59e0791e',3,''),(61,'2013-01-25 20:40:12',1,3,'49','47b4ccc652ea43788c466e5683bdee',3,''),(62,'2013-01-25 20:40:12',1,3,'43','50d4b5981b4742768bf4feea304944',3,''),(63,'2013-01-25 20:40:12',1,3,'74','52645cc920a24138bb225a211e3033',3,''),(64,'2013-01-25 20:40:12',1,3,'21','578735fb2cd0422b8efbaa48c50394',3,''),(65,'2013-01-25 20:40:12',1,3,'73','57cff54d347a40979539d8ba517f66',3,''),(66,'2013-01-25 20:40:12',1,3,'66','58f456e524184d32ab866e44bafcf2',3,''),(67,'2013-01-25 20:40:12',1,3,'24','59e936f3c88b4ca1bb5bb7170a6a03',3,''),(68,'2013-01-25 20:40:12',1,3,'20','634c005ef39a41d48a280f9edd5abf',3,''),(69,'2013-01-25 20:40:12',1,3,'46','68bbfa8e0ee14901b19187d7cb5c3f',3,''),(70,'2013-01-25 20:40:12',1,3,'42','79a8928b2d4744648eca156b1f5d56',3,''),(71,'2013-01-25 20:40:12',1,3,'29','7a2d83dfaff449248d1bc674301b4e',3,''),(72,'2013-01-25 20:40:12',1,3,'36','7eb3a3c2f9004ba3a54e118b43acaf',3,''),(73,'2013-01-25 20:40:12',1,3,'71','8ad8cb705bf64ab19e4a71d3bcc66d',3,''),(74,'2013-01-25 20:40:12',1,3,'70','8fc8a740fa6e40dd88a07527303e47',3,''),(75,'2013-01-25 20:40:12',1,3,'31','9937d38f9070406dbd55b33cff3102',3,''),(76,'2013-01-25 20:40:12',1,3,'76','9c607a5d512b469f939a6c20d7103a',3,''),(77,'2013-01-25 20:40:12',1,3,'18','9c9d30b73de94ee7a5b5fedbf03b32',3,''),(78,'2013-01-25 20:40:12',1,3,'51','9d89e5ececd24489b01051b2450a09',3,''),(79,'2013-01-25 20:40:12',1,3,'16','a',3,''),(80,'2013-01-25 20:40:12',1,3,'47','a0470fe4a8514802acaec8797beaa8',3,''),(81,'2013-01-25 20:40:12',1,3,'22','a07e66d82f724a489277fbd2f8f592',3,''),(82,'2013-01-25 20:40:12',1,3,'33','ac743b79bc944cdda227b717e85c55',3,''),(83,'2013-01-25 20:40:12',1,3,'40','ae1ade1762974cdcb6c1f6ce0a2930',3,''),(84,'2013-01-25 20:40:12',1,3,'44','b37bc3a089e848029dd45f006c3b7f',3,''),(85,'2013-01-25 20:40:12',1,3,'39','bac29c04e6de4135935e9e90db51ff',3,''),(86,'2013-01-25 20:40:12',1,3,'28','bc2b27c0bd954c43bb9eee7e503be3',3,''),(87,'2013-01-25 20:40:12',1,3,'64','c1cc4446d0184a32b768a13c14d905',3,''),(88,'2013-01-25 20:40:12',1,3,'67','c340e67ee65240088352a93ec6cd7f',3,''),(89,'2013-01-25 20:40:12',1,3,'75','c8b5c6f5afc34f53801fbf9d892312',3,''),(90,'2013-01-25 20:40:12',1,3,'65','cade115b13cb420291d1ed2fc8b5a9',3,''),(91,'2013-01-25 20:40:12',1,3,'68','cbc669b4b5d5462fa24d6a5c2209fd',3,''),(92,'2013-01-25 20:40:12',1,3,'30','cd2ecb9c25564723b07ee68a9dc13b',3,''),(93,'2013-01-25 20:40:12',1,3,'63','cd6b04bb965b474cb57a0e9d07eb08',3,''),(94,'2013-01-25 20:40:12',1,3,'17','cec95cadfd3541509deb838a7e4857',3,''),(95,'2013-01-25 20:40:12',1,3,'27','d2d1c0e86c1045b1a88a1d74bb2630',3,''),(96,'2013-01-25 20:40:12',1,3,'34','d618fb1581174f0e99cb5e88b7365f',3,''),(97,'2013-01-25 20:40:12',1,3,'26','d79059759dc14d7f863bf22f7e29c7',3,''),(98,'2013-01-25 20:40:12',1,3,'25','db410d6076b34e8795efd722c6fa1b',3,''),(99,'2013-01-25 20:40:12',1,3,'50','de0edf0bbcb64f9e9f6398e8ee3aac',3,''),(100,'2013-01-25 20:40:12',1,3,'52','e43942128a8745b2886b2eb8a57831',3,''),(101,'2013-01-25 20:40:12',1,3,'54','e7b321a7eb5045129afdd741057d0a',3,''),(102,'2013-01-25 20:40:12',1,3,'53','f64c323827234cd7a4dffed35b9069',3,''),(103,'2013-01-25 20:40:12',1,3,'12','f8b2b9a987244964b4c20d0695f1ee',3,''),(104,'2013-01-25 20:40:12',1,3,'14','unmail',3,''),(105,'2013-01-25 20:40:12',1,3,'11','user_10_email_com',3,''),(106,'2013-01-25 20:40:12',1,3,'6','user_5_email_com',3,''),(107,'2013-01-25 20:40:12',1,3,'7','user_6_email_com',3,''),(108,'2013-01-25 20:40:12',1,3,'8','user_7_email_com',3,''),(109,'2013-01-25 20:40:12',1,3,'9','user_8_email_com',3,''),(110,'2013-01-25 20:40:12',1,3,'10','user_9_email_com',3,''),(111,'2013-01-25 20:41:01',1,3,'87','aiwo_admin',1,''),(112,'2013-01-25 20:41:18',1,3,'87','aiwo_admin',2,'Changed first_name, last_name, email, is_staff and is_superuser.'),(113,'2013-01-25 20:42:35',1,9,'12','AIWO 2013(12)',1,''),(114,'2013-01-25 20:42:56',1,10,'3','AIWO 2013 level(0)',1,''),(115,'2013-01-25 20:43:02',1,10,'4','AIWO 2013 level(1)',1,''),(116,'2013-01-25 20:43:48',1,11,'9','AI Talks(9)',1,''),(117,'2013-01-25 20:46:33',1,27,'43','feature type(program) for env(AIWO 2013)',1,''),(118,'2013-01-25 20:46:39',1,27,'43','feature type(program) for env(AIWO 2013)',2,'No fields changed.'),(119,'2013-01-25 20:46:41',1,27,'43','feature type(program) for env(AIWO 2013)',2,'No fields changed.'),(120,'2013-01-25 20:46:43',1,27,'43','feature type(program) for env(AIWO 2013)',2,'No fields changed.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'user profile','coresql','userprofile'),(9,'environment','coresql','environment'),(10,'layout','coresql','layout'),(11,'area','coresql','area'),(12,'feature','coresql','feature'),(13,'announcement','coresql','announcement'),(14,'annotation','coresql','annotation'),(15,'history','coresql','history'),(16,'privacy','coresql','privacy'),(17,'user context','coresql','usercontext'),(18,'log entry','admin','logentry'),(19,'api access','tastypie','apiaccess'),(20,'api key','tastypie','apikey'),(21,'registration profile','registration','registrationprofile'),(22,'facebook user','django_facebook','facebookuser'),(23,'facebook like','django_facebook','facebooklike'),(24,'facebook profile','django_facebook','facebookprofile'),(25,'research profile','coresql','researchprofile'),(26,'description feature','coresql','descriptionfeature'),(27,'program feature','coresql','programfeature'),(28,'session','coresql','session'),(30,'people feature','coresql','peoplefeature'),(31,'description annotation','coresql','descriptionannotation'),(33,'facebook profile','coresql','facebookprofile'),(34,'user sub profile','coresql','usersubprofile'),(35,'program annotation','coresql','programannotation'),(36,'order feature','coresql','orderfeature'),(37,'menu category','coresql','menucategory'),(38,'menu item','coresql','menuitem'),(39,'order annotation','coresql','orderannotation'),(40,'presentation','coresql','presentation'),(41,'speaker','coresql','speaker');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_facebooklike`
--

DROP TABLE IF EXISTS `django_facebook_facebooklike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_facebooklike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `facebook_id` bigint(20) NOT NULL,
  `name` longtext,
  `category` longtext,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`facebook_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebooklike`
--

LOCK TABLES `django_facebook_facebooklike` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebooklike` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebooklike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_facebookprofile`
--

DROP TABLE IF EXISTS `django_facebook_facebookprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_facebookprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `about_me` longtext NOT NULL,
  `facebook_id` bigint(20) DEFAULT NULL,
  `access_token` longtext NOT NULL,
  `facebook_name` varchar(255) NOT NULL,
  `facebook_profile_url` longtext NOT NULL,
  `website_url` longtext NOT NULL,
  `blog_url` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `raw_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `facebook_id` (`facebook_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebookprofile`
--

LOCK TABLES `django_facebook_facebookprofile` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebookprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebookprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_facebookuser`
--

DROP TABLE IF EXISTS `django_facebook_facebookuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_facebookuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `facebook_id` bigint(20) NOT NULL,
  `name` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`facebook_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebookuser`
--

LOCK TABLES `django_facebook_facebookuser` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebookuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebookuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dcb5be9084c793248de6d5721e97d1db','ZDA2YTg3NDVmM2IwZTEwNGE4Y2MzMWRmZGIzNjViOGFiYWYzYTU3ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigEDdS4=\n','2012-06-23 12:27:31'),('aa5d5d9b9681b9170f412e4c913868e9','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-20 12:28:42'),('7b9d28b863de6b088b43d4e5b35b6f7c','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-03-14 11:41:22'),('f038a9b0480a3db717262eba5ab4aa96','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-21 11:14:00'),('fd49e7f0201890ffb35ff7ab1381188f','ZDA2YTg3NDVmM2IwZTEwNGE4Y2MzMWRmZGIzNjViOGFiYWYzYTU3ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigEDdS4=\n','2012-06-21 11:14:30'),('734a22880a9c8ac0d6bafa368be8f914','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 11:43:10'),('8762d574c85d5582e6769ac7357f7c84','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-23 12:55:12'),('add9ab431f3c6b171c91863e0e37272e','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 11:53:12'),('f11e2ed28aad82c4ae25a715443bf60b','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 12:07:39'),('0af7a3c97aa8a60b499cab24f1e8c211','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 13:05:12'),('612c0bea2c0808b4dd5f475b88daadd0','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 18:51:34'),('ec7daf3819ff381f2951c38511a3fec8','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-21 18:09:06'),('f547709010b9fc9c0016b02fc4a8bf19','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 19:01:25'),('5a869d9384b0a8f7c3d03ee37a2ee26c','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-23 12:52:09'),('f0ae68a154c23c62a2a7f38da56990ec','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-06 17:16:28'),('959a0108936f0497330e12b2eb85ca07','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-23 12:55:12'),('80600d77206cb089f452018cdd4b08ce','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-24 18:18:51'),('2958d501ef588eddcd4cfb6b1a8fd228','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-25 22:48:27'),('a87e6be1eca792bb2d6d70cb8e4791bc','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-25 14:32:17'),('c1d336cf7397bcf58d3ed6af0bc2cce5','ZTJlNzc4NTNkZmJmYTEwMTVmMDU4MDI5ZTQzMjFhYTBkNzk4ODI2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEMdS4=\n','2012-06-24 18:25:13'),('d3ff77e9a9895474f51f660647bb9675','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-25 19:32:50'),('b0f3be2f4844dd40506e7188f9a076e0','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-25 19:32:53'),('89de84d9dd7f59ce368812f0ddffee01','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-27 00:36:46'),('646b7682bc619c02874d7bc129b497a3','OWFiZWMyYmM0YjQ5MzlhODBkZGRmZGQwMWMyNmQwYTc4N2IyZTM2ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigERdS4=\n','2012-07-11 12:06:12'),('16f82a2df859cf7e6e84c054e0af5865','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-11 12:05:15'),('539e1b4b2fc1879f126aac1c405a3e56','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-11 12:06:02'),('47bbeccd830b36a1365c9bb980edb857','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-26 10:45:55'),('04a9d9128097688c55e6c1e2a05ad0ad','ZDA2YTg3NDVmM2IwZTEwNGE4Y2MzMWRmZGIzNjViOGFiYWYzYTU3ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigEDdS4=\n','2012-07-23 20:16:30'),('6701761d9470af5a47e29f5c89120fa7','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-26 00:06:08'),('bc08c8bc77955e8049f6b9dc46741b99','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-28 19:38:35'),('9659572f05fc9685d86890696042f8e0','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-30 12:07:48'),('054e7e27570205470c01166132342665','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-30 12:07:48'),('975c3eff27847e2284141a6384a63986','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-30 15:50:40'),('9977ecc6a2f59e0bb2a5c72d65dcb673','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-31 18:55:00'),('2e92723ed03de0d8324215780ac6ea1b','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-01 13:18:05'),('d279d48bc3b533c6b1c5135597805ca3','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-01 13:31:19'),('94a4201342e9d032e3662c2b01d379d7','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-04 15:42:32'),('49906f94b15e9cc2d8b95c987c059dd9','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-04 15:57:27'),('49724e96017a3b47926fce28fe574e3c','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-04 17:04:14'),('02547734ca94dd250c85696dc6d5872e','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-04 23:03:19'),('f64a19d3926e8edc097e928344e7a2e0','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 17:21:44'),('da83c4ec0075541a22e5ddf18f768613','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-10 19:17:49'),('bbcc10df3ead53e2eb9459d77f86bcf2','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 14:17:34'),('d520c3343fddf6ca16fd2ccec66e46fa','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 15:34:40'),('a7ab49d1623a6231eee459aa182a13ad','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-13 16:19:56'),('4dacdd27567d5796380a2c0c368aeac7','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 23:36:17'),('bbee2a407bceeeafdc855315b92769b5','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-14 00:53:22'),('0d5b84cf0a7ce4259264ba90da7e3dd6','YmQ2NjFlZWIyOGIwMDUzYTI4M2VlYzVmYjEyNDc5NzY5OGM4MjA3MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEYdS4=\n','2012-08-14 00:53:48'),('d0deb1da2f1883fcc37a98eba100e418','YWU2YzJiMDUwMjJlMzQ1ODJlYzIyNzU1NzhmODZjODI2M2U0YTc2NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEZdS4=\n','2012-08-14 19:20:08'),('0b406d694e8e88e2ebdd98b4a4cc05cf','MGJhYzIxMGMzNGU0YzU5ZWVkMGVhYTJiNjJiOTUxNmYxMGZhMWE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEadS4=\n','2012-08-14 20:25:26'),('6fc113dc3cd013aa32b8acf3e65e3732','YmRkMmUxMGRmOTdjMzEzZTlkNjA1YzRiY2JhYmU4ZTAxM2RhZDIxYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEbdS4=\n','2012-08-14 20:29:39'),('ba3c2641538d5d28ecfcd505e6b3edd4','YmQ3NzI1ODJjODU3MTA2ODAwMzg0MzlkODc3ODU2Yzg2OTZmNTUxMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEcdS4=\n','2012-08-14 20:37:00'),('8af51e8369ff1568b1a55b2a29852d2e','YjJmZjE3ZGUwZWJkZTlkNzBkY2I5MDQ1M2U1MmNiZmQzNzNmMGYxZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEddS4=\n','2012-08-14 20:39:27'),('b5e9f64a70d9ec217eb9678ab280f66d','NjZlY2YwOWQ3ZTc0ZjI2NTE0OTZlZWRjMzU1OGE0NzMxNmE1MzI5ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEedS4=\n','2012-08-14 20:49:30'),('7c284508e54f943f23b1cdfd1bc84692','ZDlhZGNiMWE3YzU5MDg5N2YyYjRjNTc4MmQ5YWYzOTUwN2RlMGY5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEfdS4=\n','2012-08-14 20:53:54'),('79a190f8f14e2dbdcfaf090059d963b4','OTAzMDVmNjc1YTJhZDkxYjgyMGZlNDYxZDczOTBmNDVlYzliZDkyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEgdS4=\n','2012-08-14 21:05:16'),('110a88e141bd54830c4fcc2b4a682fe7','ZTlmMzdmN2IxYzg0ZjIwMjVlNDlhMzVmNDA5YjBhMmQ2NjczZWVmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEhdS4=\n','2012-08-14 21:17:21'),('26e39aec187b7cef06276ccbcf119062','YmEyZDI3NmJkNzVhYjlhYTMwM2E5NzUxOGYzZmJhMjMyMzMxYjc2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEidS4=\n','2012-08-14 21:20:02'),('87a845919b3dcf84ffc29ebbdf72790f','MjMzM2MzODczZGQxNGM3MmQ5OTA1ODAwYjBjMWUxYWQxYzMwZjhiNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEjdS4=\n','2012-08-14 21:23:11'),('f5e117aba0f082db18ede7ae82be12e9','Mjk1MTk2ZWJiZWRjMzQyYmIyNmE5NmIzZGI3NTRiM2Y2NGU1ODI1MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEkdS4=\n','2012-08-14 21:25:10'),('1691475cf6a320e6b60e3fb9975c8ffa','ZWE5NDI2ZDdmOTBkNTAzMjc5ZDkxNjNmYjMwMmE1N2FhYTFiOWE0YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEldS4=\n','2012-08-15 14:17:08'),('6637c3344b5d1a2a904896687980d1a0','NTlhZWI0NDNhMmZjMDEwOTk2ZGE3ZmY3YWJiMjU1OTFkNTI2ZjlkYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEmdS4=\n','2012-08-16 12:56:18'),('58fb291fe7b44bd0eb3f0c54ea998742','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-17 15:52:06'),('710dba1ccf35a3d6954891bd6d6f0efa','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-09-01 23:00:38'),('5504db4b97a84038a00e9c051062cc15','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-09-01 23:01:06'),('72efb779516b97a5aeb2087bde822b22','Y2ZlMWE1MmFiMTBjNTdjODc5Zjc1NzY2Njc2ZjQyZmYwMmFmZWU4ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEpdS4=\n','2012-10-12 11:55:28'),('837879b6abb8b89abecc10aa65eca266','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-04 12:08:13'),('cc592b404d2b230635f9e4b386b77e99','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-10-12 11:57:29'),('c555465318ead1dff1ac7e7cc5545245','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-10-12 12:02:01'),('ae367df65d811495a6d15403dde70dd2','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-10-12 12:22:54'),('62c88ca71252c783180ffa8fbb17d2eb','OGNlYzcyYTA2OTJlYjBlMDA0ZTI1YjAwNGUzY2I4N2Y1Y2ViN2IwNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEtdS4=\n','2012-10-28 19:32:24'),('d10afcc9dc984757ae03d9137327e0b4','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-10-17 21:57:05'),('4220245baa37ab2bc248bf3c7465bacb','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-10-19 21:13:53'),('428bfe59d3b441a7cd1cd9296747f589','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-10-19 23:01:08'),('89a915463f5638ffbb441595355242aa','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-10-26 12:02:47'),('edc5caa5d169d5ed22e213438b4cde66','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-10-26 15:41:27'),('dbdf0018d6eb5164b4dd30730c05ef1b','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-11-05 13:29:10'),('6973d16542b025d171ffb5bc500bff03','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-11-05 13:36:41'),('d7682b89af25097aadb9d899633b7eb7','MWFlZjExMjcwYmJhMjA5OGY1ODU1OTEwZDE5NzU5ODNjMmU1YTE5YzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEudS4=\n','2012-10-29 11:01:04'),('12b3412bafeb7c8e93653865908646f8','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-11-11 22:45:13'),('752d0d7fb7d6ddd0be49ca0e7e150ca0','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-11-11 22:47:51'),('7e90b59ca3d619fd554fe2b2f246f337','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-11-16 13:04:34'),('5943ede4ec64f0b2301549c112830dcb','MzI0YmZmN2MxM2U0YTZhZDY1MjY4YTliYjdhYWU2NWIzM2QxZjEyNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigExdS4=\n','2012-11-15 12:23:00'),('79315708a64aa458b9e64ba01969b519','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-11-13 17:57:04'),('049643f5c2c2cc349b8e713056dbff8d','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-11-16 13:06:05'),('fda59ca61da8a6c7bdbe05e91e87afad','MmZjYTQzYzRkMzUxNDQ1MzZkOTZmYWIxYzQ5MGY5ZDRiM2EwOTJiMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEzdS4=\n','2012-11-30 23:54:46'),('8c633005891451ad2009b11acfca5a0f','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-11-18 20:04:12'),('85e04feb7ca55c6a981e27829349755c','MjA4M2E5YTg0ZDlhMjhjODY0MjAwZjRjOTA2ZGE2NzQyNTY2Mjc2NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE0dS4=\n','2012-12-09 18:25:14'),('44a236ba88358ee99cc4316e2b61e02b','NDI4NGMwZDkyOTQzNzU3OGNmMjljNzI0ZGI0YTcwNjRlNTE2MzMyMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE4dS4=\n','2013-02-02 16:20:28'),('7a63e8e9a00113ccd6e7eb6365a6eecf','NjRlNmQ2YTM4MjAyY2I2MjE5NzhmNTcxNjkyMmE0N2I4M2UyYjNhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE2dS4=\n','2013-02-01 22:30:04'),('6980dd356c4f50f39f9e45e6172be4e7','NzI5OTk2MDFmZTFiNzBhN2E1N2RhMjJhNDJkOTdhMzM3NDg4OGYxOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE3dS4=\n','2013-02-01 22:33:02'),('e548e812c58f3913761e52bc301c2602','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-02 13:48:30'),('a240a72ab7ecb4aadf08e7515426ff9e','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2013-02-02 18:26:23'),('de84127a03d3813277476458ae2022b9','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2013-02-02 18:27:06'),('cdc4baf053d7841600e2cdfb4415449c','MjlkZGVkMjhkOGJkY2IxM2M1ZTNkMzk3MjY5MzNmYTMyMzY4YzFkYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE5dS4=\n','2013-02-06 18:15:51'),('b20154c1f4a5a81958a9d719ce7162cd','ZTVlMDkzN2U5Nzc3NWY5MTQ4ODI4MTkxZTg3NzNhMjdhMDFkMGM2MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE6dS4=\n','2013-02-06 18:17:50'),('134d95ea688085d1a8f4e7dc30b369c8','MmI1NDVlMmYwNDU2MzYwMTY5ZWM1NTExOTk2N2I4MDllODNlMDQ0NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE7dS4=\n','2013-02-06 18:33:28'),('f609166958837a0df21ba553bd156533','NmM3OWRhNTM5YTA3OThkY2YyZjRlYzFhZmUzMDczZjMwYTU1NmZhMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE8dS4=\n','2013-02-06 18:45:36'),('cda1bae6e81149463baf66110de640b5','ODk2ZWFmNzc4MGJiOTZhMDYxN2NmNjUzMDEyYTNlNzYxMzU5M2QwZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE9dS4=\n','2013-02-06 18:52:43'),('43beded3fb8f53ac0dfc04db4d055ef1','NTdmOWFjOTEyNjc4OTBlMzVmZjQwNTA2NjkyZjExNWU5ODAyZWJkNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE+dS4=\n','2013-02-06 21:27:00'),('29be4339af1dbec97101cd23c6bcb672','MmQ5NGU2OWUyODc3NWRkZWEzMGNiNTkzZjRkNmRlYjc5ZTE4Mzg5MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE/dS4=\n','2013-02-06 21:30:11'),('66ec2fcd79c17ba944bacc2cfe824d2d','MGUyMzM4YzRiM2ZlYmZiZTA2OTkxZWZlZmFjOTI4NjJlM2U4Y2Q2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFAdS4=\n','2013-02-06 21:34:19'),('97f6655ab9be5dbecf5af8569488d302','NjgxOWUxYjBhOWMxZjM3MDY0YWRmZTRhNzRmM2IyOGNkODgzN2I5NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFBdS4=\n','2013-02-06 21:49:29'),('6e3bca5b0d37197753eec3ea5f85a0f3','NzM2YTU1ODM4NDYxNzllMWEyYjYyNjEwNWY1NGRkMDEzOGNjYTMzYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFCdS4=\n','2013-02-06 22:01:39'),('54b8a73ddc8777340a1acfa6fa1c1ff8','MmQ1ZTAzNTdiYmNkNDA5MWM2NTJjYjQ3NTNiYzUyNDYyMzFhMDllZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFDdS4=\n','2013-02-06 22:09:45'),('08fa261fe5dafff12265248d446f058d','ZTQ0Y2ZmNjRmNjliYjg1Yzc0MWYwNDZmNTgxZWRlOTFmNDBjNzAwMDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFEdS4=\n','2013-02-06 22:12:05'),('c4625ac94d829aa7f7389df047a1e6fc','YjZmMmQ4NjBjZjM2NGMyNGY2NWJlMDU5NWNkZGUwMjVlNzUwMjNlNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFFdS4=\n','2013-02-06 22:13:07'),('f7d0ba898ac995d6f8874af336c6a2c2','MTY5ZjA3YzNkYzE2ZGQxY2Q3MDJiNTIxMzU0ZDJmZWU1Y2U4ZGU2MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFGdS4=\n','2013-02-06 22:21:54'),('f08d8526a00a69d2c6a756ab43afe9cc','YjQxZDBiYTU2NTYxYTA1MTk0ZTE2NzAxOGJiZjM1NzAxOWRjZmE1ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFHdS4=\n','2013-02-06 22:31:03'),('f8ad6fe4fabde1093d42894dc0a97ebd','Njk0MzI0N2NjOTVhYjNiNTE0YjhhZTIyOGViZGM2ODlhMjk5MGVlZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFIdS4=\n','2013-02-06 22:36:56'),('03d5c2871d232b5b0fb42f06229c731d','NzkwMjIxYTIwY2U4MmU0OTVhOTZmZjdmMzBlYzIxMTkxMTQxOWMxZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFJdS4=\n','2013-02-06 22:41:06'),('3437be0d4024afb731105de981d53ca9','Mjg4NmJmMmE0NzZiMTc5MDc3YTkwNjVmNGM4YzRkNDgwN2UzZjQxYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFKdS4=\n','2013-02-06 23:08:21'),('beae5e19a92da8e6b51e1650da91db16','MjBhY2E0YmNlYzBiNWY3MTIwYjIyMDNkOTVhOTRhNmQ3ZWVlZWMwZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFLdS4=\n','2013-02-07 01:46:52'),('2f410040715b37c9a7ada4240117262b','YWZlMjRmZWFhZmQ3ZWRkNTBmYTk3NzdhZWFmYjA1MzAxMDBjMjcyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFMdS4=\n','2013-02-07 01:49:05'),('813353a59118d3da9ebc7debc9e5a4bd','OWYxYWE3OGE1ODYyMmM2ZTJjMDMxZDg5NjdjOTA3ZTAzYjU1OWU4NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFNdS4=\n','2013-02-07 02:18:31'),('0d7e0f9e2ae8bc62cf0a799ae36a088b','OGY2ZWI2NTFmNDU4ZmE1YTU4ZTM2ZGU3ODFkYWQ1YzdlZWRlNGUwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFOdS4=\n','2013-02-07 02:21:59'),('24fea32eff2dcac2964f1bd941eb101b','Njk1NzIxOWYzZGZiNjM2MjQ0ZTNlNzZlNjExM2Q4ODA1YmI5NTgzYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFPdS4=\n','2013-02-07 02:30:01'),('99ce698ffc764df8eb588b9d4f521cce','OTNlMmQ3ZTU5YjExNGJhMjQwMDRmMTY2NjdkZjczMjYyNjYwNjljNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFQdS4=\n','2013-02-07 02:50:48'),('341c6a0e9b5ad2684137a50ce591f253','NGE5ODQxMjY2ZmU5ZjBlNmJmMWVkZDI1ZjdiZjUxNmRkYjEwNTNlNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFRdS4=\n','2013-02-07 02:51:45'),('1e4c2e09dd3ee18ffc7f82a98eee4fcd','Y2I3OGMyYjFlYTM1MTA3YjIyNGM5MGI3Nzg3MmNjYTcwZTA4N2MxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFSdS4=\n','2013-02-07 02:59:43'),('f9481d6c24f78ff43fc92b1dc7dece72','MGZmZTZiZjA2NzdlM2QxM2ZhYTE2NmQwNzJkNWU4NDMyNjNkMGVlOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFTdS4=\n','2013-02-07 03:02:58'),('515a044ed015d2edfeb33821a3d3f85a','MDk1NTYwNzdjNjAwOWYxZjdhMTM5MDU2OTFlN2ZmNTU5NGM3OTQxMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFUdS4=\n','2013-02-07 03:13:15'),('55db1b81f507e898fa83655ed04317f0','Nzc4MTRkNjU1YzNjZGVjYWI0ZGE2MTY0MjRjYWM2NjQyMGJmZGE2ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFVdS4=\n','2013-02-07 03:14:19'),('02f761cf93262c0e99a6ff9b7a7c13f1','MTczM2FlY2Y0NDQ2NDY0YWU4OTIzZTc3OTE1M2VkNDAzMTc5Y2Q2MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFWdS4=\n','2013-02-07 03:15:00');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-25 21:23:14
