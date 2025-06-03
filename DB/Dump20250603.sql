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
INSERT INTO `products` VALUES (1,'men\'s shoe',10.99,'men','shoes','Sneaker2','2025-06-02 06:03:25'),(2,'men\'s shoe2',20.99,'men','shoes','Sneaker5','2025-06-02 06:03:25'),(3,'women\'s shoe',5.99,'women','shoes','Sneaker8','2025-06-02 06:03:25'),(4,'women\'s shirt',14.99,'women','shirts','shirt4','2025-06-02 06:03:25'),(5,'women\'s sweatshirt1',99.99,'women','shirt','f1','2025-06-02 07:46:46'),(6,'women\'s sweatshirt2',100.99,'women','shirt','f2','2025-06-02 07:46:46'),(7,'women\'s sweatshirt3',20.99,'women','shirt','f3','2025-06-02 07:46:46'),(8,'women\'s jean1',1.99,'women','jeans','jean1','2025-06-02 07:48:44'),(9,'women\'s jean2',30.99,'women','jeans','jean2','2025-06-02 07:48:44'),(10,'women\'s jean3',24.99,'women','jeans','jean3','2025-06-02 07:48:44'),(11,'women\'s shoe9',10.99,'women','shoes','Sneaker7','2025-06-02 07:46:46'),(12,'men shirt3',8.99,'men','shirts','shirt3','2025-06-02 07:46:46'),(13,'men shirt10',7.99,'men','shirts','shirt2','2025-06-02 07:46:46'),(14,'neck 1',2.99,'accessories','necklaces','neck1','2025-06-02 07:54:07'),(15,'neck2',3.99,'accessories','necklaces','neck2','2025-06-02 07:54:07'),(16,'le neck',4.99,'accessories','necklaces','neck3','2025-06-02 09:30:36'),(17,'le nek 4',5.99,'accessories','necklaces','neck4','2025-06-02 07:54:07'),(18,'ring1',5.99,'accessories','rings','ring1','2025-06-02 07:54:13'),(19,'2 ring',1.99,'accessories','rings','ring2','2025-06-02 07:54:13'),(20,'ring 3',10.99,'accessories','rings','ring3','2025-06-02 07:54:13');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_details`
--

DROP TABLE IF EXISTS `products_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_details` (
  `product_detail_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `product_images` varchar(200) DEFAULT NULL,
  `size` varchar(10) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_detail_id`) USING BTREE,
  KEY `product_ibfk_1` (`product_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_details`
--

LOCK TABLES `products_details` WRITE;
/*!40000 ALTER TABLE `products_details` DISABLE KEYS */;
INSERT INTO `products_details` VALUES (1,1,'Sneaker2','XS S M L','black white'),(2,2,'Sneaker5','XS S M','black white'),(3,3,'Sneaker8','XS S M','black white'),(4,4,'shirt4','XS S M','black white'),(5,5,'f1','XS S M','black white'),(6,6,'f2','XS S M','black white'),(7,7,'f3','XS S M','black white'),(8,8,'jean1','XS S M','black white'),(9,9,'jean2','XS S M','black white'),(10,10,'jean3','XS S M','black white'),(11,11,'Sneaker7','XS S M','black white'),(12,12,'shirt3','XS S M','black white'),(13,13,'shirt2','XS S M','black white'),(14,14,'neck1','XS S M','black white'),(15,15,'neck2','XS S M','black white'),(16,16,'neck3','XS S M','black white'),(17,17,'neck4','XS S M','black white'),(18,18,'ring1','XS M','silver gold'),(19,19,'ring2','XS M','silver gold'),(20,20,'ring3','XS M','silver gold');
/*!40000 ALTER TABLE `products_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cart`
--

DROP TABLE IF EXISTS `user_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cart` (
  `user_cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`user_cart_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `user_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cart`
--

LOCK TABLES `user_cart` WRITE;
/*!40000 ALTER TABLE `user_cart` DISABLE KEYS */;
INSERT INTO `user_cart` VALUES (1,5,11),(2,5,11),(3,5,11),(4,5,15),(5,5,15),(6,5,15),(7,5,15),(8,5,15),(9,5,15),(10,5,20);
/*!40000 ALTER TABLE `user_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'james','123'),(2,'god','222'),(3,'ligma','123'),(4,'tset','123'),(5,'tesg2','555');
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

-- Dump completed on 2025-06-03 22:03:24
