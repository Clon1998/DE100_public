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
-- Dumping data for table `al_shops`
--

LOCK TABLES `al_shops` WRITE;
/*!40000 ALTER TABLE `al_shops` DISABLE KEYS */;
INSERT INTO `al_shops` VALUES (1,'w_gen','Robins Ramschladen','1111',NULL),(2,'w_gas','Lars Tanke','1111',NULL),(3,'w_gun','Wolle Waffe kaufen?','1000','gun'),(4,'w_thr','Tims Apotheke','0010',NULL),(5,'w_reb','Abdulas Waffenladen','1000','rebel'),(6,'w_cop','Thorstens Sicherheitsbedarf','0100',NULL),(7,'w_bm','Sheikh Ahmed Salims Weg zum Glück','1000','blackmarket'),(8,'w_nb','Nobody Ausstatter','0001',NULL),(9,'w_ty','Danke für die Unterstützung','1000',NULL),(10,'c_gen','Bruces Outback Outfits','1001',NULL),(11,'c_cop','Thorstens Sicherheitsbedarf','0100',NULL),(12,'c_thr','Die Apotheke zieht weiter','0010',NULL),(13,'c_dive','Taucherladen','1001','dive'),(14,'c_reb','Abdulas Kleidung','1001','rebel'),(15,'c_cart','Racing Kleidung','1001',NULL),(16,'c_bm','Schwarzmarkt Kleidung','1001','blackmarket'),(17,'c_rad','Korrupter Wissenschaftler','1000',NULL),(18,'test','TestShop','0000',NULL);
/*!40000 ALTER TABLE `al_shops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-06 19:00:08
