CREATE DATABASE  IF NOT EXISTS `hrm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hrm`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: hrm
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `full_name` varchar(75) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `marital_status` enum('Single','Married','Divorced','Widowed') NOT NULL,
  `mobile_phone` varchar(20) NOT NULL,
  `joined_date` date NOT NULL,
  `terminated_date` date DEFAULT NULL,
  `job_title` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `supervisor_id` int NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'E000000001','Henry','','Smith','Henry Smith','1980-05-10','Male','Single','8213253815','2020-05-29','2999-12-31','Systems Administrator','Development',2),(2,'E000000002','Arthur','','Jones','Arthur Jones','1973-01-29','Male','Divorced','8322787719','2020-05-29','2999-12-31','Manager','Administration',1),(6,'E000000004','Ana','Maria','Perez','Ana Maria Perez','1971-01-18','Female','Married','1','2022-04-26','2024-02-18','Chemistry','Sciences',2),(9,'E000000005','Benito','','Perez Galdos','Benito Perez Galdos','1972-10-17','Male','Divorced','123456','2024-02-23','3002-05-20','Chemist','Chemistry',2),(11,'E000000067','Tamara','','Lopez','Tamara Lopez','1970-12-10','Male','Single','1','2024-04-24','3004-04-24','Scientist','Computer Science',2),(12,'E000000065','Valentin','','Galicia','Valentin Galicia','1984-08-10','Male','Single','1','2024-04-25','3004-04-26','Researcher','Computer Science',2),(14,'E000000071','Bernabe','','Martinez','Bernabe Martinez','1972-02-10','Male','Married','1','2024-04-26','3004-04-26','Architect','Buildings',2),(23,'E000000068','Hortensia','','Valadez','Hortensia Valadez','1980-12-10','Male','Single','123 456','2024-04-24','3004-04-24','Data Scientist','Computer Science',1),(38,'E000000066','Gloria','Alejandra','Hernadez','Gloria Alejandra Hernadez','1975-05-10','Male','Divorced','123 456','2024-04-25','3004-04-26','Talent Recruiter','Human Resources',2),(43,'E000000073','Arthur','','Miller','Arthur Miller','1979-05-10','Male','Widowed','123 456','2024-04-26','3004-04-26','Physicist','Science',2),(45,'E000000075','German','','Dominguez','German Dominguez','1980-02-10','Male','Single','123 456 789','2024-04-27','3004-04-27','Physician','Health Services',2),(47,'E000000077','Valery','','Miller','Valery Miller','1980-03-10','Female','Single','123 456','2024-05-07','3004-05-07','Writer','Science',2),(53,'E000000064','Edel','','Dominique','Edel Dominique','1970-02-10','Male','Single','1','2024-04-20','3004-04-21','General Practicioner','Medicine',2),(151,'E000000076','John','','Green','John Green','1971-02-10','Male','Single','123 456','2024-04-27','3004-04-27','Researcher','Science',2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errors`
--

DROP TABLE IF EXISTS `errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `errors` (
  `error_id` int NOT NULL AUTO_INCREMENT,
  `error_description` varchar(255) NOT NULL,
  `error_package` varchar(30) NOT NULL,
  `error_class` varchar(30) NOT NULL,
  `error_method` varchar(200) NOT NULL,
  `error_type` varchar(10) NOT NULL,
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errors`
--

LOCK TABLES `errors` WRITE;
/*!40000 ALTER TABLE `errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `submodule_name` varchar(50) DEFAULT NULL,
  `user_level` enum('Admin','Manager','Employee') NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Employees',NULL,'Admin'),(2,'Employees',NULL,'Manager'),(3,'Users',NULL,'Admin'),(4,'Travel Requests','Change Status','Admin'),(5,'Travel Requests','Change Status','Manager'),(6,'Travel Requests',NULL,'Employee');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_requests`
--

DROP TABLE IF EXISTS `travel_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_requests` (
  `travel_request_id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  `employee_id` int NOT NULL,
  `transportation` enum('Airplane','Train','Taxi','OwnVehicle','RentedVehicle') NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `travel_from` varchar(50) NOT NULL,
  `travel_to` varchar(50) NOT NULL,
  `travel_date` date NOT NULL,
  `return_date` date NOT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `currency` enum('Euros','PoundSterling','AmericanDollars','CanadianDollars','MexicanPesos') NOT NULL,
  `total_funding` float(10,2) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `status_notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`travel_request_id`),
  KEY `fk_emp_2` (`employee_id`),
  CONSTRAINT `fk_emp_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_requests`
--

LOCK TABLES `travel_requests` WRITE;
/*!40000 ALTER TABLE `travel_requests` DISABLE KEYS */;
INSERT INTO `travel_requests` VALUES (24,'T000000315',45,'Airplane','Business','Buenos Aires, Argentina','Lima, Peru','2024-05-06','2024-05-07','','AmericanDollars',2000.00,'Approved',''),(34,'T000000270',1,'Airplane','Business','Dublin, Ireland','Madrid, Spain','2024-04-07','2024-04-08','','Euros',1500.00,'Approved','Business Trip Authorized!'),(35,'T000000271',1,'Airplane','Pleasure','Queretaro, Mexico','Dublin, Ireland','2024-04-06','2024-04-07','','Euros',1000.00,'Approved','TR APPROVED!'),(39,'T000000275',1,'Airplane','Business','Dublin, Ireland','Tokyo, Japan','2024-04-10','2024-04-11','','Euros',1500.00,'Approved','Trip Approved!'),(40,'T000000276',1,'Airplane','Business','Dublin, Ireland','Oslo, Norway','2024-04-10','2024-04-11','','Euros',1500.00,'Approved','Trip Approved!'),(64,'T000000282',1,'Airplane','Pleasure','Dublin, Ireland','Mazatlan, Sinaloa, Mexico','2024-04-11','2024-04-12','','Euros',1500.00,'Approved','TR Approved!'),(70,'T000000280',1,'Airplane','Business','Mexico City, Mexico','Madrid, Spain','2024-04-12','2024-04-13','','Euros',1500.00,'Approved','TR Approved!'),(72,'T000000313',151,'Train','Business','Manchester, United Kingdom','London, United Kingdom','2024-05-09','2024-05-10','','PoundSterling',2800.00,'Rejected',''),(76,'T000000279',1,'Airplane','Business','Valencia, Spain','Limerick, Ireland','2024-04-10','2024-04-11','','Euros',1500.00,'Approved','Travel Approved!'),(80,'T000000277',1,'Airplane','Business','Madrid, Spain','Galway, Ireland','2024-04-10','2024-04-11','','Euros',1500.00,'Approved','Trip Approved!'),(87,'T000000293',38,'Airplane','Business','Dublin, Ireland','Jeju, South Korea','2024-04-20','2024-04-21','','Euros',1500.00,'Approved',''),(93,'T000000294',53,'Airplane','Business','Madrid, Spain','Lisbon, Portugal','2024-04-23','2024-04-24','','Euros',1500.00,'Approved',''),(122,'T000000310',38,'Airplane','Business','Lisbon, Portugal','Tokyo, Japan','2024-05-06','2024-05-07','','Euros',1500.00,'Rejected',''),(127,'T000000317',12,'Airplane','Business','Paris, France','Oslo, Norway','2024-05-06','2024-05-07','','Euros',1500.00,'Rejected',''),(135,'T000000303',23,'Airplane','Business','Limerick, Ireland','Buenos Aires, Argentina','2024-04-26','2024-04-27','Conference Trip','Euros',2000.00,'Approved',''),(258,'T000000162',1,'Airplane','Business','Dublin','Paris','2022-05-31','2022-06-01','','Euros',100.00,'Approved',''),(299,'T000000204',9,'Airplane','Business','Dublin, Ireland','Bern, Switzerland','2022-06-10','2022-06-11','','Euros',1000.00,'Approved',''),(331,'T000000304',1,'Airplane','Business','La Habana, Cuba','Acapulco, Guerrero, Mexico','2024-04-26','2024-04-27','','Euros',1500.00,'Approved',''),(501,'T000000169',1,'Airplane','Business','Dublin, Ireland','Brussels, Belgium','2022-06-02','2022-06-03','','Euros',1000.00,'Approved',''),(546,'T000000172',1,'OwnVehicle','Business','Dublin, Ireland','Limerick, Ireland','2022-06-02','2022-06-03','','Euros',1000.00,'Approved',''),(557,'T000000166',1,'RentedVehicle','Business','Queretaro, Queretaro, Mexico','Mexico City, Mexico','2022-06-01','2022-06-02','','MexicanPesos',1000.00,'Approved','TR approved!');
/*!40000 ALTER TABLE `travel_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` blob NOT NULL,
  `key_string` blob NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_level` enum('Admin','Manager','Employee') NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_emp_1` (`employee_id`),
  CONSTRAINT `fk_emp_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hsmith',_binary 'è\’n+maÖ\Ì»É ˙i\Z',_binary '6\'êö)\√Å†q\Ï\'˜\… óraÇÆ“ö}\›.T53\"œ≥\nªû:mÚ¨, ˛#Cc\÷xVMç0Y0W_`\‚\”\–HMy','hsmith1@hotmail.com','Admin',1),(2,'ajones',_binary 'uUG5i\ N\Ï»ÑÑC˛\'',_binary '<ô	Ø\Ï%5MUÆ!Y≤n8\’?!s∏\”\‹>\ÓL~z±¡ÎãÖ>;\Á∫a;1ª\\ú6!M\…ÒJB˝z/€ÑÖk\ \\D\¬','ajones@gmail.com','Manager',2),(13,'bmartinez',_binary 'uUG5i\ N\Ï»ÑÑC˛\'',_binary '<ô	Ø\Ï%5MUÆ!Y≤n8\’?!s∏\”\‹>\ÓL~z±¡ÎãÖ>;\Á∫a;1ª\\ú6!M\…ÒJB˝z/€ÑÖk\ \\D\¬','bmartinez@hotmail.com','Employee',14);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hrm'
--

--
-- Dumping routines for database 'hrm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-31 16:58:46
