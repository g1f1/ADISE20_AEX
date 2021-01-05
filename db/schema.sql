-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: new
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `position_x` tinyint(1) NOT NULL,
  `position_y` tinyint(1) NOT NULL,
  `board_color` enum('B','W') NOT NULL,
  `checker_color` enum('W','B') DEFAULT NULL,
  `checker` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') DEFAULT NULL,
  PRIMARY KEY (`position_x`,`position_y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,1,'B','W','P1'),(1,2,'B','W','P2'),(1,3,'B','W','P3'),(1,4,'B','W','P4'),(1,5,'B','W','P5'),(1,6,'B',NULL,NULL),(2,1,'W',NULL,NULL),(2,2,'W',NULL,NULL),(2,3,'W',NULL,NULL),(2,4,'W',NULL,NULL),(2,5,'W',NULL,NULL),(2,6,'W',NULL,NULL),(3,1,'B',NULL,NULL),(3,2,'B',NULL,NULL),(3,3,'B',NULL,NULL),(3,4,'B',NULL,NULL),(3,5,'B',NULL,NULL),(3,6,'B',NULL,NULL),(4,1,'W',NULL,NULL),(4,2,'W',NULL,NULL),(4,3,'W',NULL,NULL),(4,4,'W',NULL,NULL),(4,5,'W',NULL,NULL),(4,6,'W',NULL,NULL),(5,1,'B',NULL,NULL),(5,2,'B',NULL,NULL),(5,3,'B',NULL,NULL),(5,4,'B',NULL,NULL),(5,5,'B',NULL,NULL),(5,6,'B',NULL,NULL),(6,1,'W',NULL,NULL),(6,2,'W',NULL,NULL),(6,3,'W',NULL,NULL),(6,4,'W',NULL,NULL),(6,5,'W',NULL,NULL),(6,6,'W',NULL,NULL),(7,1,'B',NULL,NULL),(7,2,'B',NULL,NULL),(7,3,'B',NULL,NULL),(7,4,'B',NULL,NULL),(7,5,'B',NULL,NULL),(7,6,'B',NULL,NULL),(8,1,'W',NULL,NULL),(8,2,'W',NULL,NULL),(8,3,'W',NULL,NULL),(8,4,'W',NULL,NULL),(8,5,'W',NULL,NULL),(8,6,'W',NULL,NULL),(9,1,'B',NULL,NULL),(9,2,'B',NULL,NULL),(9,3,'B',NULL,NULL),(9,4,'B',NULL,NULL),(9,5,'B',NULL,NULL),(9,6,'B',NULL,NULL),(10,1,'W',NULL,NULL),(10,2,'W',NULL,NULL),(10,3,'W',NULL,NULL),(10,4,'W',NULL,NULL),(10,5,'W',NULL,NULL),(10,6,'W',NULL,NULL),(11,1,'B',NULL,NULL),(11,2,'B',NULL,NULL),(11,3,'B',NULL,NULL),(11,4,'B',NULL,NULL),(11,5,'B',NULL,NULL),(11,6,'B',NULL,NULL),(12,1,'W','B','P1'),(12,2,'W','B','P2'),(12,3,'W','B','P3'),(12,4,'W','B','P4'),(12,5,'W','B','P5'),(12,6,'W','B','P6');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_empty`
--

DROP TABLE IF EXISTS `board_empty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_empty` (
  `position_x` tinyint(1) NOT NULL,
  `position_y` tinyint(1) NOT NULL,
  `board_color` enum('B','W') DEFAULT NULL,
  `checker_color` enum('W','B') DEFAULT NULL,
  `checker` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') DEFAULT NULL,
  PRIMARY KEY (`position_x`,`position_y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_empty`
--

LOCK TABLES `board_empty` WRITE;
/*!40000 ALTER TABLE `board_empty` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_status`
--

DROP TABLE IF EXISTS `game_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `player_turn` enum('W','B') DEFAULT NULL,
  `resutl` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_status`
--

LOCK TABLES `game_status` WRITE;
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN


	SET NEW.last_change = NOW();


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `checker_color` enum('B','W') NOT NULL,
  PRIMARY KEY (`checker_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'new'
--
/*!50003 DROP PROCEDURE IF EXISTS `clean_board` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board`()
BEGIN


REPLACE INTO board SELECT * FROM board_empty;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `move_checker` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `move_checker`(`x1` TINYINT, `y1` TINYINT, `x2` TINYINT, `y2` TINYINT)
BEGIN
DECLARE c, c_color CHAR;
SELECT checker, checker_color INTO c, c_color
FROM `board` WHERE X=x1 AND Y=y1;
UPDATE board
SET checker=p, checker_color=c_color
WHERE X=x2 AND Y=y2;
UPDATE board
SET checker=NULL,checker_color=NULL
WHERE X=x1 AND Y=y1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-10 15:41:01
