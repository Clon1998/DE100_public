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
-- Dumping data for table `a3_types`
--

LOCK TABLES `a3_types` WRITE;
/*!40000 ALTER TABLE `a3_types` DISABLE KEYS */;
INSERT INTO `a3_types` VALUES (0,'Gewehre','a3\\ui_f\\data\\GUI\\Rsc\\RscDisplayArsenal\\primaryWeapon_ca.paa','rifles'),(1,'Pistolen','a3\\ui_f\\data\\GUI\\Rsc\\RscDisplayArsenal\\handgun_ca.paa','pistols'),(2,'Munition','a3\\ui_f\\data\\GUI\\Rsc\\RscDisplayArsenal\\cargoMag_ca.paa','ammunition'),(3,'Zubehör','a3\\ui_f\\data\\GUI\\Rsc\\RscDisplayArsenal\\itemOptic_ca.paa','accessoires'),(4,'Sonstiges','a3\\ui_f\\data\\GUI\\Rsc\\RscDisplayArsenal\\map_ca.paa','misc'),(5,'Bekleidungen',NULL,'uniform'),(6,'Kopfbedeckungen',NULL,'headgear'),(7,'Brillen',NULL,'goggle'),(8,'Westen',NULL,'vest'),(9,'Rucksäcke',NULL,'backpack');
/*!40000 ALTER TABLE `a3_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-06 19:00:09
