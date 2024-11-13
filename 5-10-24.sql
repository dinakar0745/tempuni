-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: agri
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'dinakar.pathakota@gmail.com','c7949bd15d22cec57110c54337041ca65ca575afc017d691fc06b844c5ed60d2','Dinakar Pathakota','2024-09-12 05:20:47'),(2,'2210030050@klh.edu.in','9d9ceff673eaf9a700aae4e9b803f528721ab402c35663178329da2536af728a','Harshith','2024-09-19 05:54:33'),(3,'2210030091@klh.edu.in','21f7c744ab60b85dfe94f9d1708a0bdbbed4d5ed58703039b06b5d19dcfad032','Vedardha Gudapati','2024-09-19 05:55:09');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uniqueId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cropName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `issue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('open','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'open',
  `solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `admin_id` int DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phoneNumber` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_uniqueId` (`uniqueId`),
  KEY `fk_image_email` (`email`),
  KEY `fk_admin_id` (`admin_id`),
  CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_image_email` FOREIGN KEY (`email`) REFERENCES `images` (`email`) ON DELETE CASCADE,
  CONSTRAINT `fk_image_uniqueId` FOREIGN KEY (`uniqueId`) REFERENCES `images` (`uniqueId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (26,'1b2f8616-460b-48bd-a28c-21d0e458320d','dinakar.pathakota@gmail.com','వరి','పురుగు పేరు','ఉల్లి కోడు','2024-09-19 04:46:01','closed','alpha',1,'వరి/పురుగు పేరు/ఉల్లి కోడు',NULL),(27,'03a86cc0-0767-499e-af05-726a179f0b8f','dinakar.pathakota@gmail.com','వరి','పురుగు పేరు','కాండం తొలిచే పురుగు','2024-09-19 05:25:06','closed','beta',1,'వరి/పురుగు పేరు/కాండం తొలిచే పురుగు',NULL),(29,'81530bc4-4ed1-4c66-8828-1edeb547f426',NULL,'వరి','పురుగు పేరు','ఉల్లి కోడు','2024-10-02 18:54:42','closed','alpha',1,'వరి/పురుగు పేరు/ఉల్లి కోడు',NULL),(30,'651b53cc-99f0-46b5-88f2-d718bbcf9ac6',NULL,'వరి','పురుగు పేరు','ఉల్లి కోడు','2024-10-02 18:58:31','closed','alpha',1,'వరి/పురుగు పేరు/ఉల్లి కోడు',NULL);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uniqueId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `case_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('open','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'open',
  `solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `admin_id` int DEFAULT NULL,
  `cropName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `issue` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phoneNumber` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `uniqueId` (`uniqueId`),
  KEY `email` (`email`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (5,'dinakar.pathakota@gmail.com','1b2f8616-460b-48bd-a28c-21d0e458320d','1b2f8616-460b-48bd-a28c-21d0e458320d.jpg','5d89faf6-bdb7-4431-aff5-2df9becda6c9','2024-09-18 04:50:55','closed',NULL,1,NULL,NULL,NULL),(6,'dinakar.pathakota@gmail.com','8d006d5d-701b-4fbd-83df-efedbe8e2e21','8d006d5d-701b-4fbd-83df-efedbe8e2e21.jpg','5d89faf6-bdb7-4431-aff5-2df9becda6c9','2024-09-18 04:50:57','closed',NULL,1,NULL,NULL,NULL),(7,'dinakar.pathakota@gmail.com','03a86cc0-0767-499e-af05-726a179f0b8f','03a86cc0-0767-499e-af05-726a179f0b8f.jpg','ada18adc-da70-458d-9ee7-29bb3343cb3f','2024-09-18 16:55:28','closed',NULL,1,NULL,NULL,NULL),(8,'dinakar.pathakota@gmail.com','0d78ef40-540b-4c2e-aff6-114ec172a76e','0d78ef40-540b-4c2e-aff6-114ec172a76e.jpg','d2a1dc60-cb6b-471f-8149-7c77fe1a06f3','2024-09-18 17:01:12','open',NULL,NULL,NULL,NULL,NULL),(9,NULL,'6fdba614-6219-4989-8fa6-fde0f978f330','6fdba614-6219-4989-8fa6-fde0f978f330.jpg','772ac83f-94f1-409c-abb2-17a7d3fa5868','2024-10-02 18:34:39','open',NULL,NULL,NULL,NULL,'9963817633'),(10,NULL,'16baf0ec-7485-410e-a94f-06f3323a85e6','16baf0ec-7485-410e-a94f-06f3323a85e6.jpg','772ac83f-94f1-409c-abb2-17a7d3fa5868','2024-10-02 18:34:40','open',NULL,NULL,NULL,NULL,'9963817633'),(11,NULL,'81530bc4-4ed1-4c66-8828-1edeb547f426','81530bc4-4ed1-4c66-8828-1edeb547f426.jpg','5c8f2bde-ee56-4fd9-a30a-d49eefa4898e','2024-10-02 18:36:09','closed','alpha',1,'వరి','ఉల్లి కోడు','9963817633'),(12,NULL,'651b53cc-99f0-46b5-88f2-d718bbcf9ac6','651b53cc-99f0-46b5-88f2-d718bbcf9ac6.jpg','ddc0c15b-1813-428e-8ec1-9ed9c52617e9','2024-10-02 18:54:55','closed','alpha',1,'వరి','ఉల్లి కోడు','9390888565'),(13,NULL,'8bbbeb86-d933-449f-968e-e6ec020a5f01','8bbbeb86-d933-449f-968e-e6ec020a5f01.jpg','ddc0c15b-1813-428e-8ec1-9ed9c52617e9','2024-10-02 18:54:57','closed','alpha',1,'వరి','ఉల్లి కోడు','9390888565'),(14,NULL,'c19408fe-c436-4bb1-9562-da2133d532c4','c19408fe-c436-4bb1-9562-da2133d532c4.jpg','ddc0c15b-1813-428e-8ec1-9ed9c52617e9','2024-10-02 18:54:58','closed','alpha',1,'వరి','ఉల్లి కోడు','9390888565'),(15,NULL,'e5468fe7-aa53-4948-9c11-dd4ca814c2f9','e5468fe7-aa53-4948-9c11-dd4ca814c2f9.jpg','7b4958dd-0169-464e-b0f4-b76326d232a9','2024-10-02 19:06:43','open',NULL,NULL,NULL,NULL,'9390888565'),(16,NULL,'56fcfce4-7dea-42df-a9c3-412091c664ca','56fcfce4-7dea-42df-a9c3-412091c664ca.jpg','7b4958dd-0169-464e-b0f4-b76326d232a9','2024-10-02 19:06:45','open',NULL,NULL,NULL,NULL,'9390888565'),(17,NULL,'e9fb3c39-7f3f-41b3-9fce-3d05b65f9fd7','e9fb3c39-7f3f-41b3-9fce-3d05b65f9fd7.jpg','7b4958dd-0169-464e-b0f4-b76326d232a9','2024-10-02 19:06:46','open',NULL,NULL,NULL,NULL,'9390888565'),(18,NULL,'a82993a0-2ca0-409d-a2e0-33d67114e3eb','a82993a0-2ca0-409d-a2e0-33d67114e3eb.jpg','7b4958dd-0169-464e-b0f4-b76326d232a9','2024-10-02 19:06:49','open',NULL,NULL,NULL,NULL,'9390888565'),(19,NULL,'48caa3a9-1cb5-4c3d-9161-5e3fe791b857','48caa3a9-1cb5-4c3d-9161-5e3fe791b857.jpg','7b4958dd-0169-464e-b0f4-b76326d232a9','2024-10-02 19:06:50','open',NULL,NULL,NULL,NULL,'9390888565'),(20,NULL,'cfc950ff-c427-4c9a-a69d-90d02bec4af3','cfc950ff-c427-4c9a-a69d-90d02bec4af3.jpg','2ace4aea-33a1-445c-8f2e-ce3a43cdfd09','2024-10-03 07:50:20','open',NULL,NULL,NULL,NULL,'9963817633');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solutions`
--

DROP TABLE IF EXISTS `solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutions` (
  `cropName` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `issue` text NOT NULL,
  `solution_file_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cropName`,`category`,`issue`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
INSERT INTO `solutions` VALUES ('మిరప','పురుగు పేరు','కొత్త రకం తామర పురుగులు','Solutions/కొత్త రకం తామర పురుగులు.pdf'),('మిరప','పురుగు పేరు','తామర పురుగు','Solutions/తామర పురుగు.pdf');
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `villageName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mandalName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pincode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phoneNumber` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `districtName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dinakar','Pathakota','dinakar.pathakota@gmail.com','Bowrampet','Dundigal','500043','2024-09-12 05:22:36',NULL,NULL,NULL),(2,'ASH','DP','dinakara.pathakota@gmail.com','dvbdfvqd','dvsd','232432','2024-09-19 06:18:57',NULL,NULL,NULL),(3,'Harishith ','p','2210030050@klh.edu.in',NULL,NULL,NULL,'2024-10-02 12:04:48',NULL,NULL,NULL),(4,'dvdvdfvd','dfvdfvd',NULL,'sdvdfvd','dfvdvdv','23232','2024-10-02 18:26:13','9963817633','svdfvd',NULL),(5,'Vedardha','Gudapati',NULL,'Kokapet','Rangareddy','500075','2024-10-02 18:53:59','9390888565','Rangareddy',NULL);
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

-- Dump completed on 2024-10-05 23:00:18
