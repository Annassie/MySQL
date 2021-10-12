-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: localhost    Database: vk_20211001
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `name` varchar(150) NOT NULL COMMENT 'The name of the group',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of the creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` int unsigned NOT NULL COMMENT 'Link to the group',
  `user_id` int unsigned NOT NULL COMMENT 'Link to the user',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of the creating a string',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Composite primary key',
  KEY `communities_users_user_id` (`user_id`),
  CONSTRAINT `communities_users_community_id` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `communities_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `user_id` int unsigned NOT NULL COMMENT 'Reference to the user',
  `friend_id` int unsigned NOT NULL COMMENT 'Reference to the friend of the user',
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of the invitation to the friendship',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Time of confirmation of the invitation',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  `request_type_id` int unsigned NOT NULL COMMENT 'Link to the type of the request',
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `friendship_friend_id` (`friend_id`),
  KEY `friendship_request_type_id` (`request_type_id`),
  CONSTRAINT `friendship_friend_id` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friendship_request_type_id` FOREIGN KEY (`request_type_id`) REFERENCES `friendship_request_types` (`id`),
  CONSTRAINT `friendship_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship_request_types`
--

DROP TABLE IF EXISTS `friendship_request_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship_request_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `name` varchar(150) NOT NULL COMMENT 'Name of the status',
  `created_id` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_request_types`
--

LOCK TABLES `friendship_request_types` WRITE;
/*!40000 ALTER TABLE `friendship_request_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendship_request_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file',
  `size` int NOT NULL COMMENT 'Size of the file',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of the creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  `media_type_id` int unsigned NOT NULL COMMENT 'Link to the type of file',
  `metadata` json DEFAULT NULL,
  `likes` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_media_types_id` (`media_type_id`),
  CONSTRAINT `media_media_types_id` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_likes`
--

DROP TABLE IF EXISTS `media_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_likes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `user_id` int unsigned NOT NULL COMMENT 'Reference to the user',
  `media_id` int unsigned NOT NULL COMMENT 'Reference to the user',
  PRIMARY KEY (`id`),
  KEY `media_user_id` (`user_id`),
  KEY `media_media_id` (`media_id`),
  CONSTRAINT `media_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `media_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_likes`
--

LOCK TABLES `media_likes` WRITE;
/*!40000 ALTER TABLE `media_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `name` varchar(255) NOT NULL COMMENT 'Path to the file',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of the creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `from_user_id` int unsigned NOT NULL COMMENT 'Link to the message sender',
  `to_user_id` int unsigned NOT NULL COMMENT 'Link to the message receiver',
  `body` text NOT NULL COMMENT 'Body of the text',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Sign of importance',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Sign of delivery',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of the creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_from_user_id` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_to_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `user_id` int unsigned NOT NULL COMMENT 'Reference to the user',
  `birthday` date DEFAULT NULL COMMENT 'Day of birth',
  `status` enum('online','offline','disables') DEFAULT NULL COMMENT 'Current status',
  `city` varchar(130) DEFAULT NULL COMMENT 'City',
  `country` varchar(130) DEFAULT NULL COMMENT 'Country',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  `gender` enum('M','F','?') DEFAULT NULL,
  `photo_id` int unsigned DEFAULT NULL COMMENT 'Link to the profilephoto of the user',
  PRIMARY KEY (`id`),
  KEY `profiles_user_id` (`user_id`),
  KEY `profiles_photo_id` (`photo_id`),
  CONSTRAINT `profiles_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_json`
--

DROP TABLE IF EXISTS `test_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_json` (
  `metadata` json DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_json`
--

LOCK TABLES `test_json` WRITE;
/*!40000 ALTER TABLE `test_json` DISABLE KEYS */;
INSERT INTO `test_json` VALUES ('{\"duration\": \"02:14\", \"extention\": \"avi\", \"resolution\": \"1980x1580\"}');
/*!40000 ALTER TABLE `test_json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier of the string',
  `first_name` varchar(255) NOT NULL COMMENT 'Name of the user',
  `last_name` varchar(255) NOT NULL COMMENT 'Lastname of the user',
  `email` varchar(100) NOT NULL COMMENT 'Email',
  `phone` char(11) NOT NULL COMMENT 'Phone',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of creating a string',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Time of updating the string',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2021-10-11  2:18:34
