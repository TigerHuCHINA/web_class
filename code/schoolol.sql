CREATE DATABASE  IF NOT EXISTS `schoolol` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `schoolol`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: schoolol
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `agree`
--

DROP TABLE IF EXISTS `agree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agree` (
  `id` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `commentId` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_id_idx` (`userId`),
  KEY `agree_comment_id_idx` (`commentId`),
  CONSTRAINT `agree_comment_id` FOREIGN KEY (`commentId`) REFERENCES `comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agree_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agree`
--

LOCK TABLES `agree` WRITE;
/*!40000 ALTER TABLE `agree` DISABLE KEYS */;
/*!40000 ALTER TABLE `agree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` varchar(45) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_user_id_idx` (`userId`),
  CONSTRAINT `class_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `videoId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collection_user_id_idx` (`userId`),
  KEY `collection_video_id_idx` (`videoId`),
  CONSTRAINT `collection_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `collection_video_id` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `videoId` int(11) NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL,
  `agree` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `comment_user_id_idx` (`userId`),
  KEY `comment_video_id_idx` (`videoId`),
  CONSTRAINT `comment_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_video_id` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` varchar(45) NOT NULL,
  `followerId` varchar(45) NOT NULL,
  `followeeId` varchar(45) NOT NULL,
  `classId` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `follow_follower_id_idx` (`followerId`),
  KEY `follow_followee_id_idx` (`followeeId`),
  KEY `follow_class_id_idx` (`classId`),
  CONSTRAINT `follow_class_id` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `follow_followee_id` FOREIGN KEY (`followeeId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `follow_follower_id` FOREIGN KEY (`followerId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` varchar(45) NOT NULL,
  `passId` varchar(45) NOT NULL,
  `acceptId` varchar(45) NOT NULL,
  `content` text,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_pass_id_idx` (`passId`),
  KEY `message_accept_id_idx` (`acceptId`),
  CONSTRAINT `message_accept_id` FOREIGN KEY (`acceptId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `message_pass_id` FOREIGN KEY (`passId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idname` varchar(30) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `sex` varchar(10) DEFAULT 'unknown',
  `headphoto` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `school` varchar(45) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`idname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('11','11','11','unknown',NULL,NULL,NULL,NULL,NULL),('111','111','111','unknown',NULL,NULL,NULL,NULL,NULL),('12','45345345','12','unknown',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) NOT NULL,
  `groupId` varchar(45) DEFAULT NULL,
  `categoryId` varchar(45) DEFAULT NULL,
  `title` varchar(80) DEFAULT NULL,
  `introduce` text,
  `view` int(11) DEFAULT '0',
  `time` datetime DEFAULT NULL,
  `file` longblob,
  PRIMARY KEY (`id`),
  KEY `video_user_id_idx` (`userId`),
  KEY `video_group_id_idx` (`groupId`),
  KEY `video_category_id_idx` (`categoryId`),
  CONSTRAINT `video_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `schoolol`.`video_BEFORE_INSERT` BEFORE INSERT ON `video` FOR EACH ROW
BEGIN
	set new.time = current_time;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `videogroup`
--

DROP TABLE IF EXISTS `videogroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videogroup` (
  `id` varchar(45) NOT NULL,
  `userId` varchar(45) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `videogroup_user_id_idx` (`userId`),
  CONSTRAINT `videogroup_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogroup`
--

LOCK TABLES `videogroup` WRITE;
/*!40000 ALTER TABLE `videogroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `videogroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videorecord`
--

DROP TABLE IF EXISTS `videorecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videorecord` (
  `id` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `videoId` int(11) NOT NULL,
  `videotime` double NOT NULL,
  `daytime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `videorecord_user_id_idx` (`userId`),
  KEY `videorecord_video_id_idx` (`videoId`),
  CONSTRAINT `videorecord_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`idname`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `videorecord_video_id` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videorecord`
--

LOCK TABLES `videorecord` WRITE;
/*!40000 ALTER TABLE `videorecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `videorecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'schoolol'
--

--
-- Dumping routines for database 'schoolol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-09 10:34:28
