-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: j7e101.p.ssafy.io    Database: postcard_e101
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_seq` int NOT NULL AUTO_INCREMENT,
  `board_code` int NOT NULL,
  `user_seq` int NOT NULL,
  `board_title` varchar(50) DEFAULT NULL,
  `board_content` text,
  `REG_DTM` datetime DEFAULT NULL,
  `MOD_DTM` datetime DEFAULT NULL,
  PRIMARY KEY (`board_seq`,`board_code`,`user_seq`),
  KEY `FK_Code_TO_Board_1` (`board_code`),
  KEY `FK_User_TO_Board_1` (`user_seq`),
  CONSTRAINT `FK_Code_TO_Board_1` FOREIGN KEY (`board_code`) REFERENCES `code` (`code`),
  CONSTRAINT `FK_User_TO_Board_1` FOREIGN KEY (`user_seq`) REFERENCES `user` (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code` (
  `code` int NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (101,'일반회원'),(102,'관리자'),(201,'공지사항'),(202,'문의사항');
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `donation_seq` int NOT NULL AUTO_INCREMENT,
  `foundation_seq` int NOT NULL,
  `user_seq` int NOT NULL,
  `donation_img_url` varchar(255) DEFAULT NULL,
  `donation_text` text,
  `donation_pay` int DEFAULT NULL,
  `REG_DTM` datetime DEFAULT NULL,
  `MOD_DTM` datetime DEFAULT NULL,
  PRIMARY KEY (`donation_seq`,`foundation_seq`,`user_seq`),
  KEY `FK_Foundation_TO_Donation_1` (`foundation_seq`),
  KEY `FK_User_TO_Donation_1` (`user_seq`),
  CONSTRAINT `FK_Foundation_TO_Donation_1` FOREIGN KEY (`foundation_seq`) REFERENCES `foundation` (`foundation_seq`),
  CONSTRAINT `FK_User_TO_Donation_1` FOREIGN KEY (`user_seq`) REFERENCES `user` (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (62,3,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221013.png','좋은 글과 그림이 힘이 되길를...',100,'2022-10-06 22:12:08','2022-10-06 22:12:08'),(63,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221024.png','ㅈㅇㅈ',1557,'2022-10-06 22:12:44','2022-10-06 22:12:44'),(64,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221844.png','안녕하세요? 늘 당신을 응원합니다.',100,'2022-10-06 22:24:33','2022-10-06 22:24:33'),(65,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','김밥한줄 놓고갑니다... @)))))',100,'2022-10-06 22:35:37','2022-10-06 22:35:37'),(66,1,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','모두 힘내세요!',100,'2022-10-06 23:44:37','2022-10-06 23:44:37'),(67,2,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8023840.png','현우94의 역작\n',100,'2022-10-06 23:46:00','2022-10-06 23:46:00'),(68,3,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80232628.png','좋은 일이 있기를',100,'2022-10-06 23:47:07','2022-10-06 23:47:07'),(69,1,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-800231.png','좋은 마음이 좋은 뜻을 만나',100,'2022-10-07 00:03:51','2022-10-07 00:03:51'),(70,3,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8001029.png','아름다운 우리나라',100,'2022-10-07 00:11:32','2022-10-07 00:11:32'),(71,3,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-801923.png','좋은 마음을 담아 보냅니다.',100,'2022-10-07 01:10:45','2022-10-07 01:10:45'),(72,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233514.png','줄돔 한마리 보내드립니다',100,'2022-10-07 01:25:29','2022-10-07 01:25:29'),(73,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233317.png','ㅎㅇㅌ',100,'2022-10-07 01:26:43','2022-10-07 01:26:43'),(74,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1222339.png','샌드위치 하나 보내드립니다',100,'2022-10-07 01:27:55','2022-10-07 01:27:55'),(75,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80232937.png','초가에서 한컷,,,',100,'2022-10-07 01:29:01','2022-10-07 01:29:01'),(76,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221024.png','광안대교',100,'2022-10-07 01:30:14','2022-10-07 01:30:14'),(77,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80234215.png','당신을 응원합니다',100,'2022-10-07 01:32:56','2022-10-07 01:32:56'),(78,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-120311.png','창창한 앞날이 학생과 함께하길,,,',100,'2022-10-07 01:35:12','2022-10-07 01:35:12'),(79,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1221816.png','경치좋죠?',100,'2022-10-07 01:36:24','2022-10-07 01:36:24'),(80,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1220153.png','웅장합니다',100,'2022-10-07 01:37:21','2022-10-07 01:37:21'),(81,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','당신을 응원합니다',100,'2022-10-07 01:38:17','2022-10-07 01:38:17'),(82,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221844.png','화이팅!',100,'2022-10-07 01:39:20','2022-10-07 01:39:20'),(83,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215710.png','좋은꿈꾸세요',100,'2022-10-07 01:58:30','2022-10-07 01:58:30'),(84,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215441.png','잘자요 ',100,'2022-10-07 01:59:31','2022-10-07 01:59:31'),(85,1,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-6615735.png','기부합니다!',100,'2022-10-07 01:59:37','2022-10-07 01:59:37'),(86,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1214952.png','ㅎㅎㅎㅎ',100,'2022-10-07 02:01:35','2022-10-07 02:01:35'),(87,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1223212.png','당신에겐 무엇이 보이십니까?',100,'2022-10-07 02:02:48','2022-10-07 02:02:48'),(88,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221013.png','당신의 앞날을 응원합니다',100,'2022-10-07 02:04:02','2022-10-07 02:04:02'),(89,1,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-662319.png','기부 또 할게요~',100,'2022-10-07 02:04:22','2022-10-07 02:04:22'),(90,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215710.png','감자튀김 라지 보내드립니다',100,'2022-10-07 02:05:12','2022-10-07 02:05:12'),(91,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215441.png','응원해요',100,'2022-10-07 02:09:06','2022-10-07 02:09:06'),(92,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-662319.png','명화한점 남기고갑니다,,,',100,'2022-10-07 02:11:02','2022-10-07 02:11:02'),(93,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233514.png','언더더씨',100,'2022-10-07 02:12:08','2022-10-07 02:12:08'),(94,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221844.png','조금만 더 참읍시다',100,'2022-10-07 02:13:07','2022-10-07 02:13:07'),(95,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80234215.png','포기하지마세요',100,'2022-10-07 02:14:25','2022-10-07 02:14:25'),(96,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8023403.png','사랑의 울타리',100,'2022-10-07 02:19:27','2022-10-07 02:19:27'),(97,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233514.png','줄돔 한 점',100,'2022-10-07 02:20:41','2022-10-07 02:20:41'),(98,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1219177.png','화이팅화이팅',100,'2022-10-07 02:21:54','2022-10-07 02:21:54'),(99,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','안녕하세야',100,'2022-10-07 02:23:23','2022-10-07 02:23:23'),(100,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1221816.png','잘자요',100,'2022-10-07 02:27:03','2022-10-07 02:27:03'),(101,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','산과 구름이네요',100,'2022-10-07 02:28:51','2022-10-07 02:28:51'),(102,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1214952.png','',100,'2022-10-07 02:29:37','2022-10-07 02:29:37'),(103,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-6615735.png','당신은 꽃입니다',100,'2022-10-07 02:30:39','2022-10-07 02:30:39'),(104,1,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5422825.png','엽서로 사랑을 전합니다~',100,'2022-10-07 02:30:53','2022-10-07 02:30:53'),(105,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1221816.png','',100,'2022-10-07 02:33:42','2022-10-07 02:33:42'),(106,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-122325.png','',100,'2022-10-07 02:34:27','2022-10-07 02:34:27'),(107,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12212451.png','',100,'2022-10-07 02:39:40','2022-10-07 02:39:40'),(108,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233317.png','',100,'2022-10-07 02:40:44','2022-10-07 02:40:44'),(109,2,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5423846.png','기부합니다 ~~',100,'2022-10-07 02:41:50','2022-10-07 02:41:50'),(110,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5423536.png','',100,'2022-10-07 02:41:59','2022-10-07 02:41:59'),(111,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5422825.png','',100,'2022-10-07 02:43:02','2022-10-07 02:43:02'),(112,3,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5424221.png','짱구도 사랑을 전해요 ~',100,'2022-10-07 02:43:38','2022-10-07 02:43:38'),(113,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233317.png','',100,'2022-10-07 02:43:57','2022-10-07 02:43:57'),(114,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-120311.png','',100,'2022-10-07 02:45:14','2022-10-07 02:45:14'),(115,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1220153.png','',100,'2022-10-07 02:47:24','2022-10-07 02:47:24'),(116,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215710.png','',100,'2022-10-07 02:48:22','2022-10-07 02:48:22'),(117,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1219177.png','',100,'2022-10-07 02:49:12','2022-10-07 02:49:12'),(118,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5422825.png','',100,'2022-10-07 02:50:07','2022-10-07 02:50:07'),(119,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8023403.png','',100,'2022-10-07 02:51:09','2022-10-07 02:51:09'),(120,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233317.png','',100,'2022-10-07 02:51:55','2022-10-07 02:51:55'),(121,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215710.png','',100,'2022-10-07 02:53:02','2022-10-07 02:53:02'),(122,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1219177.png','',100,'2022-10-07 02:53:41','2022-10-07 02:53:41'),(123,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215441.png','',100,'2022-10-07 02:54:45','2022-10-07 02:54:45'),(124,2,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80231714.png','좋은 곳에 쓰이기를',100,'2022-10-07 02:56:04','2022-10-07 02:56:04'),(125,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215710.png','',100,'2022-10-07 02:56:49','2022-10-07 02:56:49'),(126,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1223212.png','',100,'2022-10-07 02:57:42','2022-10-07 02:57:42'),(127,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80231714.png','',100,'2022-10-07 03:00:31','2022-10-07 03:00:31'),(128,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-662319.png','',100,'2022-10-07 03:01:36','2022-10-07 03:01:36'),(129,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221024.png','',100,'2022-10-07 03:02:38','2022-10-07 03:02:38'),(130,1,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-123435.png','',100,'2022-10-07 03:05:49','2022-10-07 03:05:49');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `follow_seq` int NOT NULL AUTO_INCREMENT,
  `my_id` varchar(45) NOT NULL,
  `follow_id` varchar(45) NOT NULL,
  `REG_DTM` datetime DEFAULT NULL,
  `MOD_DTM` datetime DEFAULT NULL,
  PRIMARY KEY (`follow_seq`),
  KEY `follow_myid_idx` (`my_id`),
  KEY `follow_followid_idx` (`follow_id`),
  CONSTRAINT `follow_followid` FOREIGN KEY (`follow_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `follow_myid` FOREIGN KEY (`my_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (4,'kimssafy','hong','2022-09-07 00:00:00',NULL),(971,'1234','muni','2022-10-03 11:03:31','2022-10-03 11:03:31'),(995,'1234','admin','2022-10-03 13:45:05','2022-10-03 13:45:05'),(1109,'1234','asdf','2022-10-06 07:48:12','2022-10-06 07:48:12'),(1131,'1234','jimin','2022-10-06 10:50:38','2022-10-06 10:50:38'),(1409,'1234','하단동기부천사','2022-10-07 00:48:09','2022-10-07 00:48:09'),(1497,'testkd','1234','2022-10-07 02:08:03','2022-10-07 02:08:03');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foundation`
--

DROP TABLE IF EXISTS `foundation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foundation` (
  `foundation_seq` int NOT NULL AUTO_INCREMENT,
  `foundation_name` varchar(30) DEFAULT NULL,
  `foundation_content` text,
  `foundation_logo_url` varchar(255) DEFAULT NULL,
  `REG_DTM` datetime DEFAULT NULL,
  `MOD_DTM` datetime DEFAULT NULL,
  PRIMARY KEY (`foundation_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foundation`
--

LOCK TABLES `foundation` WRITE;
/*!40000 ALTER TABLE `foundation` DISABLE KEYS */;
INSERT INTO `foundation` VALUES (1,'싸피재단','싸피재단입니다','https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/foundation_image_folder/%EC%8B%B8%ED%94%BC%EC%9E%AC%EB%8B%A8.png','2022-09-07 00:00:00',NULL),(2,'싸피어린이재단','싸피어린이재단 입니다','https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/foundation_image_folder/%EC%8B%B8%ED%94%BC%EC%96%B4%EB%A6%B0%EC%9D%B4%EC%9E%AC%EB%8B%A8.png','2022-09-07 00:00:00',NULL),(3,'싸피월드재단','싸피월드재단 입니다','https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/foundation_image_folder/%EC%8B%B8%ED%94%BC%EC%9B%94%EB%93%9C%EC%9E%AC%EB%8B%A8.png','2022-09-07 00:00:00',NULL);
/*!40000 ALTER TABLE `foundation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1549);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcard`
--

DROP TABLE IF EXISTS `postcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postcard` (
  `postcard_seq` int NOT NULL AUTO_INCREMENT,
  `user_seq` int NOT NULL,
  `postcard_img_url` varchar(255) DEFAULT NULL,
  `REG_DTM` datetime DEFAULT NULL,
  `MOD_DTM` datetime DEFAULT NULL,
  PRIMARY KEY (`postcard_seq`,`user_seq`),
  KEY `FK_User_TO_Postcard_1` (`user_seq`),
  CONSTRAINT `FK_User_TO_Postcard_1` FOREIGN KEY (`user_seq`) REFERENCES `user` (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=1539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcard`
--

LOCK TABLES `postcard` WRITE;
/*!40000 ALTER TABLE `postcard` DISABLE KEYS */;
INSERT INTO `postcard` VALUES (1,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-66173241.png','2022-10-06 17:32:42','2022-10-06 17:32:42'),(2,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-66175320.png','2022-10-06 17:53:21','2022-10-06 17:53:21'),(3,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12181337.png','2022-10-06 18:13:38','2022-10-06 18:13:38'),(4,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1219177.png','2022-10-06 19:17:09','2022-10-06 19:17:09'),(5,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1220153.png','2022-10-06 20:01:54','2022-10-06 20:01:54'),(6,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-6620447.png','2022-10-06 20:04:49','2022-10-06 20:04:49'),(7,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','2022-10-06 20:24:31','2022-10-06 20:24:31'),(8,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','2022-10-06 20:24:31','2022-10-06 20:24:31'),(9,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','2022-10-06 20:24:31','2022-10-06 20:24:31'),(10,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12202430.png','2022-10-06 20:24:31','2022-10-06 20:24:31'),(1230,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12205841.png','2022-10-06 20:58:43','2022-10-06 20:58:43'),(1235,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1221816.png','2022-10-06 21:08:18','2022-10-06 21:08:18'),(1240,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12212451.png','2022-10-06 21:24:54','2022-10-06 21:24:54'),(1244,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1222538.png','2022-10-06 22:05:39','2022-10-06 22:05:39'),(1246,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221013.png','2022-10-06 22:10:14','2022-10-06 22:10:14'),(1252,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221024.png','2022-10-06 22:10:25','2022-10-06 22:10:25'),(1259,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12221844.png','2022-10-06 22:18:45','2022-10-06 22:18:45'),(1278,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1222339.png','2022-10-06 22:33:11','2022-10-06 22:33:11'),(1289,79,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/%ED%95%98%EB%8B%A8%EB%8F%99%EA%B8%B0%EB%B6%80%EC%B2%9C%EC%82%AC/2022-10-06/yeupseo-79224036.png','2022-10-06 22:40:37','2022-10-06 22:40:37'),(1294,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8023840.png','2022-10-06 23:08:42','2022-10-06 23:08:42'),(1300,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80231714.png','2022-10-06 23:17:15','2022-10-06 23:17:15'),(1308,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80232014.png','2022-10-06 23:20:15','2022-10-06 23:20:15'),(1317,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1223212.png','2022-10-06 23:21:04','2022-10-06 23:21:04'),(1324,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80232628.png','2022-10-06 23:26:29','2022-10-06 23:26:29'),(1328,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80232937.png','2022-10-06 23:29:39','2022-10-06 23:29:39'),(1334,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233317.png','2022-10-06 23:33:19','2022-10-06 23:33:19'),(1341,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-12233514.png','2022-10-06 23:35:15','2022-10-06 23:35:15'),(1354,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8023403.png','2022-10-06 23:40:05','2022-10-06 23:40:05'),(1359,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80234215.png','2022-10-06 23:42:16','2022-10-06 23:42:16'),(1369,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80235035.png','2022-10-06 23:50:37','2022-10-06 23:50:37'),(1373,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80235357.png','2022-10-06 23:53:59','2022-10-06 23:53:59'),(1378,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-800231.png','2022-10-07 00:02:32','2022-10-07 00:02:32'),(1383,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-80085.png','2022-10-07 00:08:07','2022-10-07 00:08:07'),(1387,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8001029.png','2022-10-07 00:10:31','2022-10-07 00:10:31'),(1396,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-120311.png','2022-10-07 00:31:04','2022-10-07 00:31:04'),(1400,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-8003211.png','2022-10-07 00:32:13','2022-10-07 00:32:13'),(1410,80,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/soshot22/2022-10-06/yeupseo-801923.png','2022-10-07 01:09:25','2022-10-07 01:09:25'),(1415,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1214952.png','2022-10-07 01:49:54','2022-10-07 01:49:54'),(1426,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215441.png','2022-10-07 01:54:42','2022-10-07 01:54:42'),(1433,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-1215710.png','2022-10-07 01:57:11','2022-10-07 01:57:11'),(1456,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-6615735.png','2022-10-07 01:57:36','2022-10-07 01:57:36'),(1464,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-662319.png','2022-10-07 02:03:21','2022-10-07 02:03:21'),(1479,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-122755.png','2022-10-07 02:07:56','2022-10-07 02:07:56'),(1499,66,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/testkd/2022-10-06/yeupseo-6622419.png','2022-10-07 02:24:21','2022-10-07 02:24:21'),(1502,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5422825.png','2022-10-07 02:28:30','2022-10-07 02:28:30'),(1508,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-122325.png','2022-10-07 02:32:05','2022-10-07 02:32:05'),(1509,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5423536.png','2022-10-07 02:35:40','2022-10-07 02:35:40'),(1518,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5423846.png','2022-10-07 02:38:51','2022-10-07 02:38:51'),(1522,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5424221.png','2022-10-07 02:42:25','2022-10-07 02:42:25'),(1524,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5424742.png','2022-10-07 02:47:47','2022-10-07 02:47:47'),(1527,54,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/jimin/2022-10-06/yeupseo-5425446.png','2022-10-07 02:54:51','2022-10-07 02:54:51'),(1538,12,'https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/1234/2022-10-06/yeupseo-123435.png','2022-10-07 03:04:36','2022-10-07 03:04:36');
/*!40000 ALTER TABLE `postcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcard_like`
--

DROP TABLE IF EXISTS `postcard_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postcard_like` (
  `postcard_like_seq` int NOT NULL AUTO_INCREMENT,
  `postcard_seq` int NOT NULL,
  `user_seq` int NOT NULL,
  `REG_DTM` datetime DEFAULT NULL,
  `mod_dtm` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`postcard_like_seq`,`postcard_seq`,`user_seq`),
  KEY `FK_Postcard_TO_Postcard_Like_1` (`postcard_seq`),
  KEY `FK_User_TO_Postcard_Like_1` (`user_seq`),
  CONSTRAINT `FK_Postcard_TO_Postcard_Like_1` FOREIGN KEY (`postcard_seq`) REFERENCES `postcard` (`postcard_seq`),
  CONSTRAINT `FK_User_TO_Postcard_Like_1` FOREIGN KEY (`user_seq`) REFERENCES `user` (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=1549 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcard_like`
--

LOCK TABLES `postcard_like` WRITE;
/*!40000 ALTER TABLE `postcard_like` DISABLE KEYS */;
INSERT INTO `postcard_like` VALUES (1,1,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(2,2,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(3,3,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(4,4,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(5,5,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(6,6,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(7,7,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(8,8,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(9,9,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(10,10,1,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(11,10,2,'2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(1234,1230,12,'2022-10-06 20:59:01','2022-10-06 20:59:01.421000'),(1277,1252,12,'2022-10-06 22:25:37','2022-10-06 22:25:37.249000'),(1288,1278,12,'2022-10-06 22:33:22','2022-10-06 22:33:21.515000'),(1299,1294,80,'2022-10-06 23:08:48','2022-10-06 23:08:48.421000'),(1315,1300,80,'2022-10-06 23:20:33','2022-10-06 23:20:32.663000'),(1316,1308,80,'2022-10-06 23:20:34','2022-10-06 23:20:33.623000'),(1365,1289,80,'2022-10-06 23:42:34','2022-10-06 23:42:33.854000'),(1366,1252,80,'2022-10-06 23:42:36','2022-10-06 23:42:36.034000'),(1367,7,80,'2022-10-06 23:43:15','2022-10-06 23:43:14.871000'),(1368,1246,80,'2022-10-06 23:43:20','2022-10-06 23:43:19.637000'),(1394,1328,12,'2022-10-07 00:30:27','2022-10-07 00:30:27.141000'),(1395,1359,12,'2022-10-07 00:30:33','2022-10-07 00:30:32.576000'),(1405,1341,12,'2022-10-07 00:47:13','2022-10-07 00:47:12.944000'),(1406,1334,12,'2022-10-07 00:47:15','2022-10-07 00:47:14.770000'),(1407,1396,12,'2022-10-07 00:47:17','2022-10-07 00:47:16.822000'),(1408,1289,12,'2022-10-07 00:47:21','2022-10-07 00:47:20.533000'),(1463,1456,66,'2022-10-07 01:57:44','2022-10-07 01:57:43.696000'),(1469,1235,54,'2022-10-07 02:04:13','2022-10-07 02:04:13.127000'),(1470,1252,54,'2022-10-07 02:04:17','2022-10-07 02:04:17.175000'),(1471,1289,54,'2022-10-07 02:04:24','2022-10-07 02:04:24.181000'),(1472,1328,54,'2022-10-07 02:04:29','2022-10-07 02:04:29.093000'),(1473,7,54,'2022-10-07 02:04:37','2022-10-07 02:04:36.854000'),(1474,1464,12,'2022-10-07 02:05:54','2022-10-07 02:05:54.395000'),(1475,1456,12,'2022-10-07 02:05:56','2022-10-07 02:05:56.316000'),(1476,1252,66,'2022-10-07 02:06:29','2022-10-07 02:06:29.238000'),(1477,1387,66,'2022-10-07 02:06:55','2022-10-07 02:06:54.615000'),(1478,1410,66,'2022-10-07 02:06:56','2022-10-07 02:06:55.679000'),(1498,1354,12,'2022-10-07 02:17:57','2022-10-07 02:17:56.618000'),(1507,1502,54,'2022-10-07 02:29:42','2022-10-07 02:29:42.195000'),(1515,1509,54,'2022-10-07 02:35:48','2022-10-07 02:35:47.854000'),(1516,1502,12,'2022-10-07 02:38:19','2022-10-07 02:38:19.424000'),(1517,1509,12,'2022-10-07 02:38:21','2022-10-07 02:38:20.540000'),(1521,1518,54,'2022-10-07 02:39:03','2022-10-07 02:39:02.728000'),(1530,1524,12,'2022-10-07 02:55:22','2022-10-07 02:55:22.191000'),(1535,1415,12,'2022-10-07 02:58:32','2022-10-07 02:58:32.247000'),(1536,1527,12,'2022-10-07 02:58:41','2022-10-07 02:58:41.174000'),(1537,1300,12,'2022-10-07 02:59:39','2022-10-07 02:59:39.196000'),(1548,1538,12,'2022-10-07 03:04:48','2022-10-07 03:04:48.350000');
/*!40000 ALTER TABLE `postcard_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship`
--

DROP TABLE IF EXISTS `sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsorship` (
  `sponsorship_seq` int NOT NULL AUTO_INCREMENT,
  `user_seq` int NOT NULL,
  `foundation_seq` int NOT NULL,
  `REG_DTM` datetime DEFAULT NULL,
  `MOD_DTM` datetime DEFAULT NULL,
  PRIMARY KEY (`sponsorship_seq`,`user_seq`,`foundation_seq`),
  KEY `FK_User_TO_Sponsorship_1` (`user_seq`),
  KEY `FK_Foundation_TO_Sponsorship_1` (`foundation_seq`),
  CONSTRAINT `FK_Foundation_TO_Sponsorship_1` FOREIGN KEY (`foundation_seq`) REFERENCES `foundation` (`foundation_seq`),
  CONSTRAINT `FK_User_TO_Sponsorship_1` FOREIGN KEY (`user_seq`) REFERENCES `user` (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (1,1,1,'2022-09-07 00:00:00',NULL);
/*!40000 ALTER TABLE `sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_seq` int NOT NULL AUTO_INCREMENT,
  `postcard_seq` int NOT NULL,
  `tag_content` varchar(45) DEFAULT NULL,
  `REG_DTM` datetime DEFAULT NULL,
  `mod_dtm` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`tag_seq`,`postcard_seq`),
  KEY `FK_Postcard_TO_Tag_1` (`postcard_seq`),
  CONSTRAINT `FK_Postcard_TO_Tag_1` FOREIGN KEY (`postcard_seq`) REFERENCES `postcard` (`postcard_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=1548 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,1,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(2,2,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(3,3,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(4,4,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(5,5,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(6,6,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(7,7,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(8,8,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(9,9,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(10,10,'싸피','2022-10-06 20:24:31','2022-10-06 20:24:31.000000'),(1231,1230,'동양','2022-10-06 20:58:43','2022-10-06 20:58:43.406000'),(1232,1230,'부쉬','2022-10-06 20:58:43','2022-10-06 20:58:43.407000'),(1233,1230,'나무','2022-10-06 20:58:43','2022-10-06 20:58:43.408000'),(1236,1235,'던전','2022-10-06 21:08:18','2022-10-06 21:08:17.883000'),(1237,1235,'모래','2022-10-06 21:08:18','2022-10-06 21:08:17.884000'),(1238,1235,'산','2022-10-06 21:08:18','2022-10-06 21:08:17.885000'),(1239,1235,'강','2022-10-06 21:08:18','2022-10-06 21:08:17.886000'),(1241,1240,'언덕','2022-10-06 21:24:54','2022-10-06 21:24:54.091000'),(1242,1240,'강','2022-10-06 21:24:54','2022-10-06 21:24:54.092000'),(1243,1240,'산','2022-10-06 21:24:54','2022-10-06 21:24:54.093000'),(1245,1244,'입력','2022-10-06 22:05:39','2022-10-06 22:05:39.144000'),(1247,1246,'금수강산','2022-10-06 22:10:15','2022-10-06 22:10:14.502000'),(1248,1246,'구름','2022-10-06 22:10:15','2022-10-06 22:10:14.503000'),(1249,1246,'산','2022-10-06 22:10:15','2022-10-06 22:10:14.504000'),(1250,1246,'안개','2022-10-06 22:10:15','2022-10-06 22:10:14.505000'),(1251,1246,'바다','2022-10-06 22:10:15','2022-10-06 22:10:14.506000'),(1253,1252,'구름','2022-10-06 22:10:25','2022-10-06 22:10:25.426000'),(1254,1252,'하늘','2022-10-06 22:10:25','2022-10-06 22:10:25.427000'),(1255,1252,'다리','2022-10-06 22:10:25','2022-10-06 22:10:25.428000'),(1256,1252,'바다','2022-10-06 22:10:25','2022-10-06 22:10:25.429000'),(1257,1252,'물','2022-10-06 22:10:25','2022-10-06 22:10:25.430000'),(1258,1252,'자갈','2022-10-06 22:10:25','2022-10-06 22:10:25.431000'),(1260,1259,'선팔하면맞팔','2022-10-06 22:18:46','2022-10-06 22:18:45.551000'),(1261,1259,'광안리','2022-10-06 22:18:46','2022-10-06 22:18:45.552000'),(1262,1259,'건대','2022-10-06 22:18:46','2022-10-06 22:18:45.553000'),(1263,1259,'홍대','2022-10-06 22:18:46','2022-10-06 22:18:45.554000'),(1264,1259,'OOTD','2022-10-06 22:18:46','2022-10-06 22:18:45.554000'),(1265,1259,'서면','2022-10-06 22:18:46','2022-10-06 22:18:45.555000'),(1266,1259,'소통해요','2022-10-06 22:18:46','2022-10-06 22:18:45.556000'),(1267,1259,'언팔','2022-10-06 22:18:46','2022-10-06 22:18:45.557000'),(1268,1259,'맞팔','2022-10-06 22:18:46','2022-10-06 22:18:45.558000'),(1269,1259,'구름','2022-10-06 22:18:46','2022-10-06 22:18:45.559000'),(1270,1259,'하늘','2022-10-06 22:18:46','2022-10-06 22:18:45.560000'),(1271,1259,'나무기둥','2022-10-06 22:18:46','2022-10-06 22:18:45.561000'),(1272,1259,'나무','2022-10-06 22:18:46','2022-10-06 22:18:45.562000'),(1273,1259,'꽃','2022-10-06 22:18:46','2022-10-06 22:18:45.563000'),(1274,1259,'눈','2022-10-06 22:18:46','2022-10-06 22:18:45.563000'),(1275,1259,'돌','2022-10-06 22:18:46','2022-10-06 22:18:45.564000'),(1276,1259,'언덕','2022-10-06 22:18:46','2022-10-06 22:18:45.565000'),(1279,1278,'샌드위치','2022-10-06 22:33:11','2022-10-06 22:33:10.637000'),(1280,1278,'구름','2022-10-06 22:33:11','2022-10-06 22:33:10.638000'),(1281,1278,'하늘','2022-10-06 22:33:11','2022-10-06 22:33:10.639000'),(1282,1278,'뭐임?','2022-10-06 22:33:11','2022-10-06 22:33:10.640000'),(1283,1278,'플랫폼','2022-10-06 22:33:11','2022-10-06 22:33:10.641000'),(1284,1278,'부쉬','2022-10-06 22:33:11','2022-10-06 22:33:10.642000'),(1285,1278,'다리','2022-10-06 22:33:11','2022-10-06 22:33:10.643000'),(1286,1278,'산','2022-10-06 22:33:11','2022-10-06 22:33:10.644000'),(1287,1278,'강','2022-10-06 22:33:11','2022-10-06 22:33:10.645000'),(1290,1289,'하늘','2022-10-06 22:40:38','2022-10-06 22:40:37.565000'),(1291,1289,'구름','2022-10-06 22:40:38','2022-10-06 22:40:37.567000'),(1292,1289,'풀','2022-10-06 22:40:38','2022-10-06 22:40:37.568000'),(1293,1289,'언덕','2022-10-06 22:40:38','2022-10-06 22:40:37.569000'),(1295,1294,'걸작','2022-10-06 23:08:42','2022-10-06 23:08:41.839000'),(1296,1294,'피카소','2022-10-06 23:08:42','2022-10-06 23:08:41.840000'),(1297,1294,'모나리자','2022-10-06 23:08:42','2022-10-06 23:08:41.841000'),(1298,1294,'현우94','2022-10-06 23:08:42','2022-10-06 23:08:41.843000'),(1301,1300,'조화로운세상','2022-10-06 23:17:15','2022-10-06 23:17:15.111000'),(1302,1300,'꽃','2022-10-06 23:17:15','2022-10-06 23:17:15.112000'),(1303,1300,'풀','2022-10-06 23:17:15','2022-10-06 23:17:15.113000'),(1304,1300,'안개','2022-10-06 23:17:15','2022-10-06 23:17:15.114000'),(1305,1300,'다리','2022-10-06 23:17:15','2022-10-06 23:17:15.115000'),(1306,1300,'강','2022-10-06 23:17:15','2022-10-06 23:17:15.116000'),(1307,1300,'바다','2022-10-06 23:17:15','2022-10-06 23:17:15.117000'),(1309,1308,'동양화','2022-10-06 23:20:15','2022-10-06 23:20:15.330000'),(1310,1308,'풍경화','2022-10-06 23:20:15','2022-10-06 23:20:15.331000'),(1311,1308,'구름','2022-10-06 23:20:15','2022-10-06 23:20:15.332000'),(1312,1308,'산','2022-10-06 23:20:15','2022-10-06 23:20:15.333000'),(1313,1308,'안개','2022-10-06 23:20:15','2022-10-06 23:20:15.334000'),(1314,1308,'바다','2022-10-06 23:20:15','2022-10-06 23:20:15.335000'),(1318,1317,'개힘드네','2022-10-06 23:21:04','2022-10-06 23:21:03.586000'),(1319,1317,'구름','2022-10-06 23:21:04','2022-10-06 23:21:03.587000'),(1320,1317,'하늘','2022-10-06 23:21:04','2022-10-06 23:21:03.588000'),(1321,1317,'부쉬','2022-10-06 23:21:04','2022-10-06 23:21:03.589000'),(1322,1317,'나무기둥','2022-10-06 23:21:04','2022-10-06 23:21:03.590000'),(1323,1317,'울타리','2022-10-06 23:21:04','2022-10-06 23:21:03.591000'),(1325,1324,'구름','2022-10-06 23:26:29','2022-10-06 23:26:29.068000'),(1326,1324,'안개','2022-10-06 23:26:29','2022-10-06 23:26:29.069000'),(1327,1324,'눈','2022-10-06 23:26:29','2022-10-06 23:26:29.070000'),(1329,1328,'나무','2022-10-06 23:29:39','2022-10-06 23:29:38.959000'),(1330,1328,'지붕','2022-10-06 23:29:39','2022-10-06 23:29:38.960000'),(1331,1328,'집','2022-10-06 23:29:39','2022-10-06 23:29:38.961000'),(1332,1328,'풀','2022-10-06 23:29:39','2022-10-06 23:29:38.962000'),(1333,1328,'울타리','2022-10-06 23:29:39','2022-10-06 23:29:38.963000'),(1335,1334,'구름','2022-10-06 23:33:19','2022-10-06 23:33:18.678000'),(1336,1334,'하늘','2022-10-06 23:33:19','2022-10-06 23:33:18.679000'),(1337,1334,'바다','2022-10-06 23:33:19','2022-10-06 23:33:18.680000'),(1338,1334,'바위','2022-10-06 23:33:19','2022-10-06 23:33:18.680000'),(1339,1334,'모래','2022-10-06 23:33:19','2022-10-06 23:33:18.681000'),(1340,1334,'지붕','2022-10-06 23:33:19','2022-10-06 23:33:18.682000'),(1342,1341,'언더더씨','2022-10-06 23:35:15','2022-10-06 23:35:15.299000'),(1343,1341,'하늘','2022-10-06 23:35:15','2022-10-06 23:35:15.300000'),(1344,1341,'흙','2022-10-06 23:35:15','2022-10-06 23:35:15.300000'),(1345,1341,'도로','2022-10-06 23:35:15','2022-10-06 23:35:15.301000'),(1346,1341,'기타','2022-10-06 23:35:15','2022-10-06 23:35:15.302000'),(1347,1341,'꽃','2022-10-06 23:35:15','2022-10-06 23:35:15.303000'),(1348,1341,'산','2022-10-06 23:35:15','2022-10-06 23:35:15.304000'),(1349,1341,'구름','2022-10-06 23:35:15','2022-10-06 23:35:15.305000'),(1350,1341,'바위','2022-10-06 23:35:15','2022-10-06 23:35:15.306000'),(1351,1341,'바다','2022-10-06 23:35:15','2022-10-06 23:35:15.307000'),(1352,1341,'지붕','2022-10-06 23:35:15','2022-10-06 23:35:15.307000'),(1353,1341,'벽돌벽','2022-10-06 23:35:15','2022-10-06 23:35:15.308000'),(1355,1354,'울타리','2022-10-06 23:40:05','2022-10-06 23:40:04.736000'),(1356,1354,'나무','2022-10-06 23:40:05','2022-10-06 23:40:04.737000'),(1357,1354,'언덕','2022-10-06 23:40:05','2022-10-06 23:40:04.738000'),(1358,1354,'풀','2022-10-06 23:40:05','2022-10-06 23:40:04.739000'),(1360,1359,'강','2022-10-06 23:42:16','2022-10-06 23:42:16.128000'),(1361,1359,'부쉬','2022-10-06 23:42:16','2022-10-06 23:42:16.129000'),(1362,1359,'울타리','2022-10-06 23:42:16','2022-10-06 23:42:16.129000'),(1363,1359,'꽃','2022-10-06 23:42:16','2022-10-06 23:42:16.130000'),(1364,1359,'풀','2022-10-06 23:42:16','2022-10-06 23:42:16.131000'),(1370,1369,'흘린다.','2022-10-06 23:50:37','2022-10-06 23:50:36.583000'),(1371,1369,'눈물을','2022-10-06 23:50:37','2022-10-06 23:50:36.584000'),(1372,1369,'가끔','2022-10-06 23:50:37','2022-10-06 23:50:36.585000'),(1374,1373,'흘린다.','2022-10-06 23:53:59','2022-10-06 23:53:58.862000'),(1375,1373,'눈물을','2022-10-06 23:53:59','2022-10-06 23:53:58.863000'),(1376,1373,'가끔','2022-10-06 23:53:59','2022-10-06 23:53:58.864000'),(1377,1373,'나는','2022-10-06 23:53:59','2022-10-06 23:53:58.865000'),(1379,1378,'구름','2022-10-07 00:02:32','2022-10-07 00:02:32.188000'),(1380,1378,'산','2022-10-07 00:02:32','2022-10-07 00:02:32.189000'),(1381,1378,'안개','2022-10-07 00:02:32','2022-10-07 00:02:32.190000'),(1382,1378,'바다','2022-10-07 00:02:32','2022-10-07 00:02:32.191000'),(1384,1383,'눈물을','2022-10-07 00:08:07','2022-10-07 00:08:06.990000'),(1385,1383,'가끔','2022-10-07 00:08:07','2022-10-07 00:08:06.990000'),(1386,1383,'나는','2022-10-07 00:08:07','2022-10-07 00:08:06.991000'),(1388,1387,'풍경화','2022-10-07 00:10:31','2022-10-07 00:10:30.730000'),(1389,1387,'한국적','2022-10-07 00:10:31','2022-10-07 00:10:30.731000'),(1390,1387,'구름','2022-10-07 00:10:31','2022-10-07 00:10:30.732000'),(1391,1387,'산','2022-10-07 00:10:31','2022-10-07 00:10:30.733000'),(1392,1387,'안개','2022-10-07 00:10:31','2022-10-07 00:10:30.734000'),(1393,1387,'바다','2022-10-07 00:10:31','2022-10-07 00:10:30.735000'),(1397,1396,'구름','2022-10-07 00:31:04','2022-10-07 00:31:03.775000'),(1398,1396,'하늘','2022-10-07 00:31:04','2022-10-07 00:31:03.776000'),(1399,1396,'언덕','2022-10-07 00:31:04','2022-10-07 00:31:03.777000'),(1401,1400,'흘린다.','2022-10-07 00:32:13','2022-10-07 00:32:12.736000'),(1402,1400,'눈물을','2022-10-07 00:32:13','2022-10-07 00:32:12.737000'),(1403,1400,'가끔','2022-10-07 00:32:13','2022-10-07 00:32:12.738000'),(1404,1400,'나는','2022-10-07 00:32:13','2022-10-07 00:32:12.739000'),(1411,1410,'구름','2022-10-07 01:09:25','2022-10-07 01:09:24.675000'),(1412,1410,'산','2022-10-07 01:09:25','2022-10-07 01:09:24.676000'),(1413,1410,'안개','2022-10-07 01:09:25','2022-10-07 01:09:24.677000'),(1414,1410,'바다','2022-10-07 01:09:25','2022-10-07 01:09:24.678000'),(1416,1415,'구름','2022-10-07 01:49:54','2022-10-07 01:49:54.440000'),(1417,1415,'하늘','2022-10-07 01:49:54','2022-10-07 01:49:54.442000'),(1418,1415,'눈','2022-10-07 01:49:54','2022-10-07 01:49:54.443000'),(1419,1415,'부쉬','2022-10-07 01:49:54','2022-10-07 01:49:54.445000'),(1420,1415,'풀','2022-10-07 01:49:54','2022-10-07 01:49:54.448000'),(1421,1415,'꽃','2022-10-07 01:49:54','2022-10-07 01:49:54.449000'),(1422,1415,'언덕','2022-10-07 01:49:54','2022-10-07 01:49:54.451000'),(1423,1415,'지붕','2022-10-07 01:49:54','2022-10-07 01:49:54.452000'),(1424,1415,'집','2022-10-07 01:49:54','2022-10-07 01:49:54.453000'),(1425,1415,'나무','2022-10-07 01:49:54','2022-10-07 01:49:54.455000'),(1427,1426,'구름','2022-10-07 01:54:42','2022-10-07 01:54:41.583000'),(1428,1426,'하늘','2022-10-07 01:54:42','2022-10-07 01:54:41.584000'),(1429,1426,'언덕','2022-10-07 01:54:42','2022-10-07 01:54:41.585000'),(1430,1426,'산','2022-10-07 01:54:42','2022-10-07 01:54:41.586000'),(1431,1426,'강','2022-10-07 01:54:42','2022-10-07 01:54:41.587000'),(1432,1426,'플랫폼','2022-10-07 01:54:42','2022-10-07 01:54:41.588000'),(1434,1433,'피카소','2022-10-07 01:57:11','2022-10-07 01:57:11.168000'),(1435,1433,'구름','2022-10-07 01:57:11','2022-10-07 01:57:11.169000'),(1436,1433,'나무','2022-10-07 01:57:11','2022-10-07 01:57:11.170000'),(1437,1433,'부쉬','2022-10-07 01:57:11','2022-10-07 01:57:11.171000'),(1438,1433,'짚','2022-10-07 01:57:11','2022-10-07 01:57:11.172000'),(1439,1433,'풀','2022-10-07 01:57:11','2022-10-07 01:57:11.173000'),(1440,1433,'나무기둥','2022-10-07 01:57:11','2022-10-07 01:57:11.174000'),(1441,1433,'돌','2022-10-07 01:57:11','2022-10-07 01:57:11.174000'),(1442,1433,'눈','2022-10-07 01:57:11','2022-10-07 01:57:11.175000'),(1443,1433,'하늘','2022-10-07 01:57:11','2022-10-07 01:57:11.176000'),(1444,1433,'포장도로','2022-10-07 01:57:11','2022-10-07 01:57:11.177000'),(1445,1433,'진흙','2022-10-07 01:57:11','2022-10-07 01:57:11.178000'),(1446,1433,'기타','2022-10-07 01:57:11','2022-10-07 01:57:11.179000'),(1447,1433,'자갈','2022-10-07 01:57:11','2022-10-07 01:57:11.180000'),(1448,1433,'도로','2022-10-07 01:57:11','2022-10-07 01:57:11.181000'),(1449,1433,'모래','2022-10-07 01:57:11','2022-10-07 01:57:11.181000'),(1450,1433,'플랫폼','2022-10-07 01:57:11','2022-10-07 01:57:11.182000'),(1451,1433,'나무벽','2022-10-07 01:57:11','2022-10-07 01:57:11.183000'),(1452,1433,'다리','2022-10-07 01:57:11','2022-10-07 01:57:11.184000'),(1453,1433,'지붕','2022-10-07 01:57:11','2022-10-07 01:57:11.185000'),(1454,1433,'돌벽','2022-10-07 01:57:11','2022-10-07 01:57:11.186000'),(1455,1433,'벽돌벽','2022-10-07 01:57:11','2022-10-07 01:57:11.186000'),(1457,1456,'동양화','2022-10-07 01:57:36','2022-10-07 01:57:36.118000'),(1458,1456,'GD','2022-10-07 01:57:36','2022-10-07 01:57:36.119000'),(1459,1456,'구름','2022-10-07 01:57:36','2022-10-07 01:57:36.120000'),(1460,1456,'하늘','2022-10-07 01:57:36','2022-10-07 01:57:36.120000'),(1461,1456,'나무','2022-10-07 01:57:36','2022-10-07 01:57:36.121000'),(1462,1456,'풀','2022-10-07 01:57:36','2022-10-07 01:57:36.122000'),(1465,1464,'하늘','2022-10-07 02:03:21','2022-10-07 02:03:20.698000'),(1466,1464,'별','2022-10-07 02:03:21','2022-10-07 02:03:20.699000'),(1467,1464,'GD','2022-10-07 02:03:21','2022-10-07 02:03:20.700000'),(1468,1464,'고흐','2022-10-07 02:03:21','2022-10-07 02:03:20.700000'),(1480,1479,'풀','2022-10-07 02:07:56','2022-10-07 02:07:56.138000'),(1481,1479,'짚','2022-10-07 02:07:56','2022-10-07 02:07:56.139000'),(1482,1479,'나무기둥','2022-10-07 02:07:56','2022-10-07 02:07:56.140000'),(1483,1479,'나무','2022-10-07 02:07:56','2022-10-07 02:07:56.140000'),(1484,1479,'부쉬','2022-10-07 02:07:56','2022-10-07 02:07:56.141000'),(1485,1479,'꽃','2022-10-07 02:07:56','2022-10-07 02:07:56.142000'),(1486,1479,'바위','2022-10-07 02:07:56','2022-10-07 02:07:56.143000'),(1487,1479,'물','2022-10-07 02:07:56','2022-10-07 02:07:56.144000'),(1488,1479,'돌','2022-10-07 02:07:56','2022-10-07 02:07:56.144000'),(1489,1479,'눈','2022-10-07 02:07:56','2022-10-07 02:07:56.145000'),(1490,1479,'하늘','2022-10-07 02:07:56','2022-10-07 02:07:56.146000'),(1491,1479,'강','2022-10-07 02:07:56','2022-10-07 02:07:56.147000'),(1492,1479,'산','2022-10-07 02:07:56','2022-10-07 02:07:56.148000'),(1493,1479,'언덕','2022-10-07 02:07:56','2022-10-07 02:07:56.149000'),(1494,1479,'집','2022-10-07 02:07:56','2022-10-07 02:07:56.149000'),(1495,1479,'울타리','2022-10-07 02:07:56','2022-10-07 02:07:56.150000'),(1496,1479,'다리','2022-10-07 02:07:56','2022-10-07 02:07:56.151000'),(1500,1499,'동양','2022-10-07 02:24:21','2022-10-07 02:24:21.015000'),(1501,1499,'산','2022-10-07 02:24:21','2022-10-07 02:24:21.016000'),(1503,1502,'하늘','2022-10-07 02:28:30','2022-10-07 02:28:29.848000'),(1504,1502,'눈','2022-10-07 02:28:30','2022-10-07 02:28:29.849000'),(1505,1502,'바위','2022-10-07 02:28:30','2022-10-07 02:28:29.850000'),(1506,1502,'구름','2022-10-07 02:28:30','2022-10-07 02:28:29.851000'),(1510,1509,'구름','2022-10-07 02:35:40','2022-10-07 02:35:40.223000'),(1511,1509,'나무','2022-10-07 02:35:40','2022-10-07 02:35:40.224000'),(1512,1509,'하늘','2022-10-07 02:35:40','2022-10-07 02:35:40.225000'),(1513,1509,'꽃','2022-10-07 02:35:40','2022-10-07 02:35:40.226000'),(1514,1509,'언덕','2022-10-07 02:35:40','2022-10-07 02:35:40.227000'),(1519,1518,'작가 손지민','2022-10-07 02:38:51','2022-10-07 02:38:50.922000'),(1520,1518,'산','2022-10-07 02:38:51','2022-10-07 02:38:50.923000'),(1523,1522,'짱구','2022-10-07 02:42:25','2022-10-07 02:42:25.083000'),(1525,1524,'구름','2022-10-07 02:47:47','2022-10-07 02:47:46.768000'),(1526,1524,'벽돌벽','2022-10-07 02:47:47','2022-10-07 02:47:46.769000'),(1528,1527,'울타리','2022-10-07 02:54:51','2022-10-07 02:54:51.122000'),(1529,1527,'풀','2022-10-07 02:54:51','2022-10-07 02:54:51.123000'),(1539,1538,'하늘','2022-10-07 03:04:36','2022-10-07 03:04:36.392000'),(1540,1538,'무제','2022-10-07 03:04:36','2022-10-07 03:04:36.393000'),(1541,1538,'풀','2022-10-07 03:04:36','2022-10-07 03:04:36.394000'),(1542,1538,'꽃','2022-10-07 03:04:36','2022-10-07 03:04:36.394000'),(1543,1538,'강','2022-10-07 03:04:36','2022-10-07 03:04:36.395000'),(1544,1538,'돌','2022-10-07 03:04:36','2022-10-07 03:04:36.396000'),(1545,1538,'안개','2022-10-07 03:04:36','2022-10-07 03:04:36.397000'),(1546,1538,'바위','2022-10-07 03:04:36','2022-10-07 03:04:36.397000'),(1547,1538,'바다','2022-10-07 03:04:36','2022-10-07 03:04:36.398000');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_seq` int NOT NULL AUTO_INCREMENT,
  `user_code` int NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_phone` varchar(13) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_profile_url` varchar(255) DEFAULT NULL,
  `user_template` int DEFAULT '0',
  `user_remind1` int DEFAULT NULL,
  `user_remind2` int DEFAULT NULL,
  `user_remind3` int DEFAULT NULL,
  `user_remind4` int DEFAULT NULL,
  `user_remind5` int DEFAULT NULL,
  `user_remind6` int DEFAULT NULL,
  `user_remind7` int DEFAULT NULL,
  `user_remind8` int DEFAULT NULL,
  `user_remind9` int DEFAULT NULL,
  `user_remind10` int DEFAULT NULL,
  `user_remind11` int DEFAULT NULL,
  `user_remind12` int DEFAULT NULL,
  `REG_DTM` datetime NOT NULL,
  `MOD_DTM` datetime DEFAULT NULL,
  PRIMARY KEY (`user_seq`,`user_code`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `FK_Code_TO_User_1` (`user_code`),
  CONSTRAINT `FK_Code_TO_User_1` FOREIGN KEY (`user_code`) REFERENCES `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,101,'김싸피','kimssafy','user_password','user_phone','user_email','user_profile',1,1,0,0,0,0,0,0,0,0,0,0,0,'2022-09-07 00:00:00','2022-09-28 16:04:14'),(2,102,'홍길동','hong','1234','010-2222-2222','hong@ssafy.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-07 00:00:00',NULL),(3,101,'1234','123123','$2a$10$Un.Gs4ZovzS5yDJmYxLnleR4JOd6NigsT0towMDsqpnmVuIpLTesq','01012341234','123123@ njk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 13:14:09','2022-09-19 13:14:09'),(5,101,'123','12','$2a$10$QsapSwUeohSPgZDSte5u5OPtTTHzJ/92w07uLaOXb5M03gxgYepoa','01012341234','1231@bjkb.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 13:15:11','2022-09-19 13:15:11'),(8,101,'fskl','123','$2a$10$kbidzwyMtN9fX..2nArcP.B7oz15NreA0GQ6.H9EzAFVmJ.hUFTka','01061561561','12421421@nk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 13:19:11','2022-09-19 13:19:11'),(10,101,'1234','1235','$2a$10$lu.RK3ADOS8sAtW9e48fVOzrXLsgjdWD6uXuLJpqPUiqy/qyXe4GC','01021341234','fnjoh@nlkj.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 13:43:05','2022-09-19 13:43:05'),(12,101,'1234','1234','$2a$10$8euaRM1.p7npCri.eSYJFOvK5ybuji41c7G17naDvz8b1C5LZn2M2','01012341234','3123@njkl.com','https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/profile_imgages_folder/1234/2022-10-06/yeupseo-12104355.png',0,38,63,64,37,47,49,56,0,0,56,0,0,'2022-09-19 14:44:50','2022-10-06 23:48:54'),(13,101,'123','1','$2a$10$yjxxaoy7Dp0UeCgQJDxAL.axjLe/C0jtYPbJn4Ko48Rxqu2hjdqvy','01012341234','sad@nkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 16:02:43','2022-09-19 16:02:43'),(14,101,'adasdas','123456','$2a$10$pRjA8g3YCRqlzm4VFnhH3ez1/st8lQuGxaIpPJAmTfwSIdzzNYRAq','12341234122','dwd@nklmn.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 16:04:48','2022-09-19 16:04:48'),(15,101,'123','fsdf','$2a$10$4dsomMGptYENfS.cWP.dEOQk18DUy4/T1X.hyjEzgatqgCcTQ1eQu','01012341234','nkln@nlkm.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 17:13:46','2022-09-19 17:13:46'),(16,101,'굿럭','녹말','$2a$10$Qv8XZXYFCpY.tmqrZyM2suMGbnm6.3CJ7I1Y4iThq0LhZlPFRatk.','12341234455','nkn@nlk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 20:49:00','2022-09-19 20:49:00'),(17,101,'개인','피파','$2a$10$kn92I4frZXnpKqM0wbs5t.RywXd2IfzDGQN/YqT2J/68LSgnN59fO','12341234123','sdknnk@njk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-19 20:51:55','2022-09-19 20:51:55'),(18,101,'쿠헬헬','쿠헬헬헬','$2a$10$JQUDiCzu1siFGKa.hTxlduPXMFMdROrmNxNhCdMPHGb0NuRzon8.2','12341234123','kknl@nln.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 09:54:12','2022-09-20 09:54:12'),(19,101,'제학','wpgkr','$2a$10$dTAJzfFtmkKyU7lJckCG2eLJuAPRmKXtiOaSiXqBqYVcZxmOmHRrS','01023371093','wpgkr1093@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 12:36:20','2022-09-20 12:36:20'),(21,101,'박정현','kevin1110','$2a$10$ocT3RpP4grrBfhon0ZA0vuwirScpkGwsqTtkVWnmROT031.vN.Iae','01054596412','kevin123488@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:24:11','2022-09-20 15:24:11'),(23,101,'박정현','kevin1010','$2a$10$C3CvlhETfoBTcp/qOT3MMu19jPocDFL.LLACSKAN1f1h1TETVvytS','01054596412','kevin@sdfw.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:26:14','2022-09-20 15:26:14'),(24,101,'fnkln','sdqd','$2a$10$xe3WiAYt1sOy0sezOiqqzuugzWYcSQy3cBNXDVOT6DYe5kRfmX9by','12312412321','sdnklnl@nkln.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:27:49','2022-09-20 15:27:49'),(25,101,'ac','dasvsdv','$2a$10$i/4gCUy2dLY7FKkWOcPBC.9shovf76ZlGs584SJnpjxrhQJaEGMCW','12312412412','dasd@nlknk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:30:54','2022-09-20 15:30:54'),(26,101,'sfsdfsdf','test','$2a$10$SjDQSyAJdk8Rn0mRsSRGs.Rbrz4gPAxdUTQQZvN1LnDLwZno3lYFC','12312412412','bkjbjks@njk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:31:31','2022-09-20 15:31:31'),(27,101,'nklnkl','test5','$2a$10$a95eunvJxFQUa8ucPGoliuEvvyl1E5Gs4lu2rl2kGw70JUacm7ykq','12412412412','jksbsj@nklj.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:32:08','2022-09-20 15:32:08'),(28,101,'박정현','정현정현','$2a$10$DkJSJqjNr2b8BtETcynTjOq20FXP7PULdYet9E18NrSMkdhtRskQK','0100100101','kevin@sdfw.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:33:50','2022-09-20 15:33:50'),(29,101,'박정현','정현123','$2a$10$yVcvrSqGmZhlimeT1m59S.jDdDWU3saw9rfS6cwZFdI7cN2.4skqu','01054596412','kevin123488@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:40:47','2022-09-20 15:40:47'),(30,101,'박정현','월드비전담당자','$2a$10$/SazZYW3LRWasMaQzerhU.5kU2LFgMryfdxrGxGeYXGGlB0vw8ETG','01054596412','kevin@sdfw.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:47:40','2022-09-20 15:47:40'),(31,101,'das','cxzczx','$2a$10$/880g1qqE0Lr5uRjutkVjOlf8EPPB2n47Oqv54Xrd7ZHeoBznOyEG','12323123123','dasd@nkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:48:24','2022-09-20 15:48:24'),(32,101,'dd','test06','$2a$10$cIKGOOKqzhA.PVMnNemy0e2rNedwDPJAhhQZ/HhztDYq5gf.GKKKO','22312321312','das@nkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:54:59','2022-09-20 15:54:59'),(33,101,'dasd','test07','$2a$10$AKXkR8Qu2MWPprrIRwf5uOSnaSaiiUAO3rtuN3Y0CY39R.7hLamz.','12312312312','asda@nkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-20 15:55:53','2022-09-20 15:55:53'),(34,101,'sl nkfnm','xcxs','$2a$10$U73dLxuh5IYP5au27RJI8uanQaJFY/JEY7sjr0ZSlsqcKkka5sQF.','12131231231','fsdfsdf@mnklnkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 08:44:23','2022-09-21 08:44:23'),(35,101,'12312323','zxcxcz','$2a$10$ZK3lPl1n94SkQyaqtU5rH.223IGGeOh/UXnpZbPklaNxgLsglu3lu','12312312443','fkln@mlkm.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 08:46:10','2022-09-21 08:46:10'),(36,101,'sadasd','dsfsdfsdf','$2a$10$RXyNcbB2XW7qOyKEVl5AWOj7MmUr0qhW6SrMvmkX97Y8OKVA6ZynC','21312312312','nklsdnoak@nolm.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 08:47:27','2022-09-21 08:47:27'),(37,101,'asdasdas','scssssss','$2a$10$xtzpVfMxDb.EYtiK1HEJv.7TH/i9K285b1YGWXiD/v5gKb.6vLb8a','12341231241','bjbh@njkn.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 08:52:12','2022-09-21 08:52:12'),(38,101,'회원가입','회원가입','$2a$10$KdZouUSYPZcYUwmqmFl71.qxrXt37ILm1k5rb6LE6jAJRiNmk5c0e','12341234123','fnksdn@nklj.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:14:35','2022-09-21 09:14:35'),(39,101,'dqwdqwd','sssss','$2a$10$lBpl9pbUaby/D/iAHsv/p.NhtOIqUIu6IT84/aDjDjElDc5pSQ7T.','21312141241','fsdnkl@nkln.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:22:40','2022-09-21 09:22:40'),(41,101,'sdfsdfds','csdcdscs','$2a$10$BLl5hz0LvusUSxJ8F1ov5O.BIX4cYTO2HMsdrPY41/MWBmIhJmUp2','01110510501','nkln@nlkk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:24:24','2022-09-21 09:24:24'),(42,101,'ㅊㅊㅊㅊ','asdasdsx','$2a$10$vpnBUrxFlivSRJcvvJjxVO47YXzXq1Q6nTXSUFlYFBMv/u6JaAztW','12312312312','dsdasd@njkln.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:25:07','2022-09-21 09:25:07'),(43,101,',l;k','cvfbgyjjkkllllllllllllllllllllllllll','$2a$10$Xjx5Rdzh1ntK/dV6qJ5TLOtLeF98Dpsmq6W2OmY9Tkm4mgu0PYs.C','12312312312','fjkbjks@nkn.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:26:46','2022-09-21 09:26:46'),(44,101,'ccc','adasdas','$2a$10$KiMYt9OeNIrkpvHn.EjdVuMa/IeVJLV/dDzaw8Uhi/VPZHnXZAOcC','12312312312','adasd@nkn.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:29:01','2022-09-21 09:29:01'),(45,101,'jpk[k','cckkkkkjk','$2a$10$Q3jOOBL06zCtZ83vRmsYaeEz4Thbc2NLnHVC6zNAw.tunMvRYy6Za','12312312312','dslknko@nlml.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:29:56','2022-09-21 09:29:56'),(46,101,'213','jkjhkhjkjhk','$2a$10$spSd.9OOaPyR.vWcVGfUA.hbBiITKWgD4fo8H7NmKWGWoIKRuxIdC','12312312312','mlkmkl@llmkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:31:01','2022-09-21 09:31:01'),(47,101,'l;m;','cjjjkjkj','$2a$10$/Nh/cJJd7Z62k5dy/mTy2.PJcz4SOZoWFYWYOBsO96pyrl7CVHkWy','12321312312','l;ml;@,lml.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:32:48','2022-09-21 09:32:48'),(48,101,'nkn','klljk','$2a$10$r.YNAEwI/OPMp8z45rYgpe2aoeeaYfAAoFejh7C6FmBsfvGn6bdbS','12321312312','klnfklsfd@lnkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:33:37','2022-09-21 09:33:37'),(49,101,'gfgfgf','jhkjhkjh','$2a$10$8sbYLBXtNQoF3NOkuw6hrO8WkR9bg0diqWeeY1Z3BiTo2l4KIl9Ne','12312312312','jkbjk@bjkbk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:37:07','2022-09-21 09:37:07'),(50,101,'jhjkjhkj','fsdfsdf','$2a$10$KeT88beg1VRNopevn1nmnuusG5FTti.c1AibMUnMX05lucbdiLZRi','12312312312','nkjnjkns@vsdv.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 09:38:46','2022-09-21 09:38:46'),(51,101,'nkll','ad','$2a$10$wWDJdtoDE/Mb5WFw5hP1Z.2UvzKUxBMs4Dr5boZc11g.iLwJJbLrG','13151651515','aca@nklnm.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 10:21:12','2022-09-21 10:21:12'),(52,101,'klnkln','bhnhnhn','$2a$10$Pf6VzQ7VBjYM0GbM0myUsucEmuOb5bCxZVInThf9F6jf3/u690r2a','01011111111','ddasd@nkl.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-21 10:23:41','2022-09-21 10:23:41'),(53,101,'박제학이에요','wpgkr123','$2a$10$lN50qkvuP10hMww2PQY0nuBWODw2rtfFeo4r4CDjjsrq0JMAVkjku','01012341234','wpgkr@afasf.asdf',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-22 13:47:12','2022-09-22 13:47:12'),(54,101,'손지민','jimin','$2a$10$eE.znNmslvICZCNoivMeKeAOJg2FhiZsan6U5HSLGpagTxN7kLSNa','01011111111','jimin6206@naver.com','https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/profile_imgages_folder/jimin/2022-10-06/yeupseo-5422925.png',0,104,0,0,0,0,0,0,0,0,0,0,0,'2022-09-22 17:03:45','2022-10-07 02:31:09'),(55,101,'mklm','dsd','$2a$10$GwI8v3vRR7sPzym0f7tnNeVW1aeOWyYm5qdUk8N4mNgb8Vlua83Wm','01012341234','fsdf@non.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-23 10:59:15','2022-09-23 10:59:15'),(56,101,'김문희','muni','$2a$10$zlnHXwakzfAfv..Y/7U.huiLI0HzYthy9wN8kAasAfeKTdos9644i','01011112222','muni@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-23 15:36:28','2022-09-23 15:36:28'),(57,101,'dddd','test12','$2a$10$SXayShWxuqxwon8we2mJJueEydmoQp6CtZGAXkVzoQtvf6YrZK1f.','01011111111','ddd@ddd.ddd',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-26 09:13:12','2022-09-26 09:13:12'),(58,101,'어드민이에요','admin','$2a$10$Fq3jzopE8CFVC.KNj.YF9u1jn2VpuQEH0g6qiM0ND6pyTU8uxw5Om','01029282920','1@12.2',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-26 15:27:54','2022-09-26 15:27:54'),(59,101,'진짜박제학','진짜박제학','$2a$10$P.ddbBfYGglnIhtkf.4GauKMSUaoTD2w69hmvCcxnPSilNnru4sKq','01023371093','wpgkr1093@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-26 15:38:56','2022-09-26 15:38:56'),(60,101,'박정현','유니셰프팀장','$2a$10$zIMlkfC7pZhQC0FCgefqxOc1oMYE7uBMsw6VpfbsuyqWvhQf1sedS','01054596412','kevin123488@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-26 16:12:06','2022-09-26 16:12:06'),(61,101,'박정현','유니셰프월드비전','$2a$10$ih3QOgM69aY0pxbTY8s4TutXgzr.0Wf8QHjorvXRP1G13SEGI3gUS','01054596412','kevin123488@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-26 16:59:00','2022-09-26 16:59:00'),(62,101,'asdf','asdf','$2a$10$YHeQin/2Y8YQbYb/UBbGMeaRl3Tsw8mvk5eKc5HfosIJwNtumnRY6','01092929381','asdf@asdf.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-28 10:37:33','2022-09-28 10:37:33'),(63,101,'두두펭','dudupeng','$2a$10$AZntMNmInjVwlOF98ec2xOmhnNrnpsJwEjry3JD5sfv/Rutv5Ge7u','01012341234','donguk@neverland.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-28 12:20:27','2022-09-28 12:20:27'),(64,101,'스칼렛요한슨','스칼렛요한슨','$2a$10$CcdhvKCMMlSGcfGiPW//R.Itr0L2gMUNyng6J1jbLMhWpllSIkOeC','01063495908','kjasm0714@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-28 14:39:10','2022-09-28 14:39:10'),(65,101,'신규','신규','$2a$10$BQp5TgGD0c2ckovSr3Ra/.f8UuoKN.s4GP2K8x.Y55TjHLyQ49Lou','01012341234','aasd@lk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-29 13:16:07','2022-09-29 13:16:07'),(66,101,'testmkd','testkd','$2a$10$5SkP0s7ppNnIOlO0vGroUeqwCwqpL7uJ3pf8fJ1o8BeOvOa0J/RoS','01000000000','testkd@naver.com','https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/profile_imgages_folder/testkd/2022-10-06/yeupseo-662120.png',0,85,0,0,0,0,0,0,0,0,0,0,0,'2022-09-29 13:40:03','2022-10-07 02:01:21'),(67,101,'현대인최년우','chl1380','$2a$10$K8g/zU110ubw2orFUHc/6ebXni7JQuZMlSBrGQm.YbKeQMgXUsx.a','01025478916','chl1380@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-29 20:27:55','2022-09-29 20:27:55'),(68,101,'ㅋㅋㅋ','ㅋㅋㅋ','$2a$10$Rzq7WoYnxqNyRAhjEpmCle3B6NFMPuoOS47Al9SfQrr0A.pxsbLcS','01012341234','asdf@asdf',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-30 09:04:42','2022-09-30 09:04:42'),(69,101,'뉴비','뉴비에요','$2a$10$6NwlySgPTGJ1Nk2lgnbgouS9pVzoZYRf7kX5dKMpLQPY7p7qVtBvu','01012341234','asdf@asdf',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-30 10:43:25','2022-09-30 10:43:25'),(70,101,'새아이디','새아이디','$2a$10$UVQHbOSXcACEB9KChBtt9eC7G1y6RiVksYmmSUcQ5r3UmwWEpaOJa','01012341234','sfsd@nlk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-09-30 13:22:02','2022-09-30 13:22:02'),(71,101,'테스트','qwe','$2a$10$P9Neb1q0fwxO5/XQGnArau6Lly9uxj7lNAkGGm6ySqA73mhmCLUYe','01011111111','test@test.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-03 23:56:03','2022-10-03 23:56:03'),(72,101,'새아이디','새아이디11','$2a$10$BzrswpcwXQQWumkrQj/ZnutkPYK.3lRPgunovRpck2nRKjnY.Gadq','01012312312','fsdf@nklmn.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-04 16:16:27','2022-10-04 16:16:27'),(73,101,'프로필','프로필','$2a$10$i/zHfNTm2tvVVPfbp1dEueR2CHeuaMD34KWaaneTojmSeWVNd44Im','01011231232','kjnk@nlk.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-06 10:57:15','2022-10-06 10:57:15'),(74,101,'전현우 바보','전현우바보','$2a$10$XcvalNqBLY7z/iqg4oUySOIWC4pribgInEfGXp7qL3yj589V.jYKq','01079071021','2@12.21',NULL,0,0,0,0,0,57,0,0,0,0,0,0,0,'2022-10-06 12:13:52','2022-10-06 12:16:49'),(75,101,'대정현','대정현','$2a$10$bZj1taGSe669afP1ns7K0.9Bbvh.zgVkG2djS1t3UlCWMfDHB4L/S','01012341234','asdf@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-06 13:28:39','2022-10-06 13:28:39'),(76,101,'나박정현인데','hamin','$2a$10$5Uv9K4iq9SmmHneV4C7OzuVYq7.KLaXpC1PkTmA5Tjw2t6ppY2iVa','01077220675','ohm55545@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-06 16:18:47','2022-10-06 16:18:47'),(77,101,'zxsdet','zxsdet','$2a$10$1lyBCdOXya/dU0X9wJ0KlOe2.LB5fZRDY5yKUq2CyrkS1.B4TW/2q','01012345678','zxsdet@zxsdet.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-06 18:13:35','2022-10-06 18:13:35'),(78,101,'고래밥','aaa','$2a$10$wVXzJqhmpv9zOc6xMBkCd.G2Ld4.n/F7KWmb8poW0TLuLN9HVO5pS','01011112222','aaa@aaa.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-06 18:38:14','2022-10-06 18:38:14'),(79,101,'박정현','하단동기부천사','$2a$10$fFdc1/3YbzdyOX2FS/vEnO9lCedy3oenOgoHFtYNXPvfYKAanJQBK','01054596412','kevin123488@naver.com',NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,'2022-10-06 22:11:45','2022-10-06 22:11:45'),(80,101,'현우94','soshot22','$2a$10$W/CMb.GMyEq9PwzA4yF72e7FsDmUVKvqwU24wbLUXcrQdzqOeceSm','01012341234','gusdn94@naver.com','https://bucket-e101-yeopseo.s3.ap-northeast-2.amazonaws.com/profile_imgages_folder/soshot22/2022-10-06/yeupseo-8023739.png',1,66,67,68,69,70,0,0,0,124,71,0,0,'2022-10-06 23:04:15','2022-10-07 02:56:43');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07  3:06:49
