CREATE DATABASE  IF NOT EXISTS `arma_main_server` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `arma_main_server`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 193.70.81.20    Database: arma_main_server
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(17) NOT NULL,
  `guid` varchar(32) NOT NULL DEFAULT '',
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `notes` varchar(100) NOT NULL DEFAULT '0',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15') NOT NULL DEFAULT '0',
  `thrlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `nobody_level` enum('0','1') NOT NULL DEFAULT '0',
  `backpack` varchar(128) DEFAULT NULL,
  `skin_tier` tinyint(4) NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `thr_licenses` text,
  `cop_gear` text NOT NULL,
  `civ_gear` text NOT NULL,
  `thr_gear` text,
  `nobody_gear` text,
  `cop_prof` text,
  `civ_prof` text,
  `thr_prof` text,
  `achievements` text,
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `life_gang` tinyint(5) NOT NULL DEFAULT '0',
  `life_civjob` int(25) NOT NULL DEFAULT '0',
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `idCard` text NOT NULL,
  `SkinDesMonats` tinyint(1) NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `lastLogged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `first_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `advent` varchar(45) DEFAULT NULL,
  `newBee` tinyint(1) NOT NULL DEFAULT '0',
  `playtime_sum` int(100) DEFAULT NULL,
  `alias_sum` text,
  PRIMARY KEY (`uid`,`playerid`,`guid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=5316 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `arma_main_server`.`money_tracker` before UPDATE ON `players` FOR EACH ROW
BEGIN
IF NEW.cash <> OLD.cash OR NEW.bankacc <> OLD.bankacc THEN
INSERT INTO `arma_main_server`.`money_tracker`
(`pid`,
`value`,
`insert_time`)
VALUES
(NEW.playerid,NEW.cash+NEW.bankacc,NOW());
END IF;
END */;;
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

-- Dump completed on 2018-09-06 18:15:19
