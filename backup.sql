-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: finance_manager
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category` varchar(50) NOT NULL,
  `budget_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
INSERT INTO `budgets` VALUES (1,1,'Rent',1000.00),(2,3,'Rent',400.00),(3,3,'Rent',200.00),(4,4,'Food',1000.00),(5,1,'Salary',1000.00),(6,4,'Salary',200.00),(7,7,'Rent',6000.00),(8,8,'Salary',1000.00),(9,10,'salary',5000.00),(10,10,'salary',1000.00),(11,10,'food',2000.00);
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (5,'Entertainment'),(3,'Food'),(7,'Other'),(2,'Rent'),(1,'Salary'),(4,'Transportation'),(6,'Utilities');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'income','Salary',20000.00,'2024-12-04'),(2,1,'expense','Rent',4000.00,'2024-12-04'),(3,3,'income','Salary',4000.00,'2024-12-03'),(4,3,'expense','Rent',1000.00,'2024-12-04'),(5,4,'income','SAlary',10000.00,'2023-01-01'),(6,4,'expense','Food',4000.00,'2023-08-20'),(7,5,'income','Food',3000.00,'2024-02-03'),(8,5,'expense','Rent',3000.00,'2025-02-03'),(9,6,'income','Salary',10000.00,'2024-01-01'),(10,6,'expense','Rent',5000.00,'2024-06-06'),(11,6,'expense','Food',500.00,'2024-09-08'),(12,7,'income','Salary',50000.00,'2023-05-09'),(13,7,'expense','Food',1000.00,'2024-12-01'),(14,7,'income','Salary',10000.00,'2024-01-01'),(15,7,'expense','Rent',2000.00,'2025-01-01'),(16,8,'income','Salary',20000.00,'2023-08-06'),(17,8,'expense','Rent',1000.00,'2023-02-02'),(18,10,'income','Saary',19000.00,'2023-01-12'),(20,10,'expense','rent',2000.00,'2024-12-01'),(21,10,'income','salary',11000.00,'2024-12-06'),(22,10,'expense','food',2000.00,'2024-02-01');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jeela Anil','$2b$12$vIHvInNDTM2S2.Ko0dTjQO1GNeAgaJHBVcUxX/DeWxWTfpprhf396'),(3,'M kumar','$2b$12$l07R2psv98gqHreb/tw9RuYOT2C3jNDz0f6mLzldZoipvrUHoLzOq'),(4,'D Sriram','$2b$12$NoEREzyHiNda4P8P6JsS6e2uwIWNschXeZnHGGd179ceOPqJcY5/S'),(5,'Ch Vinay','$2b$12$EuwLeNgIXNLGclwgo/zLuuW1lsYPdAlz5XTQ7Jg8scXxpKMM5lfoO'),(6,'T Madhu','$2b$12$ElVcnkUSPsXnDjxsFBbyhemoulaGilZK6LK66Dq0nyWP0ccPxJntK'),(7,'J sandeep','$2b$12$nfm7GmM0PXtLd1H0iiLFHuE6Piy0JaRIgY2GjmKrxsgFtLXrX5AA.'),(8,'P vinay','$2b$12$PwA8n4QJT0hFctdOcp0Zd.NxzjYonuklz4ATB0RO1AW0ceKkNSZbu'),(10,'Ramakrishna','$2b$12$RqeteIaBOwKUupYbI.VdVuBwkrKOO6Vn0ykOpYaax1HXf2oaEnzsi');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19 11:55:54
