CREATE DATABASE  IF NOT EXISTS `arma_cfgs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `arma_cfgs`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 193.70.81.20    Database: arma_cfgs
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
-- Table structure for table `al_vitems`
--

DROP TABLE IF EXISTS `al_vitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `al_vitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(45) NOT NULL DEFAULT 'blueprint',
  `icon` varchar(45) NOT NULL DEFAULT 'images\\items\\ico_unknown.paa',
  `displayname` varchar(45) NOT NULL DEFAULT 'Keine Information',
  `weigt` int(11) NOT NULL DEFAULT '1',
  `illegal` tinyint(1) NOT NULL DEFAULT '0',
  `store` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Soll das Item als Gear beim Spieler/Fahrzeug gespeichert werden ?',
  `prof` varchar(45) DEFAULT NULL,
  `faq` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Soll das Item in der Preisliste im FAQ auftauchen',
  `stateOfMatter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 =  Fest, 1  = Flüssig -> ben. Tanklaster, 2 = Gas -> ben. Gas Veh.',
  `food` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-06 18:15:12
