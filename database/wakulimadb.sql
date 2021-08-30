CREATE DATABASE  IF NOT EXISTS `wakulima` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wakulima`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: wakulima
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_county` varchar(20) DEFAULT NULL,
  `manager` varchar(30) DEFAULT NULL,
  `supplier` varchar(30) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `date_supplied` date DEFAULT NULL,
  `amount_owned` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'soy','kiplangat','emmanuel korir',6,'2021-07-21',59550),(2,'soy','kiplangat','peter kimani',7,'2021-03-26',67006),(3,'moiben','kipkesoi','chemiron beryl',3,'2021-08-28',23580),(4,'kesses','geoffery','tapkil jan',10,'2021-06-11',90750),(5,'turbo','benson','emmanuel korir',9,'2021-02-25',87240),(6,'kapseret','kilunda','chesoi saitore',4,'2021-07-01',40550),(7,'ainabkoi','kiplangat','martin sawe',16,'2021-05-13',102000),(8,'kesses','geofery','judith syokau',6,'2021-05-18',72040),(9,'kesses','geofery','judith syokau',6,'2021-05-18',72040),(12,'kesses','geofery','judith syokau',6,'2021-05-18',72040),(16,'kesses','geofery','keino martin',9,'2021-04-20',95040),(17,'kesses','geofery','keino martin',9,'2021-04-20',95040),(18,'moiben','kipkesoi','john kinyua',15,'2021-08-14',170040);
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wakulima'
--
/*!50003 DROP PROCEDURE IF EXISTS `newsuppliy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`byron`@`localhost` PROCEDURE `newsuppliy`(
IN _id int,
IN _sub_county varchar(20),
IN _manager varchar(30),
IN _supplier varchar(30),
IN _quantity int,
IN _date_supplied date,
IN _amount_owned int
)
BEGIN
	if _id = 0 then
		insert into supplies(sub_county,manager,supplier,quantity,date_supplied,amount_owned)
        values (_sub_county,_manager,_supplier,_quantity,_date_supplied,_amount_owned);
        
        set _id = last_insert_id();
	else
		update supplies
        set sub_county =_sub_county, manager=_manager, supplier=_supplier, date_supplied=_date_supplied, amount_owned=amount_owned
        where id=_id;
        
	end if;
    
    select _id as 'id';

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

-- Dump completed on 2021-08-30 22:40:00
