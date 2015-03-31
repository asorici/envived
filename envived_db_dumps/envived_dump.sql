-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: envived
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.14.04.1

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(149,'Can change program feature',50,'change_programfeature'),(148,'Can add program feature',50,'add_programfeature'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add user profile',8,'add_userprofile'),(23,'Can change user profile',8,'change_userprofile'),(24,'Can delete user profile',8,'delete_userprofile'),(25,'Can add environment',9,'add_environment'),(26,'Can change environment',9,'change_environment'),(27,'Can delete environment',9,'delete_environment'),(28,'Can add layout',10,'add_layout'),(29,'Can change layout',10,'change_layout'),(30,'Can delete layout',10,'delete_layout'),(31,'Can add area',11,'add_area'),(32,'Can change area',11,'change_area'),(33,'Can delete area',11,'delete_area'),(34,'Can add feature',12,'add_feature'),(35,'Can change feature',12,'change_feature'),(36,'Can delete feature',12,'delete_feature'),(37,'Can add announcement',13,'add_announcement'),(38,'Can change announcement',13,'change_announcement'),(39,'Can delete announcement',13,'delete_announcement'),(40,'Can add annotation',14,'add_annotation'),(41,'Can change annotation',14,'change_annotation'),(42,'Can delete annotation',14,'delete_annotation'),(43,'Can add history',15,'add_history'),(44,'Can change history',15,'change_history'),(45,'Can delete history',15,'delete_history'),(46,'Can add privacy',16,'add_privacy'),(47,'Can change privacy',16,'change_privacy'),(48,'Can delete privacy',16,'delete_privacy'),(49,'Can add user context',17,'add_usercontext'),(50,'Can change user context',17,'change_usercontext'),(51,'Can delete user context',17,'delete_usercontext'),(52,'Can add log entry',18,'add_logentry'),(53,'Can change log entry',18,'change_logentry'),(54,'Can delete log entry',18,'delete_logentry'),(55,'Can add api access',19,'add_apiaccess'),(56,'Can change api access',19,'change_apiaccess'),(57,'Can delete api access',19,'delete_apiaccess'),(58,'Can add api key',20,'add_apikey'),(59,'Can change api key',20,'change_apikey'),(60,'Can delete api key',20,'delete_apikey'),(61,'Can add registration profile',21,'add_registrationprofile'),(62,'Can change registration profile',21,'change_registrationprofile'),(63,'Can delete registration profile',21,'delete_registrationprofile'),(64,'Can add facebook user',22,'add_facebookuser'),(65,'Can change facebook user',22,'change_facebookuser'),(66,'Can delete facebook user',22,'delete_facebookuser'),(67,'Can add facebook like',23,'add_facebooklike'),(68,'Can change facebook like',23,'change_facebooklike'),(69,'Can delete facebook like',23,'delete_facebooklike'),(70,'Can add facebook profile',24,'add_facebookprofile'),(71,'Can change facebook profile',24,'change_facebookprofile'),(72,'Can delete facebook profile',24,'delete_facebookprofile'),(73,'Can add research profile',25,'add_researchprofile'),(74,'Can change research profile',25,'change_researchprofile'),(75,'Can delete research profile',25,'delete_researchprofile'),(97,'Can add facebook profile',33,'add_facebookprofile'),(98,'Can change facebook profile',33,'change_facebookprofile'),(99,'Can delete facebook profile',33,'delete_facebookprofile'),(100,'Can add user sub profile',34,'add_usersubprofile'),(101,'Can change user sub profile',34,'change_usersubprofile'),(102,'Can delete user sub profile',34,'delete_usersubprofile'),(139,'Can add user',47,'add_facebookcustomuser'),(140,'Can change user',47,'change_facebookcustomuser'),(141,'Can delete user',47,'delete_facebookcustomuser'),(142,'Can add open graph share',48,'add_opengraphshare'),(143,'Can change open graph share',48,'change_opengraphshare'),(144,'Can delete open graph share',48,'delete_opengraphshare'),(145,'Can add facebook invite',49,'add_facebookinvite'),(146,'Can change facebook invite',49,'change_facebookinvite'),(147,'Can delete facebook invite',49,'delete_facebookinvite'),(150,'Can delete program feature',50,'delete_programfeature'),(151,'Can add program annotation',51,'add_programannotation'),(152,'Can change program annotation',51,'change_programannotation'),(153,'Can delete program annotation',51,'delete_programannotation'),(154,'Can add session',52,'add_session'),(155,'Can change session',52,'change_session'),(156,'Can delete session',52,'delete_session'),(157,'Can add presentation',53,'add_presentation'),(158,'Can change presentation',53,'change_presentation'),(159,'Can delete presentation',53,'delete_presentation'),(160,'Can add speaker',54,'add_speaker'),(161,'Can change speaker',54,'change_speaker'),(162,'Can delete speaker',54,'delete_speaker'),(163,'Can add booth description feature',55,'add_boothdescriptionfeature'),(164,'Can change booth description feature',55,'change_boothdescriptionfeature'),(165,'Can delete booth description feature',55,'delete_boothdescriptionfeature'),(166,'Can add booth description annotation',56,'add_boothdescriptionannotation'),(167,'Can change booth description annotation',56,'change_boothdescriptionannotation'),(168,'Can delete booth description annotation',56,'delete_boothdescriptionannotation'),(169,'Can add booth product vote annotation',57,'add_boothproductvoteannotation'),(170,'Can change booth product vote annotation',57,'change_boothproductvoteannotation'),(171,'Can delete booth product vote annotation',57,'delete_boothproductvoteannotation'),(172,'Can add booth product',58,'add_boothproduct'),(173,'Can change booth product',58,'change_boothproduct'),(174,'Can delete booth product',58,'delete_boothproduct'),(175,'Can add people feature',59,'add_peoplefeature'),(176,'Can change people feature',59,'change_peoplefeature'),(177,'Can delete people feature',59,'delete_peoplefeature'),(178,'Can add social media feature',60,'add_socialmediafeature'),(179,'Can change social media feature',60,'change_socialmediafeature'),(180,'Can delete social media feature',60,'delete_socialmediafeature'),(181,'Can add order feature',61,'add_orderfeature'),(182,'Can change order feature',61,'change_orderfeature'),(183,'Can delete order feature',61,'delete_orderfeature'),(184,'Can add order annotation',62,'add_orderannotation'),(185,'Can change order annotation',62,'change_orderannotation'),(186,'Can delete order annotation',62,'delete_orderannotation'),(187,'Can add menu category',63,'add_menucategory'),(188,'Can change menu category',63,'change_menucategory'),(189,'Can delete menu category',63,'delete_menucategory'),(190,'Can add menu item',64,'add_menuitem'),(191,'Can change menu item',64,'change_menuitem'),(192,'Can delete menu item',64,'delete_menuitem'),(193,'Can add description feature',65,'add_descriptionfeature'),(194,'Can change description feature',65,'change_descriptionfeature'),(195,'Can delete description feature',65,'delete_descriptionfeature'),(196,'Can add description annotation',66,'add_descriptionannotation'),(197,'Can change description annotation',66,'change_descriptionannotation'),(198,'Can delete description annotation',66,'delete_descriptionannotation'),(199,'Can add conference role feature',67,'add_conferencerolefeature'),(200,'Can change conference role feature',67,'change_conferencerolefeature'),(201,'Can delete conference role feature',67,'delete_conferencerolefeature'),(205,'Can add conference role',69,'add_conferencerole'),(206,'Can change conference role',69,'change_conferencerole'),(207,'Can delete conference role',69,'delete_conferencerole'),(208,'Can add chair role credential',70,'add_chairrolecredential'),(209,'Can change chair role credential',70,'change_chairrolecredential'),(210,'Can delete chair role credential',70,'delete_chairrolecredential');
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
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'alex','','','alex@email.com','pbkdf2_sha256$10000$hAkTRkICyect$tECqSTHdraQBmA/yJpMt1Lzrc+p/blc9RWfs3S8qG+E=',1,1,1,'2014-05-12 16:24:55','2012-02-28 17:21:18'),(2,'user_1_email_com','Alexandru','Sorici','user_1@email.com','pbkdf2_sha256$10000$ZJxnIm7z2pXy$IvJzyjAOsc0GMbfRPtL1mSq38sSLGZVzva2vVorrujw=',0,1,0,'2014-05-13 14:56:30','2012-02-28 17:21:39'),(87,'aiwo_admin','AIWO','Admin','tech@aiolympics.ro','sha1$43b36$308c96475be3a72fef20be1b071bf991a6247ca8',1,1,1,'2013-01-25 20:41:01','2013-01-25 20:41:01'),(167,'a4c6cb009de242c2a8f11e7e0d72b5','','','','!',0,1,0,'2013-10-24 13:18:59','2013-10-24 13:18:59'),(166,'af1d4c3b8d084e37830e3fc82f6bcb','','','','!',0,1,0,'2013-10-24 12:32:43','2013-10-24 12:32:43'),(157,'alfa','Alfa','Beta','alfa@beta.com','sha1$f7b02$02765c9079d2c480e9b244d13602283c9d5338f3',0,1,0,'2013-02-19 23:19:41','2013-02-19 20:58:08'),(165,'10d8d03afe71482e9609ee541e9ddd','','','','!',0,1,0,'2013-10-24 12:30:14','2013-10-24 12:30:14');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booth_description_boothdescriptionannotation`
--

DROP TABLE IF EXISTS `booth_description_boothdescriptionannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booth_description_boothdescriptionannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `topic_type` varchar(32) NOT NULL,
  `topic_title` varchar(128) NOT NULL,
  `text` longtext NOT NULL,
  `booth_product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`annotation_ptr_id`),
  KEY `booth_description_boothdescriptionannotation_18c5c22b` (`booth_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booth_description_boothdescriptionannotation`
--

LOCK TABLES `booth_description_boothdescriptionannotation` WRITE;
/*!40000 ALTER TABLE `booth_description_boothdescriptionannotation` DISABLE KEYS */;
INSERT INTO `booth_description_boothdescriptionannotation` VALUES (518,'booth_description','House Map','should appear with my user name',NULL),(519,'booth_description','Image Retrieval based on BoW model','test content',NULL),(523,'booth_description','University of Bucharest, Faculty of Mathematics and Computer Science','should work as intended',NULL),(524,'booth_description','University of Bucharest, Faculty of Mathematics and Computer Science','bdfhjh hffhh\nfgjbhj jdehj',NULL),(525,'booth_description','University of Bucharest, Faculty of Mathematics and Computer Science','jbvcb jjj fsdvgb\nvgjnn kjfdvjh sjhhj\nghjhh',NULL),(526,'booth_description','University of Bucharest, Faculty of Mathematics and Computer Science','hfdhg hfff hahahaha',NULL),(528,'booth_description','House Map','hgxf gjhggj jddghb \nfhbhj yfdcj.',NULL),(536,'booth_description','House Map','test',NULL),(537,'booth_description','University of Bucharest, Faculty of Mathematics and Computer Science','tedt',NULL),(538,'booth_description','University of Bucharest, Faculty of Mathematics and Computer Science','test2',NULL),(539,'booth_description','University of Bucharest, Faculty of Mathematics and Computer Science','twst cimmrnt',NULL),(540,'booth_description','House Map','test house map',NULL);
/*!40000 ALTER TABLE `booth_description_boothdescriptionannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booth_description_boothdescriptionfeature`
--

DROP TABLE IF EXISTS `booth_description_boothdescriptionfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booth_description_boothdescriptionfeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  `image_url` varchar(256) DEFAULT NULL,
  `contact_email` varchar(128) DEFAULT NULL,
  `contact_website` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booth_description_boothdescriptionfeature`
--

LOCK TABLES `booth_description_boothdescriptionfeature` WRITE;
/*!40000 ALTER TABLE `booth_description_boothdescriptionfeature` DISABLE KEYS */;
INSERT INTO `booth_description_boothdescriptionfeature` VALUES (48,'The faculty of Mathematics and Computer Science is one of the important faculties of the University of Bucharest, being well-known and unanimously apreciated abroad.\r\nThe faculty has 180 staff members, many of them with a high reputation. All the staff members (starting with the lecturers), have the scientific title of doctor in mathematics, and all assistant lecturers and preparators are candidates for a doctor\'s degree. Five of the active or consultant professors are members or corresponding members of the Romanian Academy. The majority of the teaching staff are fellows of some prestigious scientific societies in the country or abroad. Many renowned professors of mathematics and computer science from prestigious universities all around the world are romanian at origins and started their careers at our faculty.','http://192.168.1.108:8080/envsocial/media/images/logo_unibuc.png','','http://fmi.unibuc.ro/ro/prezentare/informatii_generale/'),(49,'The Faculty of Engineering is a component of “Petru Maior” University from Tg. Mures, a state institution for higher education and scientific research, part of the national educational system of Romania, institutionally recognized and accredited.\r\nHigher engineering education in Targu Mures has had a tradition of 25 years. The members of the full-time and part-time teaching staff of the Faculty of Engineering, as well as the adequate teaching equipment give current specialized theoretical and practical information for two large domains and six heading engineering specializations.','http://192.168.1.108:8080/envsocial/media/images/logo_upm.png','','http://www.upm.ro/index.html');
/*!40000 ALTER TABLE `booth_description_boothdescriptionfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booth_description_boothproduct`
--

DROP TABLE IF EXISTS `booth_description_boothproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booth_description_boothproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booth_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` longtext NOT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `website_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booth_description_boothproduct_1372c1b3` (`booth_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booth_description_boothproduct`
--

LOCK TABLES `booth_description_boothproduct` WRITE;
/*!40000 ALTER TABLE `booth_description_boothproduct` DISABLE KEYS */;
INSERT INTO `booth_description_boothproduct` VALUES (7,48,'House Map','Google\'s profiling algorithm applied to the real estate market - House Map is an Artificial Intelligence powered recommendation system, delivered through an elegant iOS app, that transforms and enhances the property finding experience.','',''),(8,49,'Kinect Virtual Store','A virtual store where clients can interact with the contents of a clothing store from the comfort of their own home through movement and gesture with Microsot Kinect.','',''),(6,48,'Word Graph Algorithm for Summarizing Twitter Streams','The project is generating summaries for streams of microblogging posts (such as tweets). A summary is represented as a small set of sentences. The summaries are useful for human operators, in order to quickly go through and understand large streams.','',''),(5,48,'Image Retrieval based on BoW model','This project shows a new state-of-art method for image retrieval, image categorization, and related tasks, in simple Matlab interface. The new learning method is based on the bag-of-words (BoW) model. A vocabulary (or codebook) of visual words is obtained by clustering local image descriptors extracted from images. An image is then represented as a histogram of visual words (or bag-of-visual-words). Next, kernel methods are used to compare such histograms.','','');
/*!40000 ALTER TABLE `booth_description_boothproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booth_description_boothproductvoteannotation`
--

DROP TABLE IF EXISTS `booth_description_boothproductvoteannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booth_description_boothproductvoteannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `booth_product_id` int(11) NOT NULL,
  PRIMARY KEY (`annotation_ptr_id`),
  KEY `booth_description_boothproductvoteannotation_18c5c22b` (`booth_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booth_description_boothproductvoteannotation`
--

LOCK TABLES `booth_description_boothproductvoteannotation` WRITE;
/*!40000 ALTER TABLE `booth_description_boothproductvoteannotation` DISABLE KEYS */;
INSERT INTO `booth_description_boothproductvoteannotation` VALUES (535,7),(527,7),(521,6),(520,5),(517,7);
/*!40000 ALTER TABLE `booth_description_boothproductvoteannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference_role_chairrolecredential`
--

DROP TABLE IF EXISTS `conference_role_chairrolecredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_role_chairrolecredential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_profile_id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_profile_id` (`user_profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference_role_chairrolecredential`
--

LOCK TABLES `conference_role_chairrolecredential` WRITE;
/*!40000 ALTER TABLE `conference_role_chairrolecredential` DISABLE KEYS */;
INSERT INTO `conference_role_chairrolecredential` VALUES (1,2,'pbkdf2_sha256$10000$VaCarH9S1oOo$ZlLRuRrWZUEon44UMpAeSWvpaGFAVw5Z8uZAFHoAKMc='),(2,1,'pbkdf2_sha256$10000$qscEPTh2IacF$f16lvKZ3Lj0Mt54KtMNGl8nS5CO/hTa4G2DkWjX/MKM=');
/*!40000 ALTER TABLE `conference_role_chairrolecredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference_role_conferencerole`
--

DROP TABLE IF EXISTS `conference_role_conferencerole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_role_conferencerole` (
  `conference_id` int(11) NOT NULL,
  `user_profile_id` int(11) NOT NULL,
  `role` varchar(32) NOT NULL,
  PRIMARY KEY (`user_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference_role_conferencerole`
--

LOCK TABLES `conference_role_conferencerole` WRITE;
/*!40000 ALTER TABLE `conference_role_conferencerole` DISABLE KEYS */;
INSERT INTO `conference_role_conferencerole` VALUES (60,1,'participant'),(60,2,'session_chair');
/*!40000 ALTER TABLE `conference_role_conferencerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference_role_conferencerolefeature`
--

DROP TABLE IF EXISTS `conference_role_conferencerolefeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference_role_conferencerolefeature` (
  `feature_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference_role_conferencerolefeature`
--

LOCK TABLES `conference_role_conferencerolefeature` WRITE;
/*!40000 ALTER TABLE `conference_role_conferencerolefeature` DISABLE KEYS */;
INSERT INTO `conference_role_conferencerolefeature` VALUES (60);
/*!40000 ALTER TABLE `conference_role_conferencerolefeature` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=541 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_annotation`
--

LOCK TABLES `coresql_annotation` WRITE;
/*!40000 ALTER TABLE `coresql_annotation` DISABLE KEYS */;
INSERT INTO `coresql_annotation` VALUES (540,12,NULL,NULL,NULL,'booth_description_ann','2013-08-24 00:18:04'),(539,12,NULL,NULL,NULL,'booth_description_ann','2013-08-24 00:17:30'),(538,12,NULL,NULL,NULL,'booth_description','2013-08-20 18:07:35'),(537,12,NULL,NULL,NULL,'booth_description','2013-08-20 17:01:28'),(5,2,NULL,NULL,'dummy annotation 2 for area area_2','default','2012-02-28 17:21:49'),(6,2,NULL,NULL,'dummy annotation 3 for area area_2','default','2012-02-28 17:21:51'),(536,12,NULL,NULL,NULL,'booth_description','2013-08-15 16:54:13'),(535,12,NULL,NULL,NULL,'booth_product_vote','2013-08-15 16:53:51'),(534,NULL,12,NULL,NULL,'program','2013-08-15 16:51:32'),(533,NULL,12,NULL,NULL,'program','2013-08-15 16:50:50'),(532,NULL,12,NULL,NULL,'program','2013-08-15 16:49:42'),(531,NULL,12,157,NULL,'program','2013-02-19 23:21:07'),(38,5,NULL,2,'','default','2012-07-05 18:21:23'),(530,NULL,12,NULL,NULL,'program','2013-02-19 23:09:23'),(503,1,NULL,2,NULL,'order','2013-01-19 18:32:12'),(504,1,NULL,2,NULL,'order','2013-01-19 18:32:37'),(529,NULL,12,NULL,NULL,'program','2013-02-19 23:09:14'),(528,12,NULL,157,NULL,'booth_description','2013-02-19 22:23:30'),(527,12,NULL,NULL,NULL,'booth_product_vote','2013-02-19 22:21:46'),(526,12,NULL,NULL,NULL,'booth_description','2013-02-19 22:20:19'),(525,12,NULL,NULL,NULL,'booth_description','2013-02-19 22:19:26'),(524,12,NULL,NULL,NULL,'booth_description','2013-02-19 22:19:01'),(474,1,NULL,NULL,NULL,'order','2012-11-17 00:22:00'),(475,1,NULL,NULL,NULL,'order','2012-11-17 00:22:08'),(476,1,NULL,NULL,NULL,'order','2012-11-17 00:25:13'),(523,12,NULL,157,NULL,'booth_description','2013-02-19 21:34:37'),(522,NULL,12,157,NULL,'program','2013-02-19 21:26:41'),(521,12,NULL,157,NULL,'booth_product_vote','2013-02-19 21:23:14'),(520,12,NULL,157,NULL,'booth_product_vote','2013-02-19 21:22:55'),(519,12,NULL,157,NULL,'booth_description','2013-02-19 21:19:23'),(518,12,NULL,157,NULL,'booth_description','2013-02-19 21:06:19'),(517,12,NULL,157,NULL,'booth_product_vote','2013-02-19 21:05:43');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
  `img_thumbnail_url` varchar(256) DEFAULT NULL,
  `shape` longtext,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_area_25ab32ac` (`environment_id`),
  KEY `coresql_area_40833a8c` (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_area`
--

LOCK TABLES `coresql_area` WRITE;
/*!40000 ALTER TABLE `coresql_area` DISABLE KEYS */;
INSERT INTO `coresql_area` VALUES (1,1,'interest',NULL,'area_1','tag1;tag2;tag3',1,NULL,'POLYGON 10.0:10.0 100.0:400.0','2013-01-24 02:29:34'),(2,1,'interest',NULL,'area_2','tag1;tag2;tag3',1,NULL,'POLYGON 10.0:10.0 100.0:400.0','2012-07-31 00:57:30'),(3,1,'interest',NULL,'area_3','tag1;tag2;tag3',1,NULL,'POLYGON 10.0:10.0 100.0:400.0','2012-02-28 17:21:39'),(4,1,'interest',NULL,'area_4','tag1;tag2;tag3',1,NULL,'POLYGON 10.0:10.0 100.0:400.0','2012-02-28 17:21:39'),(5,11,'interest',NULL,'Blue Hall','',2,NULL,NULL,'2012-07-31 00:33:12'),(6,11,'interest',NULL,'Room 443D','',2,NULL,NULL,'2012-06-09 00:37:20'),(7,11,'interest',NULL,'Room 443C','',2,NULL,NULL,'2012-06-09 00:37:20'),(8,11,'interest',NULL,'University Hall','',2,NULL,NULL,'2012-06-09 00:37:20'),(9,12,'interest',87,'AI Talks (EC 105)','artificial intelligence;presentations;tech talks',3,'',NULL,'2013-02-08 16:09:31'),(10,12,'interest',87,'AUREL VLAICU University, Arad','senzor data aquisition;fuzzy logics',4,'',NULL,'2013-02-08 15:21:29'),(11,12,'interest',87,'Transilvania University of Brașov, Faculty of Mathematics and Computer Science','Neural Networks;Face Recognition',4,'',NULL,'2013-02-08 15:22:58'),(12,12,'interest',87,'University of Bucharest, Faculty of Mathematics and Computer Science','Image Retrieval;Kernel Methods;Text Stream Summarization;Recommender Systems',3,'',NULL,'2013-02-19 22:23:30'),(13,12,'interest',87,'Universitatea Petru Maior, Targu Mures','Microsoft Kinect ; Gesture Recognition ; Virtual Shopping',4,'',NULL,'2013-02-08 15:51:14'),(14,12,'interest',87,'State University of Moldova, Chisinau, Moldova','Decision Support Systems;E-Learning;Medical Modeling;Petri Nets;P Systems',4,'',NULL,'2013-02-08 15:58:44'),(15,12,'interest',87,'Google, Inc.','Semantic Web;Knowledge Graph;Internships',3,'',NULL,'2013-02-08 16:00:58'),(16,12,'interest',87,'Facebook, Inc.','HipHop;Infrastructure;Recruiting',3,'',NULL,'2013-02-08 16:02:25'),(17,12,'interest',87,'Adobe Romania','Intelligent Ads;Internships',3,'',NULL,'2013-02-08 16:10:44'),(18,12,'interest',87,'TeamNet International','Autonomous Systems;Distributed planning strategies;UAVs;Internships',3,'',NULL,'2013-02-08 16:04:41'),(19,12,'interest',87,'AQUASoft','Smart Environments;Ambient Intelligence;Internships',3,'',NULL,'2013-02-08 16:08:58'),(20,12,'interest',87,'University Politehnica of Bucharest, Faculty of Electronics and Telecommunications','Machine Learning;Speech recognition',4,'',NULL,'2013-02-11 12:08:50');
/*!40000 ALTER TABLE `coresql_area` ENABLE KEYS */;
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
  `img_thumbnail_url` varchar(256) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coresql_environment_5d52dd10` (`owner_id`),
  KEY `coresql_environment_63f17a16` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_environment`
--

LOCK TABLES `coresql_environment` WRITE;
/*!40000 ALTER TABLE `coresql_environment` DISABLE KEYS */;
INSERT INTO `coresql_environment` VALUES (1,2,'Environment1',NULL,'tag1;tag2;tag3',NULL,500,500,NULL,NULL,'2012-11-01 12:25:10'),(12,87,'AIWO 2013',NULL,'artificial intelligence;AI presentations;AI exhibitions;AI competition;Crafting Quest 3',NULL,NULL,NULL,44.435856,26.047433,'2013-02-19 23:21:07'),(11,2,'WIMS 2012 Conference',NULL,'conference;web intelligence;mining and semantics',NULL,500,500,NULL,NULL,'2012-06-09 00:37:20');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_feature`
--

LOCK TABLES `coresql_feature` WRITE;
/*!40000 ALTER TABLE `coresql_feature` DISABLE KEYS */;
INSERT INTO `coresql_feature` VALUES (1,NULL,1,'description',0,1,'test data for environment1','2012-10-30 18:02:26'),(2,NULL,1,'order',1,1,'{\"order_menu\": [{\"category\": \"Andrei\'s Beer\", \"items\": [{\"price\": \"free\", \"name\": \"RedBeer\", \"description\": \"Coolest beer in town!\"}, {\"price\": \"free\", \"name\": \"YellowBeer\", \"description\": \"Coolest beer in town!\"}, {\"price\": \"free\", \"name\": \"BlueBeer\", \"description\": \"Coolest beer in town!\"}]}, {\"category\": \"Andrei\'s Chips\", \"items\": [{\"price\": \"free\", \"name\": \"RedChips\", \"description\": \"Coolest chips in town!\"}, {\"price\": \"free\", \"name\": \"YellowChips\", \"description\": \"Coolest chips in town!\"}, {\"price\": \"free\", \"name\": \"BlueChips\", \"description\": \"Coolest chips in town!\"}]}]}','2013-01-22 13:09:45'),(3,1,NULL,'description',0,1,'test data for area_1','2012-03-14 12:21:19'),(5,2,NULL,'description',0,1,'test data for area_2','2012-03-14 12:21:19'),(7,3,NULL,'description',0,1,'test data for area_3','2012-03-14 12:21:19'),(9,4,NULL,'description',0,1,'test data for area_4','2012-03-14 12:21:19'),(35,5,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(33,NULL,11,'description',0,1,NULL,'2012-06-09 00:37:20'),(45,9,NULL,'description',0,1,NULL,'2013-01-28 16:01:09'),(36,5,NULL,'people',0,1,NULL,'2012-06-09 00:37:20'),(37,6,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(38,6,NULL,'people',0,1,NULL,'2012-06-09 00:37:20'),(39,7,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(40,7,NULL,'people',0,1,NULL,'2012-06-09 00:37:20'),(41,8,NULL,'description',0,1,NULL,'2012-06-09 00:37:20'),(42,8,NULL,'people',0,1,NULL,'2012-06-09 00:37:20'),(44,NULL,12,'program',1,1,NULL,'2013-02-04 22:57:45'),(49,13,NULL,'booth_description',0,1,NULL,'2013-02-11 14:13:23'),(48,12,NULL,'booth_description',0,1,NULL,'2013-02-11 14:10:57'),(60,NULL,12,'conference_role',1,1,NULL,'2014-05-13 14:56:30');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_privacy`
--

LOCK TABLES `coresql_privacy` WRITE;
/*!40000 ALTER TABLE `coresql_privacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `coresql_privacy` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_researchprofile`
--

LOCK TABLES `coresql_researchprofile` WRITE;
/*!40000 ALTER TABLE `coresql_researchprofile` DISABLE KEYS */;
INSERT INTO `coresql_researchprofile` VALUES (1,'Unversity Politehnica of Bucharest','multi-agent systems;context representation and management;ambient intelligence');
/*!40000 ALTER TABLE `coresql_researchprofile` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_usercontext`
--

LOCK TABLES `coresql_usercontext` WRITE;
/*!40000 ALTER TABLE `coresql_usercontext` DISABLE KEYS */;
INSERT INTO `coresql_usercontext` VALUES (1,2,12,NULL,0),(10,1,12,NULL,0),(67,166,1,NULL,0),(66,165,1,NULL,0),(60,157,12,NULL,0),(68,167,1,NULL,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_userprofile`
--

LOCK TABLES `coresql_userprofile` WRITE;
/*!40000 ALTER TABLE `coresql_userprofile` DISABLE KEYS */;
INSERT INTO `coresql_userprofile` VALUES (1,1,'2014-05-12 10:45:03',0,NULL),(2,2,'2013-02-07 16:23:00',0,NULL),(87,87,'2013-01-25 20:41:01',0,NULL),(157,157,'2013-02-19 23:21:07',0,'APA91bEWuAiaBkk2I658xs3eNxHs2XcoTCQe_A_Ivsx1De39rU0r1E_0z0RHY7aByzrQbeq5R9Mu65WAXRyqGpBRbhgo5Dbe5RhbcPPF_EznsuOUrKzBmU-ffLgRL90a8UBHPyhfjQW3GF0g_50f55NRd9E0Yy-aoQ'),(165,165,'2013-10-24 12:30:14',1,NULL),(166,166,'2013-10-24 12:32:43',1,NULL),(167,167,'2013-10-24 13:18:59',1,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coresql_usersubprofile`
--

LOCK TABLES `coresql_usersubprofile` WRITE;
/*!40000 ALTER TABLE `coresql_usersubprofile` DISABLE KEYS */;
INSERT INTO `coresql_usersubprofile` VALUES (1,2);
/*!40000 ALTER TABLE `coresql_usersubprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_descriptionannotation`
--

DROP TABLE IF EXISTS `description_descriptionannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description_descriptionannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`annotation_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_descriptionannotation`
--

LOCK TABLES `description_descriptionannotation` WRITE;
/*!40000 ALTER TABLE `description_descriptionannotation` DISABLE KEYS */;
INSERT INTO `description_descriptionannotation` VALUES (38,'some dummy text for area 5');
/*!40000 ALTER TABLE `description_descriptionannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description_descriptionfeature`
--

DROP TABLE IF EXISTS `description_descriptionfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description_descriptionfeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  `newest_info` longtext,
  `img_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description_descriptionfeature`
--

LOCK TABLES `description_descriptionfeature` WRITE;
/*!40000 ALTER TABLE `description_descriptionfeature` DISABLE KEYS */;
INSERT INTO `description_descriptionfeature` VALUES (3,'Order from Ciortea\'s, the coolest bar in town!',NULL,NULL),(5,'Order from Ciortea\'s, the coolest bar in town!',NULL,NULL),(1,'Order from Ciortea\'s, the coolest bar in town! Situated on the intersection between Calea Victoriei and Bld. Regina Elisabeta, it is the place to be after a hard day\'s work. Enjoy a varied menu and a pleasurable ambiance with your friends and family.','Chech out the latest cocktails we have added.','http://192.168.1.106:8000/envsocial/media/images/placeholder.jpg'),(33,'The 2nd International Conference on Web Intelligence, Mining and Semantics (WIMS\'12) is organised under the auspices of University of Craiova. This is the second in a new series of conferences concerned with intelligent approaches to transform the World Wide Web into a global reasoning and semantics-driven computing machine. ',NULL,NULL),(35,'The Blue Hall will host the talks by the invited speakers and Tutorial 1.',NULL,NULL),(37,'Room 443D will host Sessions 1, 3, 5, 7, 9 and Tutorials 2 and 4.',NULL,NULL),(39,'Room 443C will host Sessions 2, 4, 6, 8, 10 and Tutorials 3 and 5.',NULL,NULL),(41,'University Hall will host Poster Sessions and Coffee Breaks.',NULL,NULL),(45,'View the list of exciting talks about Artificial Intelligence technologies and techniques that are\r\nin use today at various national and international universities and companies.','','');
/*!40000 ALTER TABLE `description_descriptionfeature` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-06-09 00:35:38',1,9,'9','WIMS 2012 Conference(9)',3,''),(2,'2012-06-09 00:37:00',1,9,'10','WIMS 2012 Conference(10)',3,''),(3,'2012-07-06 13:37:55',1,25,'1','Unversity Politehnica of Bucharest ## [u\'multi-agent systems\', u\'context representation\', u\'ambient intelligence\']',1,''),(4,'2012-07-06 13:38:16',1,25,'1','Unversity Politehnica of Bucharest ## [u\'<coresql.db.objects.TagList object at 0xa1e99cc>\']',2,'Changed userprofile and research_interests.'),(5,'2012-07-06 13:38:51',1,25,'2','Unversity Politehnica of Bucharest ## [u\'multi-agent systems\', u\'privacy aware systems\', u\'ambient intelligence\']',1,''),(6,'2012-07-06 14:59:15',1,25,'1','Unversity Politehnica of Bucharest ## [u\'multi-agent systems\', u\'context representation and management\', u\'ambient intelligence\']',2,'Changed research_interests.'),(16,'2012-07-30 16:20:58',1,14,'128','user_1_email_com: anonymous=False - area_1',3,''),(17,'2012-07-30 16:20:58',1,14,'127','user_1_email_com: anonymous=False - area_1',3,''),(18,'2012-07-30 16:20:58',1,14,'126','user_1_email_com: anonymous=False - area_1',3,''),(19,'2012-07-30 16:20:58',1,14,'125','user_1_email_com: anonymous=False - area_1',3,''),(20,'2012-07-30 16:20:58',1,14,'123','user_1_email_com: anonymous=False - area_2',3,''),(46,'2013-01-25 20:40:12',1,3,'41','090328112f094ac389662e4fa989fb',3,''),(47,'2013-01-25 20:40:12',1,3,'48','0bc602973f694d90b59ba3c9d63a8b',3,''),(48,'2013-01-25 20:40:12',1,3,'13','13eb382636654a7d936612055ced04',3,''),(49,'2013-01-25 20:40:12',1,3,'37','16ebd4f955964b60808f2322c1e96e',3,''),(50,'2013-01-25 20:40:12',1,3,'15','1769bc7d53cb47ab88d1d339463436',3,''),(51,'2013-01-25 20:40:12',1,3,'77','1bcc7bde69894bd7adec2b1ab37592',3,''),(52,'2013-01-25 20:40:12',1,3,'45','23922e511bb1433d8bf3d3b8af26fb',3,''),(53,'2013-01-25 20:40:12',1,3,'55','28c85b33d0184eab84c91d6ca002fa',3,''),(54,'2013-01-25 20:40:12',1,3,'19','2913b88d44874b849678c82643dbaf',3,''),(55,'2013-01-25 20:40:12',1,3,'38','2a9bf78000b047d08ac43a4a852fbe',3,''),(56,'2013-01-25 20:40:12',1,3,'32','2c79646e7e374cb8aebbc26cca7b5d',3,''),(57,'2013-01-25 20:40:12',1,3,'35','2fdda7b4e59440059e099a88da14c2',3,''),(58,'2013-01-25 20:40:12',1,3,'23','314da26ef4664216be101e67b74118',3,''),(59,'2013-01-25 20:40:12',1,3,'69','376675bfc91340e58cb95a0ef4caf9',3,''),(60,'2013-01-25 20:40:12',1,3,'72','3976a7c6343e49199afbdc59e0791e',3,''),(61,'2013-01-25 20:40:12',1,3,'49','47b4ccc652ea43788c466e5683bdee',3,''),(62,'2013-01-25 20:40:12',1,3,'43','50d4b5981b4742768bf4feea304944',3,''),(63,'2013-01-25 20:40:12',1,3,'74','52645cc920a24138bb225a211e3033',3,''),(64,'2013-01-25 20:40:12',1,3,'21','578735fb2cd0422b8efbaa48c50394',3,''),(65,'2013-01-25 20:40:12',1,3,'73','57cff54d347a40979539d8ba517f66',3,''),(66,'2013-01-25 20:40:12',1,3,'66','58f456e524184d32ab866e44bafcf2',3,''),(67,'2013-01-25 20:40:12',1,3,'24','59e936f3c88b4ca1bb5bb7170a6a03',3,''),(68,'2013-01-25 20:40:12',1,3,'20','634c005ef39a41d48a280f9edd5abf',3,''),(69,'2013-01-25 20:40:12',1,3,'46','68bbfa8e0ee14901b19187d7cb5c3f',3,''),(70,'2013-01-25 20:40:12',1,3,'42','79a8928b2d4744648eca156b1f5d56',3,''),(71,'2013-01-25 20:40:12',1,3,'29','7a2d83dfaff449248d1bc674301b4e',3,''),(72,'2013-01-25 20:40:12',1,3,'36','7eb3a3c2f9004ba3a54e118b43acaf',3,''),(73,'2013-01-25 20:40:12',1,3,'71','8ad8cb705bf64ab19e4a71d3bcc66d',3,''),(74,'2013-01-25 20:40:12',1,3,'70','8fc8a740fa6e40dd88a07527303e47',3,''),(75,'2013-01-25 20:40:12',1,3,'31','9937d38f9070406dbd55b33cff3102',3,''),(76,'2013-01-25 20:40:12',1,3,'76','9c607a5d512b469f939a6c20d7103a',3,''),(77,'2013-01-25 20:40:12',1,3,'18','9c9d30b73de94ee7a5b5fedbf03b32',3,''),(78,'2013-01-25 20:40:12',1,3,'51','9d89e5ececd24489b01051b2450a09',3,''),(79,'2013-01-25 20:40:12',1,3,'16','a',3,''),(80,'2013-01-25 20:40:12',1,3,'47','a0470fe4a8514802acaec8797beaa8',3,''),(81,'2013-01-25 20:40:12',1,3,'22','a07e66d82f724a489277fbd2f8f592',3,''),(82,'2013-01-25 20:40:12',1,3,'33','ac743b79bc944cdda227b717e85c55',3,''),(83,'2013-01-25 20:40:12',1,3,'40','ae1ade1762974cdcb6c1f6ce0a2930',3,''),(84,'2013-01-25 20:40:12',1,3,'44','b37bc3a089e848029dd45f006c3b7f',3,''),(85,'2013-01-25 20:40:12',1,3,'39','bac29c04e6de4135935e9e90db51ff',3,''),(86,'2013-01-25 20:40:12',1,3,'28','bc2b27c0bd954c43bb9eee7e503be3',3,''),(87,'2013-01-25 20:40:12',1,3,'64','c1cc4446d0184a32b768a13c14d905',3,''),(88,'2013-01-25 20:40:12',1,3,'67','c340e67ee65240088352a93ec6cd7f',3,''),(89,'2013-01-25 20:40:12',1,3,'75','c8b5c6f5afc34f53801fbf9d892312',3,''),(90,'2013-01-25 20:40:12',1,3,'65','cade115b13cb420291d1ed2fc8b5a9',3,''),(91,'2013-01-25 20:40:12',1,3,'68','cbc669b4b5d5462fa24d6a5c2209fd',3,''),(92,'2013-01-25 20:40:12',1,3,'30','cd2ecb9c25564723b07ee68a9dc13b',3,''),(93,'2013-01-25 20:40:12',1,3,'63','cd6b04bb965b474cb57a0e9d07eb08',3,''),(94,'2013-01-25 20:40:12',1,3,'17','cec95cadfd3541509deb838a7e4857',3,''),(95,'2013-01-25 20:40:12',1,3,'27','d2d1c0e86c1045b1a88a1d74bb2630',3,''),(96,'2013-01-25 20:40:12',1,3,'34','d618fb1581174f0e99cb5e88b7365f',3,''),(97,'2013-01-25 20:40:12',1,3,'26','d79059759dc14d7f863bf22f7e29c7',3,''),(98,'2013-01-25 20:40:12',1,3,'25','db410d6076b34e8795efd722c6fa1b',3,''),(99,'2013-01-25 20:40:12',1,3,'50','de0edf0bbcb64f9e9f6398e8ee3aac',3,''),(100,'2013-01-25 20:40:12',1,3,'52','e43942128a8745b2886b2eb8a57831',3,''),(101,'2013-01-25 20:40:12',1,3,'54','e7b321a7eb5045129afdd741057d0a',3,''),(102,'2013-01-25 20:40:12',1,3,'53','f64c323827234cd7a4dffed35b9069',3,''),(103,'2013-01-25 20:40:12',1,3,'12','f8b2b9a987244964b4c20d0695f1ee',3,''),(104,'2013-01-25 20:40:12',1,3,'14','unmail',3,''),(105,'2013-01-25 20:40:12',1,3,'11','user_10_email_com',3,''),(106,'2013-01-25 20:40:12',1,3,'6','user_5_email_com',3,''),(107,'2013-01-25 20:40:12',1,3,'7','user_6_email_com',3,''),(108,'2013-01-25 20:40:12',1,3,'8','user_7_email_com',3,''),(109,'2013-01-25 20:40:12',1,3,'9','user_8_email_com',3,''),(110,'2013-01-25 20:40:12',1,3,'10','user_9_email_com',3,''),(111,'2013-01-25 20:41:01',1,3,'87','aiwo_admin',1,''),(112,'2013-01-25 20:41:18',1,3,'87','aiwo_admin',2,'Changed first_name, last_name, email, is_staff and is_superuser.'),(113,'2013-01-25 20:42:35',1,9,'12','AIWO 2013(12)',1,''),(114,'2013-01-25 20:42:56',1,10,'3','AIWO 2013 level(0)',1,''),(115,'2013-01-25 20:43:02',1,10,'4','AIWO 2013 level(1)',1,''),(116,'2013-01-25 20:43:48',1,11,'9','AI Talks(9)',1,''),(141,'2013-02-08 13:55:11',1,11,'9','AI Talks (EC 105)(9)',2,'Changed tags.'),(142,'2013-02-08 14:26:24',1,11,'10','AUREL VLAICU University, Arad(10)',1,''),(143,'2013-02-08 14:28:03',1,11,'11','Transilvania University of Brașov(11)',1,''),(144,'2013-02-08 14:30:44',1,11,'12','University of Bucharest, Faculty of Mathematics and Computer Science(12)',1,''),(145,'2013-02-08 14:34:20',1,11,'11','Transilvania University of Brașov, Faculty of Mathematics and Computer Science(11)',2,'Changed name.'),(146,'2013-02-08 14:41:38',1,11,'13','Universitatea Petru Maior, Targu Mures(13)',1,''),(147,'2013-02-08 14:45:39',1,11,'14','State University of Moldova(14)',1,''),(148,'2013-02-08 14:47:43',1,11,'14','State University of Moldova, Chisinau, Moldova(14)',2,'Changed name.'),(149,'2013-02-08 14:47:52',1,11,'13','Universitatea Petru Maior, Targu Mures(13)',2,'Changed layout.'),(150,'2013-02-08 14:48:00',1,11,'10','AUREL VLAICU University, Arad(10)',2,'Changed layout.'),(151,'2013-02-08 14:48:08',1,11,'11','Transilvania University of Brașov, Faculty of Mathematics and Computer Science(11)',2,'Changed layout.'),(152,'2013-02-08 14:52:32',1,11,'15','Google, Inc.(15)',1,''),(153,'2013-02-08 14:54:46',1,11,'16','Facebook, Inc.(16)',1,''),(154,'2013-02-08 14:57:23',1,11,'17','Adobe Romania(17)',1,''),(155,'2013-02-08 14:58:24',1,11,'18','TeamNet International(18)',1,''),(156,'2013-02-08 15:07:36',1,11,'19','AQUASoft(19)',1,''),(157,'2013-02-08 15:21:29',1,11,'10','AUREL VLAICU University, Arad(10)',2,'Changed tags.'),(158,'2013-02-08 15:22:58',1,11,'11','Transilvania University of Brașov, Faculty of Mathematics and Computer Science(11)',2,'Changed tags.'),(159,'2013-02-08 15:49:57',1,11,'12','University of Bucharest, Faculty of Mathematics and Computer Science(12)',2,'Changed tags.'),(160,'2013-02-08 15:51:05',1,11,'13','Universitatea Petru Maior, Targu Mures(13)',2,'Changed tags.'),(161,'2013-02-08 15:51:14',1,11,'13','Universitatea Petru Maior, Targu Mures(13)',2,'No fields changed.'),(162,'2013-02-08 15:58:44',1,11,'14','State University of Moldova, Chisinau, Moldova(14)',2,'Changed tags.'),(163,'2013-02-08 16:00:58',1,11,'15','Google, Inc.(15)',2,'Changed tags.'),(164,'2013-02-08 16:02:25',1,11,'16','Facebook, Inc.(16)',2,'Changed tags.'),(165,'2013-02-08 16:03:16',1,11,'17','Adobe Romania(17)',2,'Changed tags.'),(166,'2013-02-08 16:04:41',1,11,'18','TeamNet International(18)',2,'Changed tags.'),(167,'2013-02-08 16:08:58',1,11,'19','AQUASoft(19)',2,'Changed tags.'),(168,'2013-02-08 16:09:31',1,11,'9','AI Talks (EC 105)(9)',2,'Changed tags.'),(169,'2013-02-08 16:09:56',1,11,'17','Adobe Romania(17)',2,'No fields changed.'),(170,'2013-02-08 16:10:01',1,11,'17','Adobe Romania(17)',2,'No fields changed.'),(171,'2013-02-08 16:10:11',1,11,'17','Adobe Romania(17)',2,'No fields changed.'),(172,'2013-02-08 16:10:22',1,11,'17','Adobe Romania(17)',2,'No fields changed.'),(173,'2013-02-08 16:10:28',1,11,'17','Adobe Romania(17)',2,'No fields changed.'),(174,'2013-02-08 16:10:44',1,11,'17','Adobe Romania(17)',2,'Changed tags.'),(175,'2013-02-11 12:08:50',1,11,'20','University Politehnica of Bucharest, Faculty of Electronics and Telecommunications(20)',1,''),(182,'2013-02-11 13:54:28',1,12,'46','feature type(booth_description) for area(University of Bucharest, Faculty of Mathematics and Computer Science)',2,'Changed category.'),(183,'2013-02-11 13:54:34',1,12,'47','feature type(booth_description) for area(Universitatea Petru Maior, Targu Mures)',2,'Changed category.'),(184,'2013-02-11 13:57:39',1,12,'47','feature type(booth_description) for area(Universitatea Petru Maior, Targu Mures)',3,''),(185,'2013-02-11 13:57:50',1,12,'46','feature type(booth_description) for area(University of Bucharest, Faculty of Mathematics and Computer Science)',3,''),(192,'2013-02-19 21:03:40',1,3,'100','01a8b35993994a428148fcd2d06a45',3,''),(193,'2013-02-19 21:03:40',1,3,'115','0975e17294984448aaf002d43415e4',3,''),(194,'2013-02-19 21:03:40',1,3,'140','132493a41fc741c1bc2e222468363f',3,''),(195,'2013-02-19 21:03:40',1,3,'126','2b6399703a4e4be7aaaf5e869eb393',3,''),(196,'2013-02-19 21:03:40',1,3,'135','3e30494d97be408fb30b62bf14d907',3,''),(197,'2013-02-19 21:03:40',1,3,'92','4de288b99f17409c9e6edb21a5894a',3,''),(198,'2013-02-19 21:03:40',1,3,'116','4f9ce4fda9bd4c2eae99ed1ee55be4',3,''),(199,'2013-02-19 21:03:40',1,3,'122','5c9fbe66587846999b56dc9500bf26',3,''),(200,'2013-02-19 21:03:40',1,3,'95','6aa8d4a44fca4a34a1ce8525a99e50',3,''),(201,'2013-02-19 21:03:40',1,3,'96','722c34d9524a4b47b1ec59faa8a9ef',3,''),(202,'2013-02-19 21:03:40',1,3,'107','75ae78ff07b94e6aaf253abf4d2a7a',3,''),(203,'2013-02-19 21:03:40',1,3,'143','76eaaee50d2e48afb032f83382f8a1',3,''),(204,'2013-02-19 21:03:40',1,3,'93','76eae2cc72f44b4083c5f654f08ec2',3,''),(205,'2013-02-19 21:03:40',1,3,'130','8b05c0b20ab84d21b7087de3f991f5',3,''),(206,'2013-02-19 21:03:40',1,3,'91','927dc6d44619420fa70808ab6b59e6',3,''),(207,'2013-02-19 21:03:40',1,3,'94','953d24c3d266496896817184c90380',3,''),(208,'2013-02-19 21:03:40',1,3,'103','a8b87e01ee1342f885b7eea377a183',3,''),(209,'2013-02-19 21:03:40',1,3,'141','a9d50ed882314497a511c9150d75b1',3,''),(210,'2013-02-19 21:03:40',1,3,'111','abed897934174d2ca6ddd63512722b',3,''),(211,'2013-02-19 21:03:40',1,3,'138','b22554a3e700486b8a6ad29e522586',3,''),(212,'2013-02-19 21:03:40',1,3,'134','b366a87f498f4c528ed8791c7b9ec6',3,''),(213,'2013-02-19 21:03:40',1,3,'133','c4b4f5e0db5e4e30a0a5d8c85515d7',3,''),(214,'2013-02-19 21:03:40',1,3,'142','c4dc6f130561493691df72ea8b9846',3,''),(215,'2013-02-19 21:03:40',1,3,'113','ce1f705a8d6c4b6782596242b0a6ed',3,''),(216,'2013-02-19 21:03:40',1,3,'127','dec2e7561cca4d7faccf4f6e3e5d0f',3,''),(217,'2013-02-19 21:03:40',1,3,'128','f23424ea7c474f9094332cae892081',3,''),(218,'2013-02-19 21:03:40',1,3,'3','user_2_email_com',3,''),(219,'2013-02-19 21:03:40',1,3,'4','user_3_email_com',3,''),(220,'2013-02-19 21:03:40',1,3,'5','user_4_email_com',3,''),(221,'2013-02-19 21:04:30',1,14,'516','annotation for location University of Bucharest, Faculty of Mathematics and Computer Science but empty user field',3,''),(222,'2013-02-19 21:04:30',1,14,'515','annotation for location University of Bucharest, Faculty of Mathematics and Computer Science but empty user field',3,''),(223,'2013-02-19 21:04:30',1,14,'514','annotation for location University of Bucharest, Faculty of Mathematics and Computer Science but empty user field',3,''),(224,'2013-02-19 21:04:30',1,14,'513','annotation for location University of Bucharest, Faculty of Mathematics and Computer Science but empty user field',3,''),(225,'2013-02-19 21:04:30',1,14,'512','annotation for location University of Bucharest, Faculty of Mathematics and Computer Science but empty user field',3,''),(226,'2013-02-19 21:04:30',1,14,'507','annotation for location area_1 but empty user field',3,''),(227,'2013-02-19 21:04:30',1,14,'506','annotation for location area_1 but empty user field',3,''),(228,'2013-02-19 21:04:30',1,14,'502','user_1_email_com: anonymous=False - area_1',3,''),(229,'2013-02-19 21:04:30',1,14,'485','annotation for location area_1 but empty user field',3,''),(230,'2013-02-19 21:04:30',1,14,'483','annotation for location area_1 but empty user field',3,''),(231,'2013-02-19 21:04:30',1,14,'481','annotation for location area_1 but empty user field',3,''),(232,'2013-02-19 21:04:30',1,14,'480','annotation for location area_1 but empty user field',3,''),(233,'2013-02-19 21:04:30',1,14,'479','annotation for location area_1 but empty user field',3,''),(234,'2013-02-19 21:04:30',1,14,'478','annotation for location area_1 but empty user field',3,''),(235,'2013-02-19 21:04:30',1,14,'477','annotation for location area_1 but empty user field',3,''),(236,'2013-02-19 21:04:30',1,14,'473','annotation for location area_1 but empty user field',3,''),(237,'2013-02-19 21:04:30',1,14,'472','annotation for location area_1 but empty user field',3,''),(238,'2013-02-19 21:04:30',1,14,'471','annotation for location area_1 but empty user field',3,''),(239,'2013-02-19 21:04:30',1,14,'470','annotation for location area_1 but empty user field',3,''),(240,'2013-02-19 21:04:30',1,14,'469','annotation for location area_1 but empty user field',3,''),(241,'2013-02-19 21:04:30',1,14,'468','user_1_email_com: anonymous=False - area_1',3,''),(242,'2013-02-19 21:04:30',1,14,'466','user_1_email_com: anonymous=False - area_1',3,''),(243,'2013-02-19 21:04:30',1,14,'12','annotation for location area_4 but empty user field',3,''),(244,'2013-02-19 21:04:30',1,14,'11','user_1_email_com: anonymous=False - area_4',3,''),(245,'2013-02-19 21:04:30',1,14,'10','alex: anonymous=False - area_4',3,''),(246,'2013-02-19 21:04:30',1,14,'9','annotation for location area_3 but empty user field',3,''),(247,'2013-02-19 21:04:30',1,14,'8','annotation for location area_3 but empty user field',3,''),(248,'2013-02-19 21:04:30',1,14,'7','annotation for location area_3 but empty user field',3,''),(249,'2013-02-19 21:04:30',1,14,'4','annotation for location area_2 but empty user field',3,''),(250,'2013-02-19 21:04:30',1,14,'3','annotation for location area_1 but empty user field',3,''),(251,'2013-02-19 21:04:30',1,14,'2','annotation for location area_1 but empty user field',3,''),(252,'2013-02-19 21:04:30',1,14,'1','annotation for location area_1 but empty user field',3,''),(253,'2013-10-24 12:22:25',1,3,'163','0d916b9948244baabaff5d4a2c8d7c',3,''),(254,'2013-10-24 12:22:25',1,3,'164','531cd41089014c6fba440d16856536',3,''),(255,'2013-10-24 12:22:25',1,3,'162','71f86da3a3104bb0ad6928940e67e2',3,''),(256,'2013-10-24 12:22:25',1,3,'161','8230db6b07e74a82bcdabf330da1a4',3,''),(257,'2014-05-12 10:40:20',1,67,'50','feature type(conference_role) for env(AIWO 2013)',1,''),(258,'2014-05-12 17:30:08',1,67,'56','feature type() but no location assigned -- needs fix',3,''),(259,'2014-05-12 18:25:54',1,67,'57','feature type() but no location assigned -- needs fix',3,''),(260,'2014-05-12 20:59:10',1,12,'55','feature type() but no location assigned -- needs fix',3,''),(261,'2014-05-12 20:59:10',1,12,'54','feature type() but no location assigned -- needs fix',3,''),(262,'2014-05-12 20:59:10',1,12,'53','feature type() but no location assigned -- needs fix',3,''),(263,'2014-05-12 20:59:10',1,12,'52','feature type() but no location assigned -- needs fix',3,''),(264,'2014-05-12 20:59:10',1,12,'51','feature type() but no location assigned -- needs fix',3,''),(265,'2014-05-13 11:59:36',1,12,'50','feature type(conference_role) for env(AIWO 2013)',3,''),(266,'2014-05-13 12:00:00',1,67,'58','feature type(conference_role) for env(AIWO 2013)',1,''),(267,'2014-05-13 12:00:27',1,69,'1','ConferenceRole object',1,''),(268,'2014-05-13 12:00:47',1,69,'2','ConferenceRole object',1,''),(269,'2014-05-13 12:54:10',1,70,'1','alex@email.com',1,''),(270,'2014-05-13 12:55:14',1,70,'2','user_1@email.com',1,''),(271,'2014-05-13 14:16:29',1,69,'4','user_1@email.com',3,''),(272,'2014-05-13 14:16:29',1,69,'3','user_1@email.com',3,''),(273,'2014-05-13 14:19:40',1,12,'58','feature type(conference_role) for env(AIWO 2013)',3,''),(274,'2014-05-13 14:24:21',1,67,'59','feature type(conference_role) for env(AIWO 2013)',1,''),(275,'2014-05-13 14:32:04',1,12,'59','feature type(conference_role) for env(AIWO 2013)',3,''),(276,'2014-05-13 14:32:30',1,67,'60','feature type(conference_role) for env(AIWO 2013)',1,''),(277,'2014-05-13 14:32:44',1,69,'1','alex@email.com',1,''),(278,'2014-05-13 14:32:52',1,69,'2','user_1@email.com',1,''),(279,'2014-05-13 14:56:07',1,70,'1','user_1@email.com',1,''),(280,'2014-05-13 14:56:19',1,70,'2','alex@email.com',1,'');
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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(50,'program feature','program','programfeature'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'user profile','coresql','userprofile'),(9,'environment','coresql','environment'),(10,'layout','coresql','layout'),(11,'area','coresql','area'),(12,'feature','coresql','feature'),(13,'announcement','coresql','announcement'),(14,'annotation','coresql','annotation'),(15,'history','coresql','history'),(16,'privacy','coresql','privacy'),(17,'user context','coresql','usercontext'),(18,'log entry','admin','logentry'),(19,'api access','tastypie','apiaccess'),(20,'api key','tastypie','apikey'),(21,'registration profile','registration','registrationprofile'),(22,'facebook user','django_facebook','facebookuser'),(23,'facebook like','django_facebook','facebooklike'),(24,'facebook profile','django_facebook','facebookprofile'),(25,'research profile','coresql','researchprofile'),(33,'facebook profile','coresql','facebookprofile'),(34,'user sub profile','coresql','usersubprofile'),(47,'user','django_facebook','facebookcustomuser'),(48,'open graph share','django_facebook','opengraphshare'),(49,'facebook invite','django_facebook','facebookinvite'),(51,'program annotation','program','programannotation'),(52,'session','program','session'),(53,'presentation','program','presentation'),(54,'speaker','program','speaker'),(55,'booth description feature','booth_description','boothdescriptionfeature'),(56,'booth description annotation','booth_description','boothdescriptionannotation'),(57,'booth product vote annotation','booth_description','boothproductvoteannotation'),(58,'booth product','booth_description','boothproduct'),(59,'people feature','people','peoplefeature'),(60,'social media feature','socialmedia','socialmediafeature'),(61,'order feature','order','orderfeature'),(62,'order annotation','order','orderannotation'),(63,'menu category','order','menucategory'),(64,'menu item','order','menuitem'),(65,'description feature','description','descriptionfeature'),(66,'description annotation','description','descriptionannotation'),(67,'conference role feature','conference_role','conferencerolefeature'),(69,'conference role','conference_role','conferencerole'),(70,'chair role credential','conference_role','chairrolecredential');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_facebook_invite`
--

DROP TABLE IF EXISTS `django_facebook_facebook_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_facebook_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_invited` varchar(255) NOT NULL,
  `message` longtext,
  `type` varchar(255) DEFAULT NULL,
  `wallpost_id` varchar(255) DEFAULT NULL,
  `error` tinyint(1) NOT NULL,
  `error_message` longtext,
  `last_attempt` datetime DEFAULT NULL,
  `reminder_wallpost_id` varchar(255) DEFAULT NULL,
  `reminder_error` tinyint(1) NOT NULL,
  `reminder_error_message` longtext,
  `reminder_last_attempt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`user_invited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebook_invite`
--

LOCK TABLES `django_facebook_facebook_invite` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebook_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebook_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_facebookcustomuser`
--

DROP TABLE IF EXISTS `django_facebook_facebookcustomuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_facebookcustomuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `about_me` longtext,
  `facebook_id` bigint(20) DEFAULT NULL,
  `access_token` longtext,
  `facebook_name` varchar(255) DEFAULT NULL,
  `facebook_profile_url` longtext,
  `website_url` longtext,
  `blog_url` longtext,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `raw_data` longtext,
  `facebook_open_graph` tinyint(1) DEFAULT NULL,
  `new_token_required` tinyint(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `facebook_id` (`facebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebookcustomuser`
--

LOCK TABLES `django_facebook_facebookcustomuser` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebookcustomuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebookcustomuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_facebookcustomuser_groups`
--

DROP TABLE IF EXISTS `django_facebook_facebookcustomuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_facebookcustomuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebookcustomuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `facebookcustomuser_id` (`facebookcustomuser_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebookcustomuser_groups`
--

LOCK TABLES `django_facebook_facebookcustomuser_groups` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebookcustomuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebookcustomuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_facebookcustomuser_user_permissions`
--

DROP TABLE IF EXISTS `django_facebook_facebookcustomuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_facebookcustomuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebookcustomuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `facebookcustomuser_id` (`facebookcustomuser_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebookcustomuser_user_permissions`
--

LOCK TABLES `django_facebook_facebookcustomuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebookcustomuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebookcustomuser_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `about_me` longtext,
  `facebook_id` bigint(20) DEFAULT NULL,
  `access_token` longtext,
  `facebook_name` varchar(255) DEFAULT NULL,
  `facebook_profile_url` longtext,
  `website_url` longtext,
  `blog_url` longtext,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `raw_data` longtext,
  `facebook_open_graph` tinyint(1) DEFAULT NULL,
  `new_token_required` tinyint(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `facebook_id` (`facebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `gender` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`facebook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_facebookuser`
--

LOCK TABLES `django_facebook_facebookuser` WRITE;
/*!40000 ALTER TABLE `django_facebook_facebookuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_facebookuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_facebook_open_graph_share`
--

DROP TABLE IF EXISTS `django_facebook_open_graph_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_facebook_open_graph_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action_domain` varchar(255) NOT NULL,
  `facebook_user_id` bigint(20) NOT NULL,
  `share_dict` longtext,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `error_message` longtext,
  `last_attempt` datetime DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `share_id` varchar(255) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `removed_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_facebook_open_graph_share_6340c63c` (`user_id`),
  KEY `django_facebook_open_graph_share_37ef4eb4` (`content_type_id`),
  KEY `django_facebook_open_graph_share_96511a37` (`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_facebook_open_graph_share`
--

LOCK TABLES `django_facebook_open_graph_share` WRITE;
/*!40000 ALTER TABLE `django_facebook_open_graph_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_facebook_open_graph_share` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dcb5be9084c793248de6d5721e97d1db','ZDA2YTg3NDVmM2IwZTEwNGE4Y2MzMWRmZGIzNjViOGFiYWYzYTU3ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigEDdS4=\n','2012-06-23 12:27:31'),('aa5d5d9b9681b9170f412e4c913868e9','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-20 12:28:42'),('7b9d28b863de6b088b43d4e5b35b6f7c','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-03-14 11:41:22'),('f038a9b0480a3db717262eba5ab4aa96','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-21 11:14:00'),('fd49e7f0201890ffb35ff7ab1381188f','ZDA2YTg3NDVmM2IwZTEwNGE4Y2MzMWRmZGIzNjViOGFiYWYzYTU3ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigEDdS4=\n','2012-06-21 11:14:30'),('734a22880a9c8ac0d6bafa368be8f914','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 11:43:10'),('8762d574c85d5582e6769ac7357f7c84','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-23 12:55:12'),('add9ab431f3c6b171c91863e0e37272e','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 11:53:12'),('f11e2ed28aad82c4ae25a715443bf60b','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 12:07:39'),('0af7a3c97aa8a60b499cab24f1e8c211','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 13:05:12'),('612c0bea2c0808b4dd5f475b88daadd0','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 18:51:34'),('ec7daf3819ff381f2951c38511a3fec8','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-21 18:09:06'),('f547709010b9fc9c0016b02fc4a8bf19','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-21 19:01:25'),('5a869d9384b0a8f7c3d03ee37a2ee26c','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-23 12:52:09'),('f0ae68a154c23c62a2a7f38da56990ec','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-06 17:16:28'),('959a0108936f0497330e12b2eb85ca07','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-23 12:55:12'),('80600d77206cb089f452018cdd4b08ce','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-24 18:18:51'),('2958d501ef588eddcd4cfb6b1a8fd228','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-25 22:48:27'),('a87e6be1eca792bb2d6d70cb8e4791bc','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-25 14:32:17'),('c1d336cf7397bcf58d3ed6af0bc2cce5','ZTJlNzc4NTNkZmJmYTEwMTVmMDU4MDI5ZTQzMjFhYTBkNzk4ODI2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEMdS4=\n','2012-06-24 18:25:13'),('d3ff77e9a9895474f51f660647bb9675','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-06-25 19:32:50'),('b0f3be2f4844dd40506e7188f9a076e0','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-06-25 19:32:53'),('89de84d9dd7f59ce368812f0ddffee01','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-27 00:36:46'),('646b7682bc619c02874d7bc129b497a3','OWFiZWMyYmM0YjQ5MzlhODBkZGRmZGQwMWMyNmQwYTc4N2IyZTM2ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigERdS4=\n','2012-07-11 12:06:12'),('16f82a2df859cf7e6e84c054e0af5865','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-11 12:05:15'),('539e1b4b2fc1879f126aac1c405a3e56','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-11 12:06:02'),('47bbeccd830b36a1365c9bb980edb857','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-26 10:45:55'),('04a9d9128097688c55e6c1e2a05ad0ad','ZDA2YTg3NDVmM2IwZTEwNGE4Y2MzMWRmZGIzNjViOGFiYWYzYTU3ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigEDdS4=\n','2012-07-23 20:16:30'),('6701761d9470af5a47e29f5c89120fa7','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-26 00:06:08'),('bc08c8bc77955e8049f6b9dc46741b99','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-28 19:38:35'),('9659572f05fc9685d86890696042f8e0','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-30 12:07:48'),('054e7e27570205470c01166132342665','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-30 12:07:48'),('975c3eff27847e2284141a6384a63986','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-07-30 15:50:40'),('9977ecc6a2f59e0bb2a5c72d65dcb673','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-07-31 18:55:00'),('2e92723ed03de0d8324215780ac6ea1b','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-01 13:18:05'),('d279d48bc3b533c6b1c5135597805ca3','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-01 13:31:19'),('94a4201342e9d032e3662c2b01d379d7','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-04 15:42:32'),('49906f94b15e9cc2d8b95c987c059dd9','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-04 15:57:27'),('49724e96017a3b47926fce28fe574e3c','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-04 17:04:14'),('02547734ca94dd250c85696dc6d5872e','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-04 23:03:19'),('f64a19d3926e8edc097e928344e7a2e0','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 17:21:44'),('da83c4ec0075541a22e5ddf18f768613','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-10 19:17:49'),('bbcc10df3ead53e2eb9459d77f86bcf2','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 14:17:34'),('d520c3343fddf6ca16fd2ccec66e46fa','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 15:34:40'),('a7ab49d1623a6231eee459aa182a13ad','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-08-13 16:19:56'),('4dacdd27567d5796380a2c0c368aeac7','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-13 23:36:17'),('bbee2a407bceeeafdc855315b92769b5','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-08-14 00:53:22'),('0d5b84cf0a7ce4259264ba90da7e3dd6','YmQ2NjFlZWIyOGIwMDUzYTI4M2VlYzVmYjEyNDc5NzY5OGM4MjA3MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEYdS4=\n','2012-08-14 00:53:48'),('d0deb1da2f1883fcc37a98eba100e418','YWU2YzJiMDUwMjJlMzQ1ODJlYzIyNzU1NzhmODZjODI2M2U0YTc2NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEZdS4=\n','2012-08-14 19:20:08'),('0b406d694e8e88e2ebdd98b4a4cc05cf','MGJhYzIxMGMzNGU0YzU5ZWVkMGVhYTJiNjJiOTUxNmYxMGZhMWE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEadS4=\n','2012-08-14 20:25:26'),('6fc113dc3cd013aa32b8acf3e65e3732','YmRkMmUxMGRmOTdjMzEzZTlkNjA1YzRiY2JhYmU4ZTAxM2RhZDIxYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEbdS4=\n','2012-08-14 20:29:39'),('ba3c2641538d5d28ecfcd505e6b3edd4','YmQ3NzI1ODJjODU3MTA2ODAwMzg0MzlkODc3ODU2Yzg2OTZmNTUxMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEcdS4=\n','2012-08-14 20:37:00'),('8af51e8369ff1568b1a55b2a29852d2e','YjJmZjE3ZGUwZWJkZTlkNzBkY2I5MDQ1M2U1MmNiZmQzNzNmMGYxZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEddS4=\n','2012-08-14 20:39:27'),('b5e9f64a70d9ec217eb9678ab280f66d','NjZlY2YwOWQ3ZTc0ZjI2NTE0OTZlZWRjMzU1OGE0NzMxNmE1MzI5ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEedS4=\n','2012-08-14 20:49:30'),('7c284508e54f943f23b1cdfd1bc84692','ZDlhZGNiMWE3YzU5MDg5N2YyYjRjNTc4MmQ5YWYzOTUwN2RlMGY5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEfdS4=\n','2012-08-14 20:53:54'),('79a190f8f14e2dbdcfaf090059d963b4','OTAzMDVmNjc1YTJhZDkxYjgyMGZlNDYxZDczOTBmNDVlYzliZDkyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEgdS4=\n','2012-08-14 21:05:16'),('110a88e141bd54830c4fcc2b4a682fe7','ZTlmMzdmN2IxYzg0ZjIwMjVlNDlhMzVmNDA5YjBhMmQ2NjczZWVmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEhdS4=\n','2012-08-14 21:17:21'),('26e39aec187b7cef06276ccbcf119062','YmEyZDI3NmJkNzVhYjlhYTMwM2E5NzUxOGYzZmJhMjMyMzMxYjc2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEidS4=\n','2012-08-14 21:20:02'),('87a845919b3dcf84ffc29ebbdf72790f','MjMzM2MzODczZGQxNGM3MmQ5OTA1ODAwYjBjMWUxYWQxYzMwZjhiNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEjdS4=\n','2012-08-14 21:23:11'),('f5e117aba0f082db18ede7ae82be12e9','Mjk1MTk2ZWJiZWRjMzQyYmIyNmE5NmIzZGI3NTRiM2Y2NGU1ODI1MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEkdS4=\n','2012-08-14 21:25:10'),('1691475cf6a320e6b60e3fb9975c8ffa','ZWE5NDI2ZDdmOTBkNTAzMjc5ZDkxNjNmYjMwMmE1N2FhYTFiOWE0YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEldS4=\n','2012-08-15 14:17:08'),('6637c3344b5d1a2a904896687980d1a0','NTlhZWI0NDNhMmZjMDEwOTk2ZGE3ZmY3YWJiMjU1OTFkNTI2ZjlkYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEmdS4=\n','2012-08-16 12:56:18'),('58fb291fe7b44bd0eb3f0c54ea998742','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-08-17 15:52:06'),('710dba1ccf35a3d6954891bd6d6f0efa','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-09-01 23:00:38'),('5504db4b97a84038a00e9c051062cc15','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-09-01 23:01:06'),('72efb779516b97a5aeb2087bde822b22','Y2ZlMWE1MmFiMTBjNTdjODc5Zjc1NzY2Njc2ZjQyZmYwMmFmZWU4ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEpdS4=\n','2012-10-12 11:55:28'),('837879b6abb8b89abecc10aa65eca266','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-09-04 12:08:13'),('cc592b404d2b230635f9e4b386b77e99','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-10-12 11:57:29'),('c555465318ead1dff1ac7e7cc5545245','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-10-12 12:02:01'),('ae367df65d811495a6d15403dde70dd2','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-10-12 12:22:54'),('62c88ca71252c783180ffa8fbb17d2eb','OGNlYzcyYTA2OTJlYjBlMDA0ZTI1YjAwNGUzY2I4N2Y1Y2ViN2IwNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEtdS4=\n','2012-10-28 19:32:24'),('d10afcc9dc984757ae03d9137327e0b4','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-10-17 21:57:05'),('4220245baa37ab2bc248bf3c7465bacb','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-10-19 21:13:53'),('428bfe59d3b441a7cd1cd9296747f589','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-10-19 23:01:08'),('89a915463f5638ffbb441595355242aa','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-10-26 12:02:47'),('edc5caa5d169d5ed22e213438b4cde66','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-10-26 15:41:27'),('dbdf0018d6eb5164b4dd30730c05ef1b','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-11-05 13:29:10'),('6973d16542b025d171ffb5bc500bff03','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-11-05 13:36:41'),('d7682b89af25097aadb9d899633b7eb7','MWFlZjExMjcwYmJhMjA5OGY1ODU1OTEwZDE5NzU5ODNjMmU1YTE5YzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEudS4=\n','2012-10-29 11:01:04'),('12b3412bafeb7c8e93653865908646f8','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-11-11 22:45:13'),('752d0d7fb7d6ddd0be49ca0e7e150ca0','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-11-11 22:47:51'),('7e90b59ca3d619fd554fe2b2f246f337','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2012-11-16 13:04:34'),('5943ede4ec64f0b2301549c112830dcb','MzI0YmZmN2MxM2U0YTZhZDY1MjY4YTliYjdhYWU2NWIzM2QxZjEyNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigExdS4=\n','2012-11-15 12:23:00'),('79315708a64aa458b9e64ba01969b519','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-11-13 17:57:04'),('049643f5c2c2cc349b8e713056dbff8d','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2012-11-16 13:06:05'),('fda59ca61da8a6c7bdbe05e91e87afad','MmZjYTQzYzRkMzUxNDQ1MzZkOTZmYWIxYzQ5MGY5ZDRiM2EwOTJiMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigEzdS4=\n','2012-11-30 23:54:46'),('8c633005891451ad2009b11acfca5a0f','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-11-18 20:04:12'),('85e04feb7ca55c6a981e27829349755c','MjA4M2E5YTg0ZDlhMjhjODY0MjAwZjRjOTA2ZGE2NzQyNTY2Mjc2NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE0dS4=\n','2012-12-09 18:25:14'),('44a236ba88358ee99cc4316e2b61e02b','NDI4NGMwZDkyOTQzNzU3OGNmMjljNzI0ZGI0YTcwNjRlNTE2MzMyMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE4dS4=\n','2013-02-02 16:20:28'),('7a63e8e9a00113ccd6e7eb6365a6eecf','NjRlNmQ2YTM4MjAyY2I2MjE5NzhmNTcxNjkyMmE0N2I4M2UyYjNhYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE2dS4=\n','2013-02-01 22:30:04'),('6980dd356c4f50f39f9e45e6172be4e7','NzI5OTk2MDFmZTFiNzBhN2E1N2RhMjJhNDJkOTdhMzM3NDg4OGYxOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE3dS4=\n','2013-02-01 22:33:02'),('e548e812c58f3913761e52bc301c2602','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-02 13:48:30'),('a240a72ab7ecb4aadf08e7515426ff9e','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2013-02-02 18:26:23'),('de84127a03d3813277476458ae2022b9','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2013-02-02 18:27:06'),('cdc4baf053d7841600e2cdfb4415449c','MjlkZGVkMjhkOGJkY2IxM2M1ZTNkMzk3MjY5MzNmYTMyMzY4YzFkYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE5dS4=\n','2013-02-06 18:15:51'),('b20154c1f4a5a81958a9d719ce7162cd','ZTVlMDkzN2U5Nzc3NWY5MTQ4ODI4MTkxZTg3NzNhMjdhMDFkMGM2MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE6dS4=\n','2013-02-06 18:17:50'),('134d95ea688085d1a8f4e7dc30b369c8','MmI1NDVlMmYwNDU2MzYwMTY5ZWM1NTExOTk2N2I4MDllODNlMDQ0NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE7dS4=\n','2013-02-06 18:33:28'),('f609166958837a0df21ba553bd156533','NmM3OWRhNTM5YTA3OThkY2YyZjRlYzFhZmUzMDczZjMwYTU1NmZhMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE8dS4=\n','2013-02-06 18:45:36'),('cda1bae6e81149463baf66110de640b5','ODk2ZWFmNzc4MGJiOTZhMDYxN2NmNjUzMDEyYTNlNzYxMzU5M2QwZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE9dS4=\n','2013-02-06 18:52:43'),('43beded3fb8f53ac0dfc04db4d055ef1','NTdmOWFjOTEyNjc4OTBlMzVmZjQwNTA2NjkyZjExNWU5ODAyZWJkNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE+dS4=\n','2013-02-06 21:27:00'),('29be4339af1dbec97101cd23c6bcb672','MmQ5NGU2OWUyODc3NWRkZWEzMGNiNTkzZjRkNmRlYjc5ZTE4Mzg5MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigE/dS4=\n','2013-02-06 21:30:11'),('66ec2fcd79c17ba944bacc2cfe824d2d','MGUyMzM4YzRiM2ZlYmZiZTA2OTkxZWZlZmFjOTI4NjJlM2U4Y2Q2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFAdS4=\n','2013-02-06 21:34:19'),('97f6655ab9be5dbecf5af8569488d302','NjgxOWUxYjBhOWMxZjM3MDY0YWRmZTRhNzRmM2IyOGNkODgzN2I5NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFBdS4=\n','2013-02-06 21:49:29'),('6e3bca5b0d37197753eec3ea5f85a0f3','NzM2YTU1ODM4NDYxNzllMWEyYjYyNjEwNWY1NGRkMDEzOGNjYTMzYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFCdS4=\n','2013-02-06 22:01:39'),('54b8a73ddc8777340a1acfa6fa1c1ff8','MmQ1ZTAzNTdiYmNkNDA5MWM2NTJjYjQ3NTNiYzUyNDYyMzFhMDllZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFDdS4=\n','2013-02-06 22:09:45'),('08fa261fe5dafff12265248d446f058d','ZTQ0Y2ZmNjRmNjliYjg1Yzc0MWYwNDZmNTgxZWRlOTFmNDBjNzAwMDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFEdS4=\n','2013-02-06 22:12:05'),('c4625ac94d829aa7f7389df047a1e6fc','YjZmMmQ4NjBjZjM2NGMyNGY2NWJlMDU5NWNkZGUwMjVlNzUwMjNlNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFFdS4=\n','2013-02-06 22:13:07'),('f7d0ba898ac995d6f8874af336c6a2c2','MTY5ZjA3YzNkYzE2ZGQxY2Q3MDJiNTIxMzU0ZDJmZWU1Y2U4ZGU2MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFGdS4=\n','2013-02-06 22:21:54'),('f08d8526a00a69d2c6a756ab43afe9cc','YjQxZDBiYTU2NTYxYTA1MTk0ZTE2NzAxOGJiZjM1NzAxOWRjZmE1ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFHdS4=\n','2013-02-06 22:31:03'),('f8ad6fe4fabde1093d42894dc0a97ebd','Njk0MzI0N2NjOTVhYjNiNTE0YjhhZTIyOGViZGM2ODlhMjk5MGVlZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFIdS4=\n','2013-02-06 22:36:56'),('03d5c2871d232b5b0fb42f06229c731d','NzkwMjIxYTIwY2U4MmU0OTVhOTZmZjdmMzBlYzIxMTkxMTQxOWMxZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFJdS4=\n','2013-02-06 22:41:06'),('3437be0d4024afb731105de981d53ca9','Mjg4NmJmMmE0NzZiMTc5MDc3YTkwNjVmNGM4YzRkNDgwN2UzZjQxYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFKdS4=\n','2013-02-06 23:08:21'),('beae5e19a92da8e6b51e1650da91db16','MjBhY2E0YmNlYzBiNWY3MTIwYjIyMDNkOTVhOTRhNmQ3ZWVlZWMwZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFLdS4=\n','2013-02-07 01:46:52'),('2f410040715b37c9a7ada4240117262b','YWZlMjRmZWFhZmQ3ZWRkNTBmYTk3NzdhZWFmYjA1MzAxMDBjMjcyYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFMdS4=\n','2013-02-07 01:49:05'),('813353a59118d3da9ebc7debc9e5a4bd','OWYxYWE3OGE1ODYyMmM2ZTJjMDMxZDg5NjdjOTA3ZTAzYjU1OWU4NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFNdS4=\n','2013-02-07 02:18:31'),('0d7e0f9e2ae8bc62cf0a799ae36a088b','OGY2ZWI2NTFmNDU4ZmE1YTU4ZTM2ZGU3ODFkYWQ1YzdlZWRlNGUwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFOdS4=\n','2013-02-07 02:21:59'),('24fea32eff2dcac2964f1bd941eb101b','Njk1NzIxOWYzZGZiNjM2MjQ0ZTNlNzZlNjExM2Q4ODA1YmI5NTgzYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFPdS4=\n','2013-02-07 02:30:01'),('99ce698ffc764df8eb588b9d4f521cce','OTNlMmQ3ZTU5YjExNGJhMjQwMDRmMTY2NjdkZjczMjYyNjYwNjljNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFQdS4=\n','2013-02-07 02:50:48'),('341c6a0e9b5ad2684137a50ce591f253','NGE5ODQxMjY2ZmU5ZjBlNmJmMWVkZDI1ZjdiZjUxNmRkYjEwNTNlNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFRdS4=\n','2013-02-07 02:51:45'),('1e4c2e09dd3ee18ffc7f82a98eee4fcd','Y2I3OGMyYjFlYTM1MTA3YjIyNGM5MGI3Nzg3MmNjYTcwZTA4N2MxNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFSdS4=\n','2013-02-07 02:59:43'),('f9481d6c24f78ff43fc92b1dc7dece72','MGZmZTZiZjA2NzdlM2QxM2ZhYTE2NmQwNzJkNWU4NDMyNjNkMGVlOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFTdS4=\n','2013-02-07 03:02:58'),('515a044ed015d2edfeb33821a3d3f85a','MDk1NTYwNzdjNjAwOWYxZjdhMTM5MDU2OTFlN2ZmNTU5NGM3OTQxMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFUdS4=\n','2013-02-07 03:13:15'),('55db1b81f507e898fa83655ed04317f0','Nzc4MTRkNjU1YzNjZGVjYWI0ZGE2MTY0MjRjYWM2NjQyMGJmZGE2ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFVdS4=\n','2013-02-07 03:14:19'),('02f761cf93262c0e99a6ff9b7a7c13f1','MTczM2FlY2Y0NDQ2NDY0YWU4OTIzZTc3OTE1M2VkNDAzMTc5Y2Q2MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFWdS4=\n','2013-02-07 03:15:00'),('4ceccc069b2077849e84c7be25ab7d27','NTE2ODVkNTdmYjcyMThhNjU0YzRiNTkzNGYzOWY1ZWNmZWU1MjM4ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFYdS4=\n','2013-02-14 22:11:01'),('1bb15c819763d96c02de3f7fdd1e84c4','YmZkNDU1NzgxMDhkZWQxOTkzYmQ4NWNmNWJlZDIwMDIwMTEwMDk3YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFZdS4=\n','2013-02-14 22:13:39'),('ae9d50a514d1cc1b0f5f4841ea293a46','NmY0ZWEzMDhkMDJmNmVmZmVkMTZkZGZmMWExNzI4ZGU5Y2ZkNjEwZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFadS4=\n','2013-02-14 23:07:11'),('806ac3307e18b44df268b5d90e9794f5','MjJkMDYwZTQ2OWViMTdhZjBlMDVjZDIzZTA5YWQ1YjNjMzM2YzI1YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFbdS4=\n','2013-02-15 00:47:25'),('cc81388b860a2e74239235370edd852d','MjU3MjFlYmM1YzIzZGQ4OTc5MmIyMzUyNDdmNzUyMTNkMGZiZmFkNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFcdS4=\n','2013-02-15 02:35:00'),('d10601d1c08284d7bb860d6f7401e97b','NDE3NGZhOWQ3YmQzYmRkOWVkMzZkOTNjMzU0ZjNlMWM0OTMxZDYyZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFddS4=\n','2013-02-18 17:04:14'),('3576efa5bf1e5de88341fddf76dfaaac','MjA0MmIyMmMyODExNTQ4MWE5YTFmMTZhYTY0NzJmY2JjODY2YzcwMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFedS4=\n','2013-02-18 18:12:15'),('d0ad958188b5b45b559131a402dcebe7','NzVlZDVjZTAxNDQ5Y2U3ODRkMDA5ZTJlZDM5N2UxNmNmYTc0Y2U1YzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFfdS4=\n','2013-02-18 18:29:18'),('d52917248f684207ec9ce2ac025771de','NzM0YzM5NjdiZTgwZDgwNTBhZDE5NDFhMmIwNGYyNTQ5MGE5ZTkwMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFgdS4=\n','2013-02-18 18:38:44'),('8301325ee2505636bac4d87bb3b6a65d','MWE5Yzg0NzViMjIwZjM4ZDkyY2FiYTBlNmRkMmVhZDZkZGZiNmQ3MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFhdS4=\n','2013-02-18 19:26:36'),('aeff50626738ebc6fda9cd025ba60073','NDVkNTI4MjMwZWI0NzQwMDI1ZWJiM2YzZWQ4Njc3MjU2NzRiMjQ2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFidS4=\n','2013-02-18 19:32:29'),('3516919fe6b4d9921a2699a696b8a5ca','NTg5N2FlNTk4YzY0MTJkYTdmZTc1ZjVlODgxNGRkY2I4OWU2N2ZiYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFjdS4=\n','2013-02-18 19:35:50'),('d617cf5f6625e64395e5d7ac1298c5f9','ZjFmYjIzMjQxY2JiNjVmMzI4MGJiMmI5M2Q3NTZkODJiYTQ2MmNkMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFkdS4=\n','2013-02-18 19:41:15'),('52425b2d359347308b11a5b1e796c3b1','ZDMwZTk3MjlhZmUzMTIyNWZmZDg0MTkxODYxMTAyNDgzYzMzZGJkZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFldS4=\n','2013-02-18 19:45:15'),('3870a23275fde8646d440189f087acd4','MjAxODYyMzkwNzdmMTIyMzAyNGRlMzVhMjliNWZjMGJlMGJiYTk4YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFmdS4=\n','2013-02-18 19:46:41'),('1471e4c8b4358894d210e0db9bef1353','YmM5Yjc2MzUzNGMyZGU3MTNiZmI3ZjE5YmY4YTg5ZjE5YThlZGY1NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFodS4=\n','2013-02-19 12:47:15'),('19d60e5c4c8598b54684e3921246cb88','MzYxZjhhZWRhNjg2ZDUyNWFjZDIzYjdmODM3OTQzNjJkZGJkODNlOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFpdS4=\n','2013-02-19 14:54:51'),('6668f82b1ef56494443b9211dde7433e','M2YzZjgyMjA2Y2Q2ZWNhMGJhMmFiOGJkOTk1MGVkYTM1YTEzOGM2YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFqdS4=\n','2013-02-19 14:59:42'),('377cede5e62eb5f0fe572cd01c34804c','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2013-02-19 15:11:06'),('d10af6e858c23e3a1703976f10270027','ZWMwNWFmNTkwNGEzMDdjNWFiZjNkM2I1YjQ5MmE5YWU3OTAyMWQzZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFsdS4=\n','2013-02-19 16:22:29'),('3da40000f46c39d60f69070421d0929d','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigECdS4=\n','2013-02-19 16:25:09'),('e3c74392b0cf31e3661bf268cb44643c','NjY3NWRhMTE0NTkwZTgyNWFiMDNjZGFjOTQyYjFiZGM1NWExOTk2MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFudS4=\n','2013-02-20 00:33:55'),('30227a8311931425a9ac338dc4abc87a','NDZlMjg3YWQ0YWNjODYwYjI3MWY5ZWI2YmM5OThiOTdhNmMzNWExNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFvdS4=\n','2013-02-20 17:45:03'),('9a162f4a7e640a9b8f4b710f8d64b052','MzI0ODg4YzZiODQzZmQ3ZWY5YzJiOGJmMmE1NzU5YTQ4NDdmNzE2YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFwdS4=\n','2013-02-20 17:58:33'),('4c8fdba1c49d571348074ddbb2fb86d8','OWJlODY2MWEyOTE3ODMyZDYyNmY3NmYzNDIyMzQ1OTQyZjg1NTQyZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFxdS4=\n','2013-02-20 18:01:26'),('9aa72c354dff7a2849f9fe1c47367159','MjJhNzQzNjg1NzQ2MDE0MDA4ZTBjMzg5MTZkMTUxNTA4MWQwN2MxNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFydS4=\n','2013-02-20 18:17:54'),('b6682082da83f68cd81196516943ecee','Zjk2M2FkYWRjZTk4NWRmYTdlZTFlYTU2NGNhYjM5NDE3YzM1MjFlZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigFzdS4=\n','2013-02-21 15:17:20'),('873bc41d4cf89ecbc494df6ec2f5b0f3','MWFmOTU5OGM3NDViMjY2NTQ5ZWQ0YjFiNmI2MzljYTRmYTJlNjlmMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF0dS4=\n','2013-02-21 15:51:57'),('6adb2c3ac5409098405bf77f2c1aece0','OTI1N2FjM2FhYzQ1OTVmMDI3MTUxMDg5OTNkMjY5MDY3N2QxMmY0ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF1dS4=\n','2013-02-21 16:06:42'),('d4481181d3e4f505f88e51174274da55','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2013-02-21 16:23:00'),('60d1305a2171864e7b81474db935bccd','M2YxMWI5ZjhiNWZhZjZjMmZhNDQ2MjgxMjU2OGUwNzA5ZDAyMjM2MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF5dS4=\n','2013-02-21 16:23:17'),('cb2e305ddd21c84d56813e7a0570200f','ZGY2M2YwOWI3NDU1NGU0ODk5MTcwYzFmNDAwMTdjNDJiODAwOGNiYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKBAHUu\n','2013-02-22 18:31:48'),('759030201b8684df82cb966f2a76fcfc','YTJjOTBkNmJjNGU0MGYyNDQ4ZTM5YWI3OGQwOTEzNTI1YTdiNTZlYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF7dS4=\n','2013-02-21 16:32:53'),('a7a72288755db280ff7a01200d15041a','MDJjNDk4YzdjMDg4YWE5YThlM2Q3ZDVmNjU3YTk4NzZjODVkZmZmZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF8dS4=\n','2013-02-22 03:49:28'),('bdbe83db966504be6867480f4d872c04','MDZkZTk5NDgwMDU3NmEwMDA1YmE4MTZmYmVkZDE5YzMwMGQyNjJlMDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF9dS4=\n','2013-02-22 05:07:11'),('442b84cb642a786940288624f180c654','ODk0NjFiZTFjMTNiODJhMDYxNzgzM2JiZjUyYjAwNDc3NGUxNTEwZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF+dS4=\n','2013-02-22 05:11:50'),('1f7580a49748d703637fdeef8536e01f','NTVhZjg3Y2YzZmEyOGJhNzYxZjU5MzllMGExYTM4YzI5ZjFmYjkxNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigF/dS4=\n','2013-02-22 05:15:03'),('a577f9d8d891674aedf691d11558081e','YjUyMWMyZmYyNWZjMGU2NGZiOGEzMjFkNjRiMWQ2YWQxOWFlM2MxYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKAAHUu\n','2013-02-22 05:18:31'),('a3be35d827337348d6aaa3019d894bc1','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-22 13:41:07'),('bdbe3a738ff5ca65113e709c6137e813','MWE1OTMyNGU3MzhhZWEzMmYzYWNkY2I3YmY2MWRkZmJlZTJlYTE2YzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKCAHUu\n','2013-02-22 21:02:10'),('a9c29e32c7e08452313625f00c7257e6','YzZkYjdhYjU5N2Y4MTlhNzZjNjEzMDczZTVmMWJiMzg4NmQ2OGE1YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKDAHUu\n','2013-02-22 21:59:04'),('cc40f43549336be96c24ace41b69c02b','NGU3OWEwYjgzMTA2NjVkNzM0Nzc5MDUwMDNhMTc1ZTYwYWY5OTc4YjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKEAHUu\n','2013-02-22 22:16:12'),('7a4238cbd43858111d89207309dc31cf','ZjBhOTg4MDA5OTk4OTI4MWMxZTlkZDdlNmM1ZWE0N2I2ZWYxOWM1NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKFAHUu\n','2013-02-22 22:20:35'),('9a0d8db6e79eb81e8724019d445fab70','YmYzMjk4OGIxNmQ5ODBlZGI5NDViMTI5YjNmNzIxYWJhYWVlZDkxODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKGAHUu\n','2013-02-22 22:29:33'),('046816086219b3429f6f4fe4a6efce32','Mjc3MTUxMmM4Y2ZjZjU3NTUzYTI1ODkxYmY2NDRiYjBjODcyNWNkNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKHAHUu\n','2013-02-22 22:30:49'),('67d257df10d917ea6e95afb6dac5f695','ZmQ4NzRlYTNhY2QxNmI4YjllN2MyYzUwMmQzOWRmMzAxNTE0MjFjYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKIAHUu\n','2013-02-22 22:57:48'),('d9280479b4214275ec799bb05cdea867','NzllZTY5OTI2MDk1YTBjMWRjNWUyZmE4ODc3YjAzYTcwODBiZjRmMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKJAHUu\n','2013-02-22 23:19:46'),('837e207298bb6a918c0b0729402f00bd','YzRjZDBkNmZlN2RkOWY3MDQxNjQwZTIwMzI5ZmU5OTIxYzYyMGM5YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKKAHUu\n','2013-02-26 15:11:44'),('3aee7c0f21bbffee58ebcdf367286acb','NTA0ZWIwYTA0ZmM4Y2EyZDljZTJlMzdhNDBjNjM4ZWM1Mzg0ZDM2YTqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWRxAooCjgBVEl9hdXRoX3VzZXJfYmFja2VuZHEDVSdjbGllbnQuYmFja2VuZHMuQW5vbnlt\nb3VzUHJvZmlsZUJhY2tlbmRxBHUu\n','2013-02-26 17:19:24'),('eae2e1c9cb46239f42ba769c219b1355','ZmU2NmE4YWY4NDFkZjBjZWI3OTQ4ZmJhN2RjN2JiN2E1MTQ1NDk2MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKMAHUu\n','2013-02-26 16:04:22'),('851d950fd15fb2ba0666296124c4f9a3','MmIxMDYzMjViZmRjMDhjZjAzZWFmOWE1NGFlMzc4MDE3ZTk1MzMyNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKNAHUu\n','2013-02-26 16:24:35'),('3f8f3f3f235a8ed7ccc2cce2e318c0b1','MjdmM2Q3ZjRiMjYzOTRiZDRmZjJmNWQyZGEyNzcyNjMzODA0YTBhODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKPAHUu\n','2013-02-26 19:13:39'),('8b9cb50a6c4e5fe2c563d49f6fbb6c42','OTRkNzc3ZmI3ZDg4OTc5MjZjMDk3YTcxMjViMWU4ZDY3YTEwODVjZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKQAHUu\n','2013-03-05 12:52:16'),('cc1e9d064e8d6e01e7295d181e5e2e24','NjI2NTY4YTVlMjM1NTA3OWM2MjNhZmEyYWQ4N2NlYmY0NmY4MTYxZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKRAHUu\n','2013-03-05 14:21:13'),('58e00850cb6849707b7e73d7d4ba457d','NzRjODJlMjk2ZDZkN2I3MmUzNDNkNzlkMmViMGRhZWFmOGI2MmI1OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKSAHUu\n','2013-03-05 14:23:10'),('7f7765935f10d7690bb3a301ea714d66','YWJjMzk5NjY5YTNhOGY5NTlkMjM5NjA0MzUwZmYzZDZkZjUxNmQ0MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKTAHUu\n','2013-03-05 14:25:50'),('76f2d06501b49c4cc1ee748adb38509d','YTk0ZTU5MTA2ZDhjYTAwN2EzODFjNGFkYmI5MTkxZmFmOWQ1ZjAzMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKUAHUu\n','2013-03-05 14:44:45'),('bb4ce65c8c6b7b238ac89ede61223b98','NzM0M2U0NTkxNGQxYWUxMTg3NWE0ZmEzNmQ0NjczYzllNWYwOWUwZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKVAHUu\n','2013-03-05 14:51:59'),('de9866845cfc18ba89b2751285ec91ae','MjU5NmYxZGUzZjlhOTcyZmM3ZWVjMTk5NjZmMTBjM2I0MDNmOWU5MzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKWAHUu\n','2013-03-05 15:06:22'),('5cb81af5e5cb44ed5e41653b52a8724d','ODk0ZmNiNDYwZTdiZTQ4NThmYzhmMjA2MTQ3NjYxZWMwMjJmZTJmMTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKZAHUu\n','2013-03-05 17:33:16'),('f63e59e984e60b5569573119b0f6b2b9','OWZiNDgzNjYxYWNmZjFhMjY1ZmVjMDY5YTA0OWQ1OWNjMTA2NGE4ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKaAHUu\n','2013-03-05 17:35:42'),('82e44d7208c21bead27490e8f45f3ee6','ZmRjY2FhZTQ0ZTQwMzExODQxMDVhYzJmNDM5OTQzNmNlNWU5ZGE2YTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKbAHUu\n','2013-03-05 17:57:21'),('94a0e49bc375ce8eb410f0f59fcf2526','NzEwZDUwZDhjZTdlNDEyMzcyOTJjNWE0MmEyNTI2M2E1MTI5MjA1ZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKcAHUu\n','2013-03-05 20:42:33'),('0217e966c430c281c9bd5e3bd9fb39a8','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2013-03-05 22:18:16'),('623d7dbbf8d9b0cc2e5a5b691f5b3fec','NThjNzVkMWY4MDhkYzllMWM0MGQxOTBjY2I3ODViOTM4ZDRmM2M2NTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKeAHUu\n','2013-03-05 22:18:19'),('617f468a527c18531730f216c1dd4d15','OGJhOWNmZDY2MWZkOWZhOGE3YTI5NTAwYzU0OGU2MmMzZTJkODg5NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKfAHUu\n','2013-03-05 22:19:51'),('fd40f669e8c8430afd7b6d1b3469adbf','OTBjMDc2MTBmNjNkYzg2OWU4OWEyYzQ2OWUyYTEyYWJjYzY3YTRhZjqAAn1xAS4=\n','2013-03-05 22:53:05'),('dc6ef9f72bb9495669484b77d1db7a52','Yjg3Yzg2MGUyMjc3MTk2MTNlYWYwYzI2NzkwODY4OGE0MjFhYjU1MDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UN\nX2F1dGhfdXNlcl9pZHEEigKgAHUu\n','2013-03-05 22:53:41'),('69689c1fd4230e1a0843213663dda72a','NTczMzU2ZjJkZTdiMjU2YjNkNDI4M2FmYTMzZWJiYzJkOWM4MGUxOTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhf\ndXNlcl9pZHEEigKdAHUu\n','2013-03-05 23:19:41'),('xr2inxjobb7w4iyu81rw36b3y5a1nno0','MGFkNmFiNWFmNTk5NjAzMGM1NTNmNzljNDcyZGYyNWE4ZWU0YTg0NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKhAHUu','2013-08-29 16:40:04'),('85a97b17f10e1cb272a2082962aa6917','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-08-20 11:50:35'),('0f60ff3ac6dd5f7ededfbde8d5e09b37','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-08-20 12:05:53'),('54m2njx17zmay6r8sma2gdcdevzat4rn','MTRlYTkyZTQ2ZWQ1ODI1ZmZmOTI2ZmI0OTVjN2M3ZGVjZDcwMTNhMTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKiAHUu','2013-09-06 21:27:16'),('qumyf5po7dlx63irwujc6bh9vz4hd8u8','NjliMWRjNjhhNjMwYmQxMWIwN2RiOWI5MWQ1ZjMzOWViN2Y4YWM0NjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKjAHUu','2013-09-06 22:18:30'),('3wg62p2jrhef7ayunesyp0ydn7l74vqu','ZjU1YjE5YTEzMmJjZjNhNzBkNGU0ZTc4ZDhhYzcwMGQxOTNkMjM1OTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKkAHUu','2013-09-12 14:10:20'),('91vcfyj552v9jroit5attze0hywoo4xc','NjlhMWY0ZjAyOTE5NDkwMDcyZjhkZmNmMTYzNDg0MDQxNmEzNzQwNDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-11-07 12:30:53'),('kisewh602datv7qz0hdyi7zdccifznff','Y2JlNGRjYzRlMDZjNmVlZmY1NjhmZDY2YTEyNjgwYTgyMWMzMDNmMjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKmAHUu','2013-11-07 12:32:44'),('tomvtns6bqbcjw2rjm9s1y7782oi3uke','YjNiYmFkYTM0YmMwM2FlYTU0NjgxZTQwMzJiMTA4ZmQwYmU3YjYxODqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSdjbGllbnQuYmFja2VuZHMuQW5vbnltb3VzUHJvZmlsZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigKnAHUu','2013-11-07 13:18:59'),('fw1kdpykwaqr1zr935vt1ey3hggna19c','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:20:40'),('hmz15wf3wl7t2a94vugiro5zt14az0xj','YzlkMzdjZGNlOGU0YjBjZWQ1N2IyNjdhYTU2ZDU2YTllZTcxMjBkYzqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUhY2xpZW50LmJhY2tlbmRzLkVtYWlsTW9kZWxCYWNrZW5kcQJ1Lg==','2014-05-26 10:45:03'),('mnns3xuf6we23a8sk6uqkx29jzbqup6t','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:23:15'),('4a6269sauq6z6n8cql6oyvpq0bycx9u5','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:23:51'),('mw3aoe0wrczg53bb4bne8icr7ppokjni','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:24:35'),('ujs8mki3xalo073ukk76qfqm4p02dhyw','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:28:03'),('itbh9hhocdf6ixz9ju41mov664plaz5q','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:29:26'),('qh6oiji7oj4jr3sr2nnegtks74nlrj0m','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:33:42'),('3ztdt1xtpww155kx5u72o72mgu89v84o','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:35:03'),('egu4glqlmjanibw1ybwwgu1qr6j394jp','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:57:47'),('pyquq8lfuy5us7y7h2hpaswcw3xu3a47','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 12:58:30'),('r7g41gijklekx7mscdqd50p3xq6hcmyf','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 13:07:34'),('4kdgvz865e3r9nbnlh11732libqks283','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 13:08:18'),('wfufsd2n0itya4il24kgtxv01e6aqq8e','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 13:09:41'),('hn6cd565y1vivwcykmyc9up3xprjl8it','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 13:10:29'),('kf3wl8pe0ezmhlag1ao2k8yj9xygl2ab','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 13:12:32'),('fayi5045z1c6e4n90fsddw3lz0yaed4g','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 13:13:37'),('20rd3e981yz4b99962v6lse746rbjtom','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:41:19'),('yeavl53k8oi4ouqxclk7sosmuhfbjbpc','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:42:08'),('2h0z2pyf7nc8q5zro1p8afnauuytkjby','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:43:57'),('qyyk121vc1exufgo22l2z4pbr3cyv12z','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:45:53'),('vhlidf219swbpqvnrmcu69nezr9h91ze','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:47:45'),('e1a6zbxxctohzu46401bx30b792enqml','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:54:02'),('i3taco746bq800qvggsm37ya8ep8aayo','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:57:15'),('4zpatl60rfg0eurw9s6ehug733n2h0je','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 15:58:06'),('el8guzib6eiqy0bpd6h7r5ogee88cog0','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 16:11:53'),('g9h07egmrblsdfci34mwmn28acawk63a','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 16:19:32'),('93oy0kvudpfw98bwil89jg3fy1v78hl9','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 16:19:52'),('3zoe3hupv7qs6260d2hkvwu6nxiq9pkp','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 16:22:40'),('lg63jdgpq1evkv6zku8o1qgxcg6v7sna','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 16:23:22'),('dfj5bj6x3db8emeg02qllnwqaj3s7mbn','NmIwMjUxNDZlZTU2NzM5ZjFiM2I3ZTNjZGIxNWUxYjY4ZjRhMzM3NDqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2014-05-26 16:24:55'),('bdu09titfxbkuiuibw0jmgc6dpx47k6e','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 16:44:53'),('lfty0yk3jwinuny6n4pagqck2oabkuks','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 16:49:05'),('mnue5bn6z0l40tksifejecxbtw3bzrql','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 17:04:24'),('y8wuyauprvltbrs5opxksbp4n8b4vleg','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 17:05:42'),('1bpnj6spwbta7omqj7ivck3yu7edqvyr','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 17:25:20'),('idgpyl7v37ooz6wohgexvdru6vtcx2ig','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 17:26:29'),('dkkwj9ygw8ioeewelgtxxlknuwes4ihd','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 17:27:59'),('3rxtc4cltzyauhsyvy91dckezzrd63pm','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 17:30:29'),('npmc3a5d8091zqsmkd2n9l6nkt4ocfqe','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-26 18:46:03'),('0zjxrimnmbf4v160sbnhd54tkbyn2rfs','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:01:26'),('j9ck4fhgee0iye1dzgrtnmjm85pqdbp6','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:01:57'),('l54fmds3t2d6gd2zha9zmsm5dcoophr3','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:03:03'),('jpgeuha71wind4lilouycv7ic9r4sji9','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:07:07'),('1elxp3p29g59hh1sri5qg535ehfikv9e','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:08:08'),('kr4qhoellpufvsi9fgl8bkr4c9li3f8t','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:08:33'),('bkh3j164h9ixs35ddy50nz5ksn8lnecg','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:41:28'),('lwdakb7vqrt0sh4mr70387ik9j97anet','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:43:05'),('0s202zb4cqi3laui6j7nx04a6p44hjyj','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:44:46'),('4k75iflqe04tztwu7cbt1lkgpg951nar','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:48:50'),('92jhy11k3it003zdcmr8j66cz2l61yeg','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:49:32'),('rzpw68bw2g9r55v3qoy6cj9x44vma3kn','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:50:32'),('ulx1da9f5yx4f0qhl83iwkvx342rp5ca','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:51:13'),('s78vkuja3be8jmt2cviu854zcsj0kb73','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:52:50'),('8ivobbp5edpnajzp2d96dcqnzegq5teb','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 13:55:25'),('87jc59zku8clg4gab9fhwtyp083r2ewv','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:04:41'),('9vg46wp6fcvro83fjvghhh57yxng8658','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:07:30'),('yupyw05mm6g1son8zwyq6tn452ckc2bw','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:13:24'),('2rpxxm5r3aj0ivndsyo0u3dzyvosq2fx','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:15:08'),('zbwdhocwztln6pgqkjs6gs939lmejyw3','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:33:05'),('hsvvw7kibmrxdgu3d88qao9z8kql23lm','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:34:23'),('d3mpzisccv4blp3xm67kcmyds3qv3801','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:38:23'),('m4l4v1hziqgtef6m6ub5mwwv2qa1sz2j','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:39:06'),('a8xzfif4kg0bguttc6mp2d43bgros3w5','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:40:17'),('u58d2ig9zngiv4c38h0891thv7zdzfu4','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:41:08'),('87rp0jm5nvhwkzy5ht3gmvkdhj6jiy7t','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:41:36'),('3oiojxzillhalk78rmshqhpz65fvt90r','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:42:58'),('j036ey8mfnbpajzguis1ralqlsbp6th6','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:43:57'),('f4s22rxfwsbu35hvdcj579opjr679ve6','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:46:16'),('7hnjg0kz5r4begl8d3mvqg0r5sx03zv9','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:48:45'),('4jn9db918ecideyv96u4bjuu5i5uvfbc','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:53:25'),('py091139pigbg2gxxlmkvd3x0yvykl8v','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:54:18'),('l29a6ie5b1p755gh0d005hl97n5nfpxr','OTU0YzM4MmIxMWY5YTBlYjMwM2JjNjQ0NDhlMzM1NGZlNWUxZDVmYzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSFjbGllbnQuYmFja2VuZHMuRW1haWxNb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4=','2014-05-27 14:56:30');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
-- Table structure for table `order_menucategory`
--

DROP TABLE IF EXISTS `order_menucategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_menucategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `categ_type` varchar(32) NOT NULL,
  `num_orders_current` int(11) NOT NULL,
  `num_orders_prev` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_menucategory_08fd5523` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menucategory`
--

LOCK TABLES `order_menucategory` WRITE;
/*!40000 ALTER TABLE `order_menucategory` DISABLE KEYS */;
INSERT INTO `order_menucategory` VALUES (1,2,'Andrei\'s Beer','drinks',0,0),(2,2,'Andrei\'s Chips','food',0,0),(3,2,'Andrei\'s Cookies','desert',0,0),(4,2,'Andrei\'s Wine','drinks',0,0),(5,2,'Andrei\'s Seefood','food',0,0),(6,2,'Andrei\'s Cocktails','drinks',0,0);
/*!40000 ALTER TABLE `order_menucategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_menuitem`
--

DROP TABLE IF EXISTS `order_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` longtext,
  `price` double NOT NULL,
  `num_orders_current` int(11) NOT NULL,
  `num_orders_prev` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_menuitem_6f33f001` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_menuitem`
--

LOCK TABLES `order_menuitem` WRITE;
/*!40000 ALTER TABLE `order_menuitem` DISABLE KEYS */;
INSERT INTO `order_menuitem` VALUES (1,1,'RedBeer','Coolest beer in town!',3,0,0),(2,1,'YellowBeer','Coolest beer in town!',2.5,0,0),(3,1,'BlueBeer','Coolest beer in town!',4,0,0),(4,2,'RedChips','Coolest chips in town!',3,0,0),(5,2,'YellowChips','Coolest chips in town!',3,0,0),(6,2,'BlueChips','Coolest chips in town!',3,0,0),(7,1,'Orange Beer','Best Orange Beer in town!',4.5,0,0),(8,1,'Green Beer','Best Green Beer in town!',6.5,0,0),(9,1,'Dark Beer','Best Dark Beer in town!',5,0,0),(10,1,'Blond Beer','Best Blond Beer in town!',5.5,0,0),(11,2,'Orange Chips','',4,0,0),(12,2,'Green Chips','Best green chips in town!',4.5,0,0),(13,2,'Dark Chips','The name sounds silly :-)',4.5,0,0),(14,2,'Blond Chips','That\'s more like it :-)',4,0,0),(15,3,'Gold Cookies','You have to try these just by the sound of their name + they\'re a bargain.',4.98999977111816,0,0),(16,4,'Gold Wine','Best Wine in town!',23.5,0,0),(17,4,'Silver Wine','Second best wine in town!',17.9899997711182,0,0),(18,4,'Bronze Wine','Third best wine in town!',12.5,0,0),(19,5,'Crabs','Yummy crabs',21.9899997711182,0,0),(20,5,'Lobster','You must try this lobster!',51.5,0,0),(21,5,'Clams','The french agree that these are the best clams in town!',12.5,0,0),(22,6,'Gold Cocktail','Served to you in a gold cup :-)',10,0,0),(23,6,'Silver Cocktail','It glances in the light like snow on a new ski slope.',10,0,0);
/*!40000 ALTER TABLE `order_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderannotation`
--

DROP TABLE IF EXISTS `order_orderannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `order` longtext NOT NULL,
  PRIMARY KEY (`annotation_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderannotation`
--

LOCK TABLES `order_orderannotation` WRITE;
/*!40000 ALTER TABLE `order_orderannotation` DISABLE KEYS */;
INSERT INTO `order_orderannotation` VALUES (474,'{\"item_id_list\": [{\"id\": 15, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Cookies\", \"items\": \"1 x Gold Cookies (4.99 RON)\\n\"}]}'),(475,'{\"item_id_list\": [{\"id\": 11, \"quantity\": 1}, {\"id\": 12, \"quantity\": 2}, {\"id\": 13, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Chips\", \"items\": \"1 x Orange Chips (4.0 RON)\\n2 x Green Chips (4.5 RON)\\n1 x Dark Chips (4.5 RON)\\n\"}]}'),(476,'{\"item_id_list\": [{\"id\": 22, \"quantity\": 2}, {\"id\": 23, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Cocktails\", \"items\": \"2 x Gold Cocktail (10.0 RON)\\n1 x Silver Cocktail (9.0 RON)\\n\"}]}'),(503,'{\"item_id_list\": [{\"id\": 18, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"1 x Bronze Wine (12.5 RON)\\n\"}], \"order_request_type\": \"new_order\"}'),(504,'{\"item_id_list\": [{\"id\": 18, \"quantity\": 1}], \"order\": [{\"category\": \"Andrei\'s Wine\", \"items\": \"1 x Bronze Wine (12.5 RON)\\n\"}], \"order_request_type\": \"new_order\"}');
/*!40000 ALTER TABLE `order_orderannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderfeature`
--

DROP TABLE IF EXISTS `order_orderfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderfeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderfeature`
--

LOCK TABLES `order_orderfeature` WRITE;
/*!40000 ALTER TABLE `order_orderfeature` DISABLE KEYS */;
INSERT INTO `order_orderfeature` VALUES (2,'Order menu for Ciortea\'s.'),(4,'Order menu for Area 1.'),(6,'Order menu for Area 2.'),(8,'Order menu for Area 3.'),(10,'Order menu for Area 4.');
/*!40000 ALTER TABLE `order_orderfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_peoplefeature`
--

DROP TABLE IF EXISTS `people_peoplefeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_peoplefeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_peoplefeature`
--

LOCK TABLES `people_peoplefeature` WRITE;
/*!40000 ALTER TABLE `people_peoplefeature` DISABLE KEYS */;
INSERT INTO `people_peoplefeature` VALUES (36,'people feature for Blue Hall'),(38,'people feature for Room 443D'),(40,'people feature for Room 443C'),(42,'people feature for University Hall');
/*!40000 ALTER TABLE `people_peoplefeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_presentation`
--

DROP TABLE IF EXISTS `program_presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_presentation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `abstract` longtext,
  `tags` longtext,
  PRIMARY KEY (`id`),
  KEY `program_presentation_a4c07742` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_presentation`
--

LOCK TABLES `program_presentation` WRITE;
/*!40000 ALTER TABLE `program_presentation` DISABLE KEYS */;
INSERT INTO `program_presentation` VALUES (1,1,'Constructing the Google Knowledge Graph','2013-02-23 11:00:00','2013-02-23 11:45:00','If we were presented with the task of compiling an \r\nimaginary Compendium of Questions about Everything, most of the\r\nqueries we submit to the largest Web search engines would not exactly\r\nqualify as worthy, ready-to-use additions to the compendium. Our\r\nqueries are often little more than short, keyword-based approximations\r\nof underspecified information needs. But as noisy and unreliable as\r\nthey may be, queries still convey knowledge in themselves, just as\r\nthey specify constraints (keywords and phrases) that loosely describe\r\nwhat knowledge is being requested. After all, asking \"how many\r\ncalories are burned during skiing\" implies that skiing may be an\r\nactivity during which the body consumes calories. As such, search\r\nqueries are cursory reflections of the Compendium of Everything, as\r\nencoded deeply within unstructured and structured content available in\r\ndocuments on the Web and elsewhere. More than just an imaginary task,\r\ncreating a Compendium of Everything would fit into long-standing goals\r\nin artificial intelligence. Automatically digesting large amounts of\r\ntext into knowledge repositories is a step towards deeper text\r\nunderstanding, with potential in Web search and beyond.','Information Retrieval;Semantic Web;Knowledge Representation;Natural Language Processing'),(2,1,'HipHop','2013-02-23 11:45:00','2013-02-23 12:30:00','PHP has been an important element of Facebook\'s architectural\r\nstack. It has well-known and widely-debated troubles and redeeming\r\nqualities. One sticky point is efficiency - PHP is fundamentally an\r\ninterpreted language, which makes it difficult to get from PHP source\r\ncode to efficient execution. HipHop for PHP is an open-source project by\r\nFacebook that has addressed the efficiency aspect in several interesting\r\nways, including a static compiler and a virtual machine. This talk\r\nexplores the history, evolution, and outlook of HipHop.\r\n','PHP;compilers;virtual machine'),(3,1,'Power Up Your Environment','2013-02-23 11:45:00','2013-02-23 12:15:00','Talk about Social Web of Things and the Envived Project.','Web of Things;smart environments;ambient intelligence'),(4,1,'NAO – Next Generation','2013-02-23 12:15:00','2013-02-23 13:00:00','','Artificial Intelligence;Robotics;Nao'),(5,1,'Semantic Technologies in Practice','2013-02-23 15:15:00','2013-02-23 16:00:00','','Semantic Web;Ontologies'),(6,1,'TBA','2013-02-23 16:00:00','2013-02-23 16:30:00','','Artificial Intelligence;UAVs;Robotics'),(7,1,'What makes a good research/engineering culture?','2013-02-23 16:30:00','2013-02-23 17:00:00','Panel discussion about what makes a good research/engineering culture.','Discussion;research;industry;academia');
/*!40000 ALTER TABLE `program_presentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_presentation_speakers`
--

DROP TABLE IF EXISTS `program_presentation_speakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_presentation_speakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `presentation_id` int(11) NOT NULL,
  `speaker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `presentation_id` (`presentation_id`,`speaker_id`),
  KEY `program_presentation_speakers_9d77fa18` (`presentation_id`),
  KEY `program_presentation_speakers_81845411` (`speaker_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_presentation_speakers`
--

LOCK TABLES `program_presentation_speakers` WRITE;
/*!40000 ALTER TABLE `program_presentation_speakers` DISABLE KEYS */;
INSERT INTO `program_presentation_speakers` VALUES (1,1,2),(2,2,1),(3,3,3),(4,3,4),(5,4,7),(6,5,6),(7,6,5),(8,7,1),(9,7,2),(10,7,4);
/*!40000 ALTER TABLE `program_presentation_speakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_programannotation`
--

DROP TABLE IF EXISTS `program_programannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_programannotation` (
  `annotation_ptr_id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `presentation_id` int(11) NOT NULL,
  PRIMARY KEY (`annotation_ptr_id`),
  KEY `program_programannotation_9d77fa18` (`presentation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_programannotation`
--

LOCK TABLES `program_programannotation` WRITE;
/*!40000 ALTER TABLE `program_programannotation` DISABLE KEYS */;
INSERT INTO `program_programannotation` VALUES (522,'does it appear with my name?',3),(529,'ggxgv gfvhn',1),(530,'hffhh vcbnhv',1),(531,'alfa\'s comments are always to the point',1),(532,'starting work again',3),(533,'testing',3),(534,'why was the first comment off sync with server timestamp?',3);
/*!40000 ALTER TABLE `program_programannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_programfeature`
--

DROP TABLE IF EXISTS `program_programfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_programfeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_programfeature`
--

LOCK TABLES `program_programfeature` WRITE;
/*!40000 ALTER TABLE `program_programfeature` DISABLE KEYS */;
INSERT INTO `program_programfeature` VALUES (44,'View the list of exciting talks about AI technologies that are \r\nin use today at various national and international companies.');
/*!40000 ALTER TABLE `program_programfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_session`
--

DROP TABLE IF EXISTS `program_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `tag` varchar(8) NOT NULL,
  `program_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `program_session_cdb5484e` (`program_id`),
  KEY `program_session_afbb987d` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_session`
--

LOCK TABLES `program_session` WRITE;
/*!40000 ALTER TABLE `program_session` DISABLE KEYS */;
INSERT INTO `program_session` VALUES (1,'AI Talks','aitalk',44,9);
/*!40000 ALTER TABLE `program_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_speaker`
--

DROP TABLE IF EXISTS `program_speaker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_speaker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `affiliation` varchar(128) NOT NULL,
  `position` varchar(64) NOT NULL,
  `biography` longtext,
  `email` varchar(75) DEFAULT NULL,
  `online_profile_link` varchar(200) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `first_name` (`first_name`,`last_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_speaker`
--

LOCK TABLES `program_speaker` WRITE;
/*!40000 ALTER TABLE `program_speaker` DISABLE KEYS */;
INSERT INTO `program_speaker` VALUES (1,'Andrei','Alexandrescu','Facebook, Inc.','Research Scientist','Romanian-born Computer Scientist Andrei Alexandrescu is an expert in a broad range of topics including software systems design and implementation, programming language design, library design, all aspects of the C++ and D programming languages, Machine Learning, and Natural Language Processing. His creative approach to problem solving, broad knowledge, and charismatic presence make Andrei a sought-after invited speaker at conferences worldwide.\r\nAlexandrescu received an M.S. degree in electronics from Polytechnic University of Bucharest (Universitatea Politehnica din București) in July 1994. He earned an M.S. (2003) and a Ph.D. (2009) in computer science from the University of Washington.\r\nCurrently Andrei works as a Research Scientist at Facebook.','andrei@erdani.com','http://erdani.com/index.php/about/',NULL),(2,'Marius','Pasca','Google, Inc.','Research Scientist','Marius Pasca is a research scientist at Google Inc. specializing in areas like Natural Language Processing,\r\nArtificial Intelligence and Machine Learning, Information Retrieval and the Web, Machine Translation and Human-Computer Interaction and Visualization.\r\nHe received his B.Sc. degree in September 1997 in Romania, at the Technical University of Cluj-Napoca and completed his Master of Science studies in May 1998 at the Universite Joseph Fourier in Grenoble, France, working on the subject of \"Relevance Evaluation in an Information Retrieval System based on Conceptual Graphs\".\r\nHe then earned his PhD in Computer Science in 2001 at the Southern Methodist University, Texas, US.','mars@google.com','http://research.google.com/pubs/author107.html',NULL),(3,'Alexandru','Sorici','AQUAsoft','Research Scientist','','alex.sorici@aquasoft.ro','',''),(4,'Andrei','Ciortea','ARIA','Board Member','','andrei.ciortea@gmail.com','',''),(5,'Mihai','Trăscău','TeamNet','Research Scientist','','mihai.trascau@gmail.com','',''),(6,'Robert','Băban','Recognos','Senior Software Engineer','','','',''),(7,'Cornel','Catană','Robotsnet Consulting','Research Scientist','','','','');
/*!40000 ALTER TABLE `program_speaker` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
INSERT INTO `registration_registrationprofile` VALUES (1,157,'ALREADY_ACTIVATED');
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialmedia_socialmediafeature`
--

DROP TABLE IF EXISTS `socialmedia_socialmediafeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialmedia_socialmediafeature` (
  `feature_ptr_id` int(11) NOT NULL,
  `facebook_url` varchar(256) DEFAULT NULL,
  `twitter_url` varchar(256) DEFAULT NULL,
  `google_plus_url` varchar(256) DEFAULT NULL,
  `internal_forum_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`feature_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialmedia_socialmediafeature`
--

LOCK TABLES `socialmedia_socialmediafeature` WRITE;
/*!40000 ALTER TABLE `socialmedia_socialmediafeature` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialmedia_socialmediafeature` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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

-- Dump completed on 2014-05-13 17:24:32
