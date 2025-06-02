-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: zando
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `subcategory` varchar(100) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'men\'s shoe',10.99,'men','shoes','Sneaker2','2025-06-02 13:03:25'),(2,'men\'s shoe2',20.99,'men','shoes','Sneaker5','2025-06-02 13:03:25'),(3,'women\'s shoe',5.99,'women','shoes','Sneaker8','2025-06-02 13:03:25'),(4,'women\'s shirt',14.99,'women','shirts','shirt4','2025-06-02 13:03:25'),(5,'women\'s sweatshirt1',99.99,'women','shirt','f1','2025-06-02 14:46:46'),(6,'women\'s sweatshirt2',100.99,'women','shirt','f2','2025-06-02 14:46:46'),(7,'women\'s sweatshirt3',20.99,'women','shirt','f3','2025-06-02 14:46:46'),(8,'women\'s jean1',1.99,'women','jeans','jean1','2025-06-02 14:48:44'),(9,'women\'s jean2',30.99,'women','jeans','jean2','2025-06-02 14:48:44'),(10,'women\'s jean3',24.99,'women','jeans','jean3','2025-06-02 14:48:44'),(11,'women\'s shoe9',10.99,'women','shoes','Sneaker7','2025-06-02 14:46:46'),(12,'men shirt3',8.99,'men','shirts','shirt3','2025-06-02 14:46:46'),(13,'men shirt10',7.99,'men','shirts','shirt2','2025-06-02 14:46:46'),(14,'neck 1',2.99,'accessories','necklaces','neck1','2025-06-02 14:54:07'),(15,'neck2',3.99,'accessories','necklaces','neck2','2025-06-02 14:54:07'),(16,'le neck',4.99,'accessories','necklaces','neck4','2025-06-02 14:54:07'),(17,'le nek 4',5.99,'accessories','necklaces','neck4','2025-06-02 14:54:07'),(18,'ring1',5.99,'accessories','rings','ring1','2025-06-02 14:54:13'),(19,'2 ring',1.99,'accessories','rings','ring2','2025-06-02 14:54:13'),(20,'ring 3',10.99,'accessories','rings','ring3','2025-06-02 14:54:13');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 22:57:14
