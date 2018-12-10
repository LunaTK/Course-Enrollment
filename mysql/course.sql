CREATE DATABASE  IF NOT EXISTS `course` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `course`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: softwarepractice4.cxchxxx8qkvh.ap-northeast-2.rds.amazonaws.com    Database: course
-- ------------------------------------------------------
-- Server version	5.6.41-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id_admin` varchar(255) NOT NULL,
  `pswd_admin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','1111');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_credit` int(11) DEFAULT NULL,
  `class_people` int(11) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `class_professor` varchar(255) DEFAULT NULL,
  `class_room` int(11) DEFAULT NULL,
  `class_year` int(11) DEFAULT NULL,
  `class_max_people` int(11) DEFAULT NULL,
  `class_state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (25,5,6,'운영체제','윤희용',99999,3,6,'진행중'),(26,2,2,'성균논어','김용복',51206,2,30,'폐강'),(27,3,2,'세계의정원과문화','김도훈',51205,3,50,'폐강'),(30,3,1,'태근이의수업','문태근',27134,3,10,'폐강');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_time`
--

DROP TABLE IF EXISTS `class_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_time` (
  `class_id` int(11) NOT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `day_of_class` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `class_time_ibfk_1` (`class_id`),
  CONSTRAINT `class_time_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_time`
--

LOCK TABLES `class_time` WRITE;
/*!40000 ALTER TABLE `class_time` DISABLE KEYS */;
INSERT INTO `class_time` VALUES (26,900,1050,'3',31),(27,1100,1250,'4',32),(25,1200,1315,'2',39),(30,1700,1800,'2',40);
/*!40000 ALTER TABLE `class_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `class_with_time`
--

DROP TABLE IF EXISTS `class_with_time`;
/*!50001 DROP VIEW IF EXISTS `class_with_time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `class_with_time` AS SELECT 
 1 AS `class_id`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `day_of_class`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enroll_list`
--

DROP TABLE IF EXISTS `enroll_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enroll_list` (
  `sequence_number` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `student_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`sequence_number`),
  KEY `student_number_idx` (`student_number`),
  KEY `class_id_idx` (`class_id`),
  CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `student_number` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll_list`
--

LOCK TABLES `enroll_list` WRITE;
/*!40000 ALTER TABLE `enroll_list` DISABLE KEYS */;
INSERT INTO `enroll_list` VALUES (20,29,2015313510),(27,24,2015313050),(48,25,2015313510),(49,27,2015313510),(50,26,2015313050),(51,27,2015313050),(52,30,2015313050);
/*!40000 ALTER TABLE `enroll_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `enrolled_credit`
--

DROP TABLE IF EXISTS `enrolled_credit`;
/*!50001 DROP VIEW IF EXISTS `enrolled_credit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `enrolled_credit` AS SELECT 
 1 AS `student_number`,
 1 AS `enrolled_credit`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_number` int(11) NOT NULL,
  `student_pswd` varchar(255) DEFAULT NULL,
  `allowed_credit` int(11) DEFAULT NULL,
  `student_year` int(11) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (11111111,'1111',18,3,'dongsu'),(22222222,'2222',18,3,'new'),(2015123456,'1234',18,4,'홍길동'),(2015313050,'1111',18,4,'한성혜'),(2015313510,'1234',18,3,'문태근'),(2015314089,'1234',18,3,'문퇴근'),(2015999999,'1234',2,3,'구구콘');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `time_table`
--

DROP TABLE IF EXISTS `time_table`;
/*!50001 DROP VIEW IF EXISTS `time_table`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `time_table` AS SELECT 
 1 AS `class_id`,
 1 AS `class_name`,
 1 AS `class_room`,
 1 AS `class_professor`,
 1 AS `day_of_class`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `student_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wish_list` (
  `sequence_number` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `student_number` int(11) NOT NULL,
  PRIMARY KEY (`sequence_number`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` VALUES (41,25,2015313510),(42,26,2015313510),(43,27,2015313510);
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `class_with_time`
--

/*!50001 DROP VIEW IF EXISTS `class_with_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lunatk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `class_with_time` AS select `c`.`class_id` AS `class_id`,`t`.`start_time` AS `start_time`,`t`.`end_time` AS `end_time`,`t`.`day_of_class` AS `day_of_class` from (`class` `c` join `class_time` `t` on((`c`.`class_id` = `t`.`class_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `enrolled_credit`
--

/*!50001 DROP VIEW IF EXISTS `enrolled_credit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lunatk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `enrolled_credit` AS select `el`.`student_number` AS `student_number`,sum(`c`.`class_credit`) AS `enrolled_credit` from (`enroll_list` `el` join `class` `c` on((`c`.`class_id` = `el`.`class_id`))) group by `el`.`student_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `time_table`
--

/*!50001 DROP VIEW IF EXISTS `time_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`lunatk`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `time_table` AS select `c`.`class_id` AS `class_id`,`c`.`class_name` AS `class_name`,`c`.`class_room` AS `class_room`,`c`.`class_professor` AS `class_professor`,`ct`.`day_of_class` AS `day_of_class`,`ct`.`start_time` AS `start_time`,`ct`.`end_time` AS `end_time`,`e`.`student_number` AS `student_number` from ((`class_time` `ct` join `class` `c` on((`c`.`class_id` = `ct`.`class_id`))) join `enroll_list` `e` on((`e`.`class_id` = `c`.`class_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-10 21:15:07
