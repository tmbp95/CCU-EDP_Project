-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: db.tecnico.ulisboa.pt    Database: ist174270
-- ------------------------------------------------------
-- Server version	5.5.54-0+deb8u1-log

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `client_id` int(11) DEFAULT NULL,
  `consumption` text CHARACTER SET utf8,
  KEY `client_id` (`client_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (40,'string'),(1,'string'),(2,'string'),(10,'string'),(0,'0');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumedenergy`
--

DROP TABLE IF EXISTS `consumedenergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumedenergy` (
  `producer_id` int(11) NOT NULL,
  `increment_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` float NOT NULL,
  `posted_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`increment_id`),
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `consumedenergy_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`producer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumedenergy`
--

LOCK TABLES `consumedenergy` WRITE;
/*!40000 ALTER TABLE `consumedenergy` DISABLE KEYS */;
INSERT INTO `consumedenergy` VALUES (1,1,6,'2017-11-28 00:25:00'),(1,2,7,'2017-11-28 01:25:00'),(1,3,5,'2017-11-28 02:25:00'),(1,4,4,'2017-11-28 03:25:00'),(1,5,7,'2017-11-28 04:25:00'),(1,6,9,'2017-11-28 05:25:00'),(1,7,15,'2017-11-28 06:25:00'),(1,8,25,'2017-11-28 07:25:00'),(1,9,33,'2017-11-28 08:25:00'),(1,10,45,'2017-11-28 09:25:00'),(1,11,65,'2017-11-28 10:25:00'),(1,12,78,'2017-11-28 11:25:00'),(1,13,139,'2017-11-28 12:25:00'),(1,14,153,'2017-11-28 13:25:00'),(1,15,238,'2017-11-28 14:25:00'),(1,16,156,'2017-11-28 15:25:00'),(1,17,102,'2017-11-28 16:25:00'),(1,18,75,'2017-11-28 17:25:00'),(1,19,53,'2017-11-28 18:25:00'),(1,20,27,'2017-11-28 19:25:00'),(1,21,13,'2017-11-28 20:25:00'),(1,22,8,'2017-11-28 21:25:00'),(1,23,6,'2017-11-28 22:25:00'),(1,24,8,'2017-11-28 23:25:00'),(1,25,9,'2017-11-29 00:25:00'),(1,26,13,'2017-11-29 01:25:00'),(1,27,16,'2017-11-29 02:25:00'),(1,28,23,'2017-11-29 03:25:00'),(1,29,24,'2017-11-29 04:25:00'),(1,30,15,'2017-11-29 05:25:00'),(1,31,13,'2017-11-29 06:25:00'),(1,32,18,'2017-11-29 07:25:00'),(1,33,26,'2017-11-29 08:25:00'),(1,34,36,'2017-11-29 09:25:00'),(1,35,46,'2017-11-29 10:25:00'),(1,36,66,'2017-11-29 11:25:00'),(1,37,107,'2017-11-29 12:25:00'),(1,38,136,'2017-11-29 13:25:00'),(1,39,88,'2017-11-29 14:25:00'),(1,40,66,'2017-11-29 15:25:00'),(1,41,44,'2017-11-29 16:25:00'),(1,42,28,'2017-11-29 17:25:00'),(1,43,22,'2017-11-29 18:25:00'),(1,44,20,'2017-11-29 19:25:00'),(1,45,14,'2017-11-29 20:25:00'),(1,46,12,'2017-11-29 21:25:00'),(1,47,9,'2017-11-29 22:25:00'),(1,48,8,'2017-11-29 23:25:00'),(1,49,10,'2017-11-30 00:25:00'),(1,50,10,'2017-11-30 01:25:00'),(1,51,10,'2017-11-30 02:25:00'),(1,52,10,'2017-11-30 03:25:00'),(1,53,15,'2017-11-30 04:25:00'),(1,54,15,'2017-11-30 05:25:00'),(1,55,15,'2017-11-30 06:25:00'),(1,56,20,'2017-11-30 07:25:00'),(1,57,25,'2017-11-30 08:25:00'),(1,58,30,'2017-11-30 09:25:00'),(1,59,50,'2017-11-30 10:25:00'),(1,60,75,'2017-11-30 11:25:00'),(1,61,100,'2017-11-30 12:25:00'),(1,62,150,'2017-11-30 13:25:00'),(1,63,100,'2017-11-30 14:25:00'),(1,64,75,'2017-11-30 15:25:00'),(1,65,50,'2017-11-30 16:25:00'),(1,66,30,'2017-11-30 17:25:00'),(1,67,20,'2017-11-30 18:25:00'),(1,68,20,'2017-11-30 19:25:00'),(1,69,15,'2017-11-30 20:25:00'),(1,70,10,'2017-11-30 21:25:00'),(1,71,10,'2017-11-30 22:25:00'),(1,72,10,'2017-11-30 23:25:00'),(1,73,10,'2017-12-05 01:23:30'),(1,74,5,'2017-12-05 01:55:15'),(1,75,13,'2017-12-05 02:12:35'),(1,76,6,'2017-12-05 15:15:08'),(1,77,40,'2017-12-07 00:16:26');
/*!40000 ALTER TABLE `consumedenergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditCards`
--

DROP TABLE IF EXISTS `creditCards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditCards` (
  `creditcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `creditcard_number` text,
  `card_holder` text,
  `ccv` text,
  `expires` datetime DEFAULT NULL,
  `holder` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`creditcard_id`),
  KEY `holder` (`holder`),
  CONSTRAINT `creditCards_ibfk_1` FOREIGN KEY (`holder`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditCards`
--

LOCK TABLES `creditCards` WRITE;
/*!40000 ALTER TABLE `creditCards` DISABLE KEYS */;
INSERT INTO `creditCards` VALUES (1,'string','string','string','2017-11-29 03:56:07',NULL,0),(10,'string','string','string','2017-11-29 03:59:42',NULL,0),(103,'234567891067','Manel Da Adega','128','2017-11-01 00:00:00',1,0),(104,'342 342 345 235','zsdfsadfsa','321','2024-05-31 23:00:00',1,0),(106,'124 123 542 352','aqwreqwe','114','2024-04-30 23:00:00',1,0),(108,'11 111 222 222 222','hfhgdhtr hdtd','012','2018-02-01 00:00:00',1,0),(110,'1 155 555 555 551','Manel Lourenço','154','2027-08-31 23:00:00',1,0),(112,'88 445 454','Frelofes Man','123','2022-08-31 23:00:00',1,1),(114,'3 213 123 123','Teste','123','2028-09-30 23:00:00',1,0),(116,'690 022 354 532','André Silva ','123','2018-12-01 00:00:00',1,0),(118,'690 022 354 532','André Silva ','123','2018-12-01 00:00:00',1,0),(120,'690 022 354 532','André Silva','123','2018-12-01 00:00:00',1,0),(122,'690 022 354 532','André silva','123','2018-12-01 00:00:00',1,0),(124,'690 022 354 532','José Sócrates ','147','2018-12-01 00:00:00',1,0),(126,'690 022 354 532','André Silva ','123','2018-12-01 00:00:00',1,0),(128,'690 022 354 532','André silva','123','2018-12-01 00:00:00',1,0),(130,'690 022 354 532','André Silva','123','2018-12-01 00:00:00',1,0),(132,'690 022 354 532','André Silva ','123','2018-12-01 00:00:00',1,1),(134,'364 759 902 ','Carlos Rodrigues Silva','234','2019-07-31 23:00:00',1,0);
/*!40000 ALTER TABLE `creditCards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` tinytext CHARACTER SET utf8,
  `password` tinytext CHARACTER SET utf8,
  `email` tinytext CHARACTER SET utf8,
  `customer_name` text CHARACTER SET utf8,
  `customer_address` text CHARACTER SET utf8,
  `creditcard` tinytext CHARACTER SET utf8,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (0,'root','root','root@root','root','root','rootrootroot','2017-12-06 16:50:40'),(1,'myLogin','myPass','mail@this.pt','Manel','Rua Sesamo','123456789012','2017-11-28 19:25:42'),(2,'cenas','passwrd','email@gmail.com','Fernando','Av Primeiro de Maio','string','2017-11-29 23:19:16'),(10,'testLogindif','testPass','test@test.com','MyNameIsTest','Test DownStreet Avenue','2142151212321312','2017-11-28 16:54:32'),(40,'string','string','string@gmail.com','String Stringer','Rua String','123412343232','2017-11-29 22:30:32'),(42,'client','client','client@mail.com','Client','Client Street','5555555555555555','2017-12-03 12:42:29');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `energy`
--

DROP TABLE IF EXISTS `energy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `energy` (
  `energy_id` int(11) NOT NULL AUTO_INCREMENT,
  `producer_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `packName` text CHARACTER SET utf8,
  `packDescript` text CHARACTER SET utf8,
  `posted_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `KWhPrice` float DEFAULT NULL,
  `holder` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `finalPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`energy_id`),
  KEY `producer_id` (`producer_id`),
  KEY `holder` (`holder`),
  CONSTRAINT `energy_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`producer_id`),
  CONSTRAINT `energy_ibfk_2` FOREIGN KEY (`holder`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `energy`
--

LOCK TABLES `energy` WRITE;
/*!40000 ALTER TABLE `energy` DISABLE KEYS */;
INSERT INTO `energy` VALUES (3,2,20,'lowCost','All green energy','2017-12-06 17:00:25',1,1,0,100,20),(7,1,100,'Package','string','2017-12-04 19:42:47',3,1,0,100,300),(8,1,50,'namedPackage','string','2017-12-04 19:42:43',2,40,0,100,100),(35,1,30,'packagenew','hello','2017-12-04 20:01:46',1.5,40,1,100,45),(36,2,50,'largePack','Mega Pack','2017-12-02 16:24:26',2,1,0,100,100),(37,2,5,'smallPack','5kW','2017-12-02 16:24:26',7,1,1,100,35),(600,1,5,'packageTest','testeDescript','2017-12-04 19:42:02',5,1,0,100,25),(620,1,14,'EP1','EP1','2017-12-04 19:48:42',1.14,40,1,100,16),(621,10,33,'pck33','33kW','2017-12-01 21:55:11',1.3,1,0,100,43),(622,10,15,'pck15','15kW','2017-12-02 21:59:36',1.6,1,0,100,24),(624,10,10,'pck10','10kW','2017-12-03 21:59:38',2.2,1,0,100,22),(626,10,53,'pck53','53kW','2017-12-04 21:59:43',1.9,1,0,100,101),(627,42,15,'pck15','pack15','2017-12-01 22:01:40',1.5,1,0,100,22),(628,42,80,'pck80','80kW','2017-12-02 22:10:21',1.7,1,0,100,136),(630,1,24,'pck24','pck24','2017-12-04 23:08:34',1.3,40,1,100,31),(632,1,44,'pck44','pck44','2017-12-04 23:09:14',0.87,40,1,100,38),(633,42,77,'pck77','pck77','2017-12-05 00:13:30',1.8,1,0,100,139),(650,10,15,'pck15','pck15','2017-12-05 13:14:34',2.2,1,0,100,33),(652,1,11,'5November','5November','2017-12-05 01:41:21',1.21,40,1,100,13),(1001,2,2000,'Mega Pack','All green energy','2017-12-06 16:59:58',3,1,0,100,6000),(1002,2,2,'Day Pack','All green energy','2017-12-06 16:59:58',5,1,0,100,10),(1003,2,54,'Month Pack','All green energy','2017-12-06 16:59:58',1,1,0,100,54),(1004,1,250,'Enterprise P..','All green energy','2017-12-06 19:00:57',1,40,1,100,250),(1006,1,10,'pck10','pck10','2017-12-06 19:00:32',5,40,1,100,50),(1007,42,5,'5 Kw pack','It\'s a small pack','2017-12-06 22:54:33',3.5,1,0,100,18),(1008,42,10,'10 Kw pack','It\'s a small pack','2017-12-06 22:54:33',3,1,0,100,30),(1009,42,50,'50 Kw pack','It\'s a medium pack','2017-12-06 22:54:33',2,1,0,100,100),(1010,10,25,'25 Kw pack','It\'s a medium pack','2017-12-06 22:54:33',3.5,1,0,100,88),(1012,1,55,'pck55','pck55','2017-12-07 01:05:01',1.76,1,1,100,97),(1014,1,25,'pck25','pck25','2017-12-07 10:51:50',1.53,1,1,100,38),(1016,1,33,'pck33','pck33','2017-12-07 10:55:56',1.99,1,1,100,66),(1018,1,3,'Pack99','Pack99','2017-12-07 11:30:32',1.45,1,1,100,4),(1020,1,10,'Novo','Novo','2017-12-07 11:56:19',0.48,0,1,100,5),(1022,1,10,'10kw','10kw','2017-12-07 12:03:45',0.5,1,1,100,5),(1024,1,5,'pck5','pck5','2017-12-07 12:35:59',0.24,0,1,100,1),(1026,1,37,'Package37','Package37','2017-12-07 12:36:30',0.87,1,1,100,32),(1028,1,23,'pck23','pck23','2017-12-07 12:37:17',1.56,1,1,100,36),(1032,1,10,'edp1','edp1','2017-12-07 14:19:33',1,1,1,100,10),(1034,1,10,'edp2','edp2','2017-12-07 14:44:32',0.5,1,1,100,5),(1036,1,10,'Cc','Cc','2017-12-07 16:19:02',0.5,1,1,100,5),(1038,1,10,'Edp2','Edp2','2017-12-07 16:29:44',0.5,1,1,100,5),(1040,1,10,'Edp2','Edp2','2017-12-07 16:39:37',5,1,1,100,50),(1042,1,200,'pck200','pck200','2017-12-07 16:47:01',1,1,1,100,200),(1044,1,10,'Edp3','Edp3','2017-12-07 17:22:40',0,0,1,100,0),(1046,1,10,'edp 4','edp 4','2017-12-07 18:08:44',5,1,1,100,50),(1048,1,10,'PackTeste','PackTeste','2017-12-11 13:25:02',5,0,1,100,50),(1050,1,19,'Pacote11','Pacote11','2017-12-11 15:01:03',0.93,0,1,100,18),(1052,1,10,'Edp5','Edp5','2017-12-11 15:27:57',10,0,1,100,100),(1054,1,10,'Edp6','Edp6','2017-12-11 15:29:36',5,0,1,100,50),(1056,1,10,'Edp7','Edp7','2017-12-11 15:49:59',0,0,1,100,0),(1058,1,188,'pck188','pck188','2017-12-11 16:07:43',1,0,1,100,188),(1060,1,10,'Edp8','Edp8','2017-12-11 16:09:10',5,0,1,100,50),(1062,1,24,'Edp4','Edp4','2017-12-12 16:07:04',1.14,0,1,100,27),(1064,1,10,'Edp9','Edp9','2017-12-12 16:14:50',5,0,1,100,50),(1066,1,10,'Edp10','Edp10','2017-12-12 16:53:04',5,0,1,100,50),(1068,1,10,'Edp11','Edp11','2017-12-12 17:07:02',5,0,1,100,50),(1070,1,10,'Edp12','Edp12','2017-12-12 17:15:37',10,0,1,100,100),(1072,1,10,'Edp13','Edp13','2017-12-12 17:30:25',3,0,1,100,30),(1074,1,10,'pck10','pck10','2017-12-13 12:40:42',0,0,1,100,0),(1076,1,10,'pck10','pck10','2017-12-13 12:41:11',1,0,1,100,10),(1078,1,10,'pck10','pck10','2017-12-13 12:41:25',0,0,1,100,0),(1080,1,10,'pck10','pck10','2017-12-13 12:41:41',0.9,0,1,100,9),(1082,1,10,'pck10','pck10','2017-12-13 12:41:56',1.4,0,1,100,14),(1084,1,10,'pck10','pck10','2017-12-13 13:13:30',1,0,1,100,10),(1086,1,10,'pck10','pck10','2017-12-13 13:14:42',0.9,0,1,100,9),(1088,1,11,'pck11','pck11','2017-12-13 13:15:48',1,0,1,100,11),(1090,1,10,'pck10','pck10','2017-12-13 13:22:13',1,0,1,100,10),(1092,1,35,'Hey','Hey','2017-12-13 17:52:04',1,0,1,100,35),(1094,1,33,'Today','Today','2017-12-14 12:02:04',3,0,1,100,99),(1096,1,10,'pck10','pck10','2017-12-14 12:43:36',1,0,1,100,10),(1098,1,5,'pck5','pck5','2017-12-14 12:47:23',3,0,1,100,15),(1100,1,8,'test','test','2017-12-14 13:26:28',2,0,1,100,16),(1102,1,50,'test1','test1','2017-12-14 14:58:15',2,0,1,100,100),(1104,1,20,'test2','test2','2017-12-14 16:32:42',1,0,1,100,20),(1106,1,30,'test3','test3','2017-12-15 03:14:12',3,0,1,100,90);
/*!40000 ALTER TABLE `energy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ist174270`@`%`*/ /*!50003 TRIGGER energy_price_insert BEFORE INSERT ON energy FOR EACH ROW SET NEW.finalPrice = NEW.KWhPrice * NEW.quantity */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ist174270`@`%`*/ /*!50003 TRIGGER energy_price_update BEFORE UPDATE ON energy FOR EACH ROW SET NEW.finalPrice = OLD.KWhPrice * OLD.quantity */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_info` text CHARACTER SET utf8,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producedenergy`
--

DROP TABLE IF EXISTS `producedenergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producedenergy` (
  `producer_id` int(11) NOT NULL,
  `increment_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` float NOT NULL,
  `posted_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`increment_id`),
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `fk1_producedenergy` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`producer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producedenergy`
--

LOCK TABLES `producedenergy` WRITE;
/*!40000 ALTER TABLE `producedenergy` DISABLE KEYS */;
INSERT INTO `producedenergy` VALUES (1,1,6,'2017-11-28 00:25:00'),(1,2,7,'2017-11-28 01:25:00'),(1,3,5,'2017-11-28 02:25:00'),(1,4,4,'2017-11-28 03:25:00'),(1,5,7,'2017-11-28 04:25:00'),(1,6,9,'2017-11-28 05:25:00'),(1,7,15,'2017-11-28 06:25:00'),(1,8,25,'2017-11-28 07:25:00'),(1,9,33,'2017-11-28 08:25:00'),(1,10,45,'2017-11-28 09:25:00'),(1,11,65,'2017-11-28 10:25:00'),(1,12,78,'2017-11-28 11:25:00'),(1,13,139,'2017-11-28 12:25:00'),(1,14,153,'2017-11-28 13:25:00'),(1,15,238,'2017-11-28 14:25:00'),(1,16,156,'2017-11-28 15:25:00'),(1,17,102,'2017-11-28 16:25:00'),(1,18,75,'2017-11-28 17:25:00'),(1,19,53,'2017-11-28 18:25:00'),(1,20,27,'2017-11-28 19:25:00'),(1,21,13,'2017-11-28 20:25:00'),(1,22,8,'2017-11-28 21:25:00'),(1,23,6,'2017-11-28 22:25:00'),(1,24,8,'2017-11-28 23:25:00'),(1,25,9,'2017-11-29 00:25:00'),(1,26,13,'2017-11-29 01:25:00'),(1,27,16,'2017-11-29 02:25:00'),(1,28,23,'2017-11-29 03:25:00'),(1,29,24,'2017-11-29 04:25:00'),(1,30,15,'2017-11-29 05:25:00'),(1,31,13,'2017-11-29 06:25:00'),(1,32,18,'2017-11-29 07:25:00'),(1,33,26,'2017-11-29 08:25:00'),(1,34,36,'2017-11-29 09:25:00'),(1,35,46,'2017-11-29 10:25:00'),(1,36,66,'2017-11-29 11:25:00'),(1,37,107,'2017-11-29 12:25:00'),(1,38,136,'2017-11-29 13:25:00'),(1,39,88,'2017-11-29 14:25:00'),(1,40,66,'2017-11-29 15:25:00'),(1,41,44,'2017-11-29 16:25:00'),(1,42,28,'2017-11-29 17:25:00'),(1,43,22,'2017-11-29 18:25:00'),(1,44,20,'2017-11-29 19:25:00'),(1,45,14,'2017-11-29 20:25:00'),(1,46,12,'2017-11-29 21:25:00'),(1,47,9,'2017-11-29 22:25:00'),(1,48,8,'2017-11-29 23:25:00'),(1,49,10,'2017-11-30 00:25:00'),(1,50,10,'2017-11-30 01:25:00'),(1,51,10,'2017-11-30 02:25:00'),(1,52,10,'2017-11-30 03:25:00'),(1,53,15,'2017-11-30 04:25:00'),(1,54,15,'2017-11-30 05:25:00'),(1,55,15,'2017-11-30 06:25:00'),(1,56,20,'2017-11-30 07:25:00'),(1,57,25,'2017-11-30 08:25:00'),(1,58,30,'2017-11-30 09:25:00'),(1,59,50,'2017-11-30 10:25:00'),(1,60,75,'2017-11-30 11:25:00'),(1,61,100,'2017-11-30 12:25:00'),(1,62,150,'2017-11-30 13:25:00'),(1,63,100,'2017-11-30 14:25:00'),(1,64,75,'2017-11-30 15:25:00'),(1,65,50,'2017-11-30 16:25:00'),(1,66,30,'2017-11-30 17:25:00'),(1,67,20,'2017-11-30 18:25:00'),(1,68,20,'2017-11-30 19:25:00'),(1,69,15,'2017-11-30 20:25:00'),(1,70,10,'2017-11-30 21:25:00'),(1,71,10,'2017-11-30 22:25:00'),(1,72,10,'2017-11-30 23:25:00'),(1,118,10,'2017-12-06 01:01:04'),(1,120,11,'2017-12-06 04:01:04'),(1,122,11,'2017-12-06 07:01:04'),(1,126,8,'2017-12-06 08:01:04'),(1,128,6,'2017-12-06 09:01:04'),(1,130,7,'2017-12-06 10:01:04'),(1,132,3,'2017-12-06 11:01:04'),(1,134,4,'2017-12-06 12:01:04'),(1,136,7,'2017-12-06 13:01:04'),(1,138,9,'2017-12-06 14:01:04'),(1,140,6,'2017-12-06 15:01:04'),(1,142,7,'2017-12-06 16:01:04'),(1,144,7,'2017-12-06 17:01:04'),(1,146,8,'2017-12-06 18:01:04'),(1,148,2,'2017-12-06 19:01:04'),(1,150,3,'2017-12-06 20:01:04'),(1,152,3,'2017-12-06 21:01:04'),(1,154,5,'2017-12-06 22:01:04'),(1,156,5,'2017-12-06 23:01:04'),(1,158,5,'2017-12-07 00:01:04'),(1,160,6,'2017-12-07 01:01:04'),(1,162,6,'2017-12-07 02:01:04'),(1,164,9,'2017-12-07 03:01:04'),(1,166,9,'2017-12-07 04:01:04'),(1,168,9,'2017-12-07 05:01:04'),(1,170,6,'2017-12-07 06:01:04'),(1,172,6,'2017-12-07 07:01:04'),(1,174,4,'2017-12-07 08:01:04'),(1,176,5,'2017-12-07 09:01:04'),(1,178,5,'2017-12-07 10:01:04'),(1,180,5,'2017-12-07 11:01:04'),(1,182,5,'2017-12-07 12:01:04'),(1,184,7,'2017-12-07 13:01:04'),(1,186,7,'2017-12-07 14:01:04'),(1,188,4,'2017-12-07 15:01:04'),(1,190,4,'2017-12-07 16:01:04'),(1,192,4,'2017-12-07 17:01:04'),(1,194,5,'2017-12-07 18:01:04'),(1,196,5,'2017-12-07 19:01:04'),(1,198,3,'2017-12-07 20:01:04'),(1,200,4,'2017-12-07 21:01:04'),(1,202,5,'2017-12-07 22:01:04'),(1,204,6,'2017-12-07 23:01:04'),(1,206,6,'2017-12-08 00:01:04');
/*!40000 ALTER TABLE `producedenergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producers` (
  `producer_id` int(11) NOT NULL,
  `production` text CHARACTER SET utf8,
  PRIMARY KEY (`producer_id`),
  CONSTRAINT `producers_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (0,'0'),(1,'5'),(2,'50'),(10,'40'),(42,'50');
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `client_id` int(11) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `rating` text CHARACTER SET utf8,
  `when_rated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rating_id`),
  KEY `client_id` (`client_id`),
  KEY `producer_id` (`producer_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`producer_id`),
  CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `energy_id` int(11) DEFAULT NULL,
  `production` text CHARACTER SET utf8,
  `transaction_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creditcard_used` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `client_id` (`client_id`),
  KEY `energy_id` (`energy_id`),
  KEY `fk_creditcard_id` (`creditcard_used`),
  CONSTRAINT `fk_creditcard_id` FOREIGN KEY (`creditcard_used`) REFERENCES `creditCards` (`creditcard_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`energy_id`) REFERENCES `energy` (`energy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (8,40,7,'string','2017-12-03 12:09:18',0),(53,40,36,'string','2017-12-03 12:09:18',0),(76,40,8,'string','2017-12-03 12:09:18',0),(78,40,3,'NEWENERGY','2017-12-03 12:09:18',0),(88,40,37,'NEWENERGY','2017-12-03 12:09:18',0),(90,1,36,'string','2017-12-03 12:09:18',103),(92,1,36,'string','2017-12-03 12:09:18',103),(94,1,7,'string','2017-12-03 12:09:18',103),(96,1,600,'string','2017-12-04 19:15:03',103),(112,1,1016,'string','2017-12-07 11:40:00',103);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-11 12:35:04
