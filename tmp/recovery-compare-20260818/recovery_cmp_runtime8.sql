-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: lcd_records
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `recovery_cmp_runtime8`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `recovery_cmp_runtime8` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `recovery_cmp_runtime8`;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(80) NOT NULL,
  `entity_type` varchar(80) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_audit_logs_user` (`user_id`),
  CONSTRAINT `fk_audit_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,35,'login','user',35,'User signed in.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 01:17:20'),(2,35,'record_attachment_upload','record',1,'Uploaded attachment A-0000-2026.pdf while creating record L-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 01:29:48'),(3,35,'record_create','record',1,'Created record L-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 01:29:48'),(4,1,'logout','user',1,'User signed out.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:21:20'),(5,2,'login','user',2,'User signed in.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:21:35'),(6,35,'record_attachments_combined_view','record',1,'Opened the combined attachment viewer for record L-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:29:42'),(7,35,'record_attachment_view','record',1,'Opened attachment A-0000-2026.pdf for record #1.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:29:43'),(8,35,'record_update','record',1,'Updated record L-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:30:58'),(9,35,'record_attachments_combined_view','record',1,'Opened the combined attachment viewer for record L-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:31:04'),(10,35,'record_attachment_view','record',1,'Opened attachment A-0000-2026.pdf for record #1.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:31:06'),(11,35,'record_attachment_upload','record',2,'Uploaded attachment A-0000-2026.pdf while creating record A-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:33:47'),(12,35,'record_create','record',2,'Created record A-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:33:47'),(13,35,'record_attachment_upload','record',3,'Uploaded attachment A-00001-2026.pdf while creating record A-00001-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:38:52'),(14,35,'record_create','record',3,'Created record A-00001-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:38:52'),(15,35,'record_attachment_upload','record',4,'Uploaded attachment A-00002-2026.pdf while creating record A-00002-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:40:48'),(16,35,'record_create','record',4,'Created record A-00002-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:40:48'),(17,1,'login','user',1,'User signed in.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:56:42'),(18,1,'record_attachments_combined_view','record',4,'Opened the combined attachment viewer for record A-00002-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:59:14'),(19,1,'record_attachment_view','record',4,'Opened attachment A-00002-2026.pdf for record #4.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 02:59:14'),(20,1,'administrative_document_action','record',4,'Acted on Administrative Document and notified the Admin Receiving Section.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:00:31'),(21,1,'record_update','record',1,'Updated record L-00000-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:01:04'),(22,1,'administrative_document_action','record',2,'Acted on Administrative Document and notified the Admin Receiving Section.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:03:34'),(23,1,'record_attachments_combined_view','record',3,'Opened the combined attachment viewer for record A-00001-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:03:55'),(24,1,'record_attachment_view','record',3,'Opened attachment A-00001-2026.pdf for record #3.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:03:55'),(25,1,'administrative_document_action','record',3,'Acted on Administrative Document and notified the Admin Receiving Section.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:04:35'),(26,35,'committee_referral_print_view','record',1,'Opened printable Committee Referral L-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:06:42'),(27,35,'record_attachment_upload','record',5,'Uploaded attachment L-00001-2026.pdf while creating record L-00001-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:14:11'),(28,35,'record_create','record',5,'Created record L-00001-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:14:11'),(29,35,'record_attachments_combined_view','record',5,'Opened the combined attachment viewer for record L-00001-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:28:23'),(30,35,'record_attachment_view','record',5,'Opened attachment L-00001-2026.pdf for record #5.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:28:23'),(31,1,'record_status_update','record',5,'Updated record status from For Plenary Session to For Plenary Session.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:28:58'),(32,35,'logout','user',35,'User signed out.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:29:39'),(33,1,'plenary_number_update','record',5,'Updated proposed ordinance/resolution number for L-00001-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:30:30'),(34,35,'login','user',35,'User signed in.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 03:59:29'),(35,35,'record_attachments_combined_view','record',4,'Opened the combined attachment viewer for record A-00002-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 04:03:59'),(36,35,'record_attachment_view','record',4,'Opened attachment A-00002-2026.pdf for record #4.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 04:03:59'),(37,35,'record_attachment_upload','record',6,'Uploaded attachment L-000002-2026.pdf while creating record L-00002-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 04:17:49'),(38,35,'record_create','record',6,'Created record L-00002-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 04:17:49'),(39,35,'record_attachments_combined_view','record',4,'Opened the combined attachment viewer for record A-00002-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 05:43:44'),(40,35,'record_attachment_view','record',4,'Opened attachment A-00002-2026.pdf for record #4.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 05:43:46'),(41,35,'record_attachments_combined_view','record',2,'Opened the combined attachment viewer for record A-00000-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 05:49:47'),(42,35,'record_attachment_view','record',2,'Opened attachment A-0000-2026.pdf for record #2.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 05:49:47'),(43,35,'committee_referral_printed','record',1,'Marked Committee Referral as printed and forwarded.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:06:43'),(44,1,'login','user',1,'User signed in.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:08:48'),(45,1,'record_attachments_combined_view','record',6,'Opened the combined attachment viewer for record L-00002-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:09:26'),(46,1,'record_attachment_view','record',6,'Opened attachment L-000002-2026.pdf for record #6.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:09:26'),(47,1,'division_chief_committee_assignment_update','user',7,'Updated committee assignments for Division Chief #7.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:11:38'),(48,1,'division_chief_committee_assignment_update','user',3,'Updated committee assignments for Division Chief #3.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:12:19'),(49,1,'record_update','record',6,'Updated record L-00002-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:12:34'),(50,35,'record_attachment_upload','record',7,'Uploaded attachment L-00003-2026.pdf while creating record L-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:17:32'),(51,35,'record_create','record',7,'Created record L-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:17:32'),(52,35,'committee_referral_print_view','record',6,'Opened printable Committee Referral L-00002-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:17:50'),(53,1,'record_update','record',7,'Updated record L-00003-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:24:37'),(54,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:25:28'),(55,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:25:28'),(56,2,'login','user',2,'User signed in.','192.168.128.143','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:26:29'),(57,35,'committee_referral_printed','record',6,'Marked Committee Referral as printed and forwarded.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:32:58'),(58,35,'committee_referral_print_view','record',7,'Opened printable Committee Referral L-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 06:33:18'),(59,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 07:04:39'),(60,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','192.168.128.116','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 07:04:39'),(61,27,'login','user',27,'User signed in.','192.168.138.206','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0','2026-08-10 07:11:20'),(62,27,'record_attachments_combined_view','record',1,'Opened the combined attachment viewer for record L-00000-2026.','192.168.138.206','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0','2026-08-10 07:12:39'),(63,27,'record_attachment_view','record',1,'Opened attachment A-0000-2026.pdf for record #1.','192.168.138.206','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0','2026-08-10 07:12:39'),(64,27,'committee_referral_print_view','record',1,'Opened printable Committee Referral L-00000-2026.','192.168.138.206','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0','2026-08-10 07:15:57'),(65,27,'logout','user',27,'User signed out.','192.168.138.206','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0','2026-08-10 07:28:47'),(66,35,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 07:32:09'),(67,35,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 07:32:09'),(68,35,'committee_referral_printed','record',7,'Marked Committee Referral as printed and forwarded.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 07:47:00'),(69,1,'login','user',1,'User signed in.','192.168.138.149','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 07:59:11'),(70,35,'committee_referral_print_view','record',7,'Opened printable Committee Referral L-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:00:33'),(71,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','192.168.128.174','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:08:18'),(72,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','192.168.128.174','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:08:18'),(73,1,'logout','user',1,'User signed out.','192.168.128.174','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:14:09'),(74,1,'login','user',1,'User signed in.','192.168.128.174','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:15:06'),(75,1,'user_update','user',1,'Updated user admin@example.com as City Secretary.','192.168.128.174','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:17:14'),(76,35,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:39:22'),(77,35,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:39:22'),(78,35,'record_attachment_upload','record',8,'Uploaded attachment A-00003-2026.pdf while creating record A-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:55:32'),(79,35,'record_create','record',8,'Created record A-00003-2026.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:55:32'),(80,35,'logout','user',35,'User signed out.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 08:59:21'),(81,1,'login','user',1,'User signed in.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:27:00'),(82,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:42:40'),(83,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:42:40'),(84,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:43:21'),(85,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:43:21'),(86,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:46:16'),(87,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:46:16'),(89,1,'login','user',1,'User signed in.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:48:19'),(90,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:48:30'),(91,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 09:48:30'),(92,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 10:37:22'),(93,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 10:37:22'),(94,1,'record_attachments_combined_view','record',7,'Opened the combined attachment viewer for record L-00003-2026.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 10:39:21'),(95,1,'record_attachment_view','record',7,'Opened attachment L-00003-2026.pdf for record #7.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-10 10:39:22'),(96,8,'login','user',8,'User signed in.','192.168.128.143','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:22:28'),(97,1,'login','user',1,'User signed in.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:23:10'),(98,1,'user_update','user',5,'Updated user kr.agamin@gmail.com as Administrator.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:23:36'),(99,1,'logout','user',1,'User signed out.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:23:38'),(100,5,'login','user',5,'User signed in.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:23:45'),(101,5,'communication_qr_print_view','record',6,'Opened QR reference print form for record L-00002-2026.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:24:17'),(102,35,'login','user',35,'User signed in.','192.168.128.127','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:24:47'),(103,1,'login','user',1,'User signed in.','127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:32:20'),(104,5,'record_attachments_combined_view','record',5,'Opened the combined attachment viewer for record L-00001-2026.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:35:02'),(105,5,'record_attachment_view','record',5,'Opened attachment L-00001-2026.pdf for record #5.','192.168.128.125','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:35:02'),(106,15,'login','user',15,'User signed in.','192.168.138.141','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36','2026-08-17 02:40:15');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_officials`
--

DROP TABLE IF EXISTS `city_officials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_officials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `position` enum('Vice Mayor','City Councilor') NOT NULL DEFAULT 'City Councilor',
  `officer_role` enum('Presiding Officer','Presiding Officer Pro-Tempore','Majority Floor Leader','Assistant Majority Floor Leader','Minority Floor Leader','Assistant Minority Floor Leader','SK Federation President','IPMR Representative','Association of Barangay Captain President') DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_city_officials_term` (`term_id`),
  CONSTRAINT `fk_city_officials_term` FOREIGN KEY (`term_id`) REFERENCES `committee_terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_officials`
--

LOCK TABLES `city_officials` WRITE;
/*!40000 ALTER TABLE `city_officials` DISABLE KEYS */;
INSERT INTO `city_officials` VALUES (2,2,'Jocelyn B. Rodriguez','Vice Mayor','Presiding Officer',0,'2026-06-19 13:51:01'),(3,2,'Edgar S. Cabanlas','City Councilor','Majority Floor Leader',0,'2026-06-19 13:51:26'),(4,2,'Agapito Eriberto G. Suan','City Councilor','Minority Floor Leader',0,'2026-06-19 13:52:07'),(5,2,'Roger G. Abaday','City Councilor','Presiding Officer Pro-Tempore',0,'2026-06-19 13:53:23'),(6,2,'Joyleen Mercedes L. Balaba','City Councilor','Assistant Majority Floor Leader',0,'2026-06-19 13:54:01'),(7,2,'Yevonna Yacine B. Emano','City Councilor','Assistant Minority Floor Leader',0,'2026-06-19 13:54:35'),(8,2,'Desiree Ann M. Dahino','City Councilor',NULL,0,'2026-06-19 13:55:00'),(9,2,'George Christopher Q. Goking','City Councilor',NULL,0,'2026-06-19 13:55:17'),(10,2,'Moreno Y. Daba IV','City Councilor',NULL,0,'2026-06-19 13:55:46'),(11,2,'Juancho R. Pascual','City Councilor',NULL,0,'2026-06-19 13:56:29'),(12,2,'Al P. Legaspi, Sr.','City Councilor',NULL,0,'2026-06-19 13:57:28'),(13,2,'lmee Rose P. Moreno','City Councilor',NULL,0,'2026-06-19 13:57:54'),(14,2,'Maximo T. Rodriguez Ill','City Councilor',NULL,0,'2026-06-19 13:58:11'),(15,2,'Paolo Nicolo Gaane','City Councilor',NULL,0,'2026-06-19 13:58:36'),(16,2,'Yan Lam S. Lim','City Councilor',NULL,0,'2026-06-19 13:59:02'),(17,2,'Enrico D. Salcedo','City Councilor',NULL,0,'2026-06-19 13:59:17'),(18,2,'Gilda O. Go','City Councilor',NULL,0,'2026-06-19 13:59:46'),(19,2,'Datu Roberto P. Cabaring','City Councilor','IPMR Representative',0,'2026-06-19 14:00:32'),(20,2,'Kenneth John D. Sacala','City Councilor','SK Federation President',0,'2026-06-19 14:00:50'),(21,2,'Marlo L. Tabac','City Councilor','Association of Barangay Captain President',0,'2026-06-19 14:01:01');
/*!40000 ALTER TABLE `city_officials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee_division_chiefs`
--

DROP TABLE IF EXISTS `committee_division_chiefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_division_chiefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_committee_division_chief` (`committee_id`,`user_id`),
  UNIQUE KEY `uq_committee_one_division_chief` (`committee_id`),
  KEY `fk_committee_division_chiefs_user` (`user_id`),
  KEY `fk_committee_division_chiefs_assigned_by` (`assigned_by`),
  CONSTRAINT `fk_committee_division_chiefs_assigned_by` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_committee_division_chiefs_committee` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_committee_division_chiefs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee_division_chiefs`
--

LOCK TABLES `committee_division_chiefs` WRITE;
/*!40000 ALTER TABLE `committee_division_chiefs` DISABLE KEYS */;
INSERT INTO `committee_division_chiefs` VALUES (144,32,7,1,'2026-08-10 06:11:38'),(145,30,7,1,'2026-08-10 06:11:38'),(146,8,7,1,'2026-08-10 06:11:38'),(147,11,7,1,'2026-08-10 06:11:38'),(148,12,7,1,'2026-08-10 06:11:38'),(149,19,7,1,'2026-08-10 06:11:38'),(150,20,7,1,'2026-08-10 06:11:38'),(151,22,7,1,'2026-08-10 06:11:38'),(152,27,7,1,'2026-08-10 06:11:38'),(153,6,3,1,'2026-08-10 06:12:19'),(154,7,3,1,'2026-08-10 06:12:19'),(155,31,3,1,'2026-08-10 06:12:19'),(156,33,3,1,'2026-08-10 06:12:19'),(157,10,3,1,'2026-08-10 06:12:19'),(158,9,3,1,'2026-08-10 06:12:19'),(159,13,3,1,'2026-08-10 06:12:19'),(160,14,3,1,'2026-08-10 06:12:19'),(161,15,3,1,'2026-08-10 06:12:19'),(162,16,3,1,'2026-08-10 06:12:19'),(163,17,3,1,'2026-08-10 06:12:19'),(164,18,3,1,'2026-08-10 06:12:19'),(165,21,3,1,'2026-08-10 06:12:19'),(166,23,3,1,'2026-08-10 06:12:19'),(167,24,3,1,'2026-08-10 06:12:19'),(168,25,3,1,'2026-08-10 06:12:19'),(169,26,3,1,'2026-08-10 06:12:19'),(170,28,3,1,'2026-08-10 06:12:19'),(171,29,3,1,'2026-08-10 06:12:19');
/*!40000 ALTER TABLE `committee_division_chiefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee_members`
--

DROP TABLE IF EXISTS `committee_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committee_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `position` enum('Chairperson','Vice Chairperson','Member') NOT NULL DEFAULT 'Member',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_committee_members_committee` (`committee_id`),
  KEY `fk_committee_members_term` (`term_id`),
  CONSTRAINT `fk_committee_members_committee` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_committee_members_term` FOREIGN KEY (`term_id`) REFERENCES `committee_terms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee_members`
--

LOCK TABLES `committee_members` WRITE;
/*!40000 ALTER TABLE `committee_members` DISABLE KEYS */;
INSERT INTO `committee_members` VALUES (21,32,2,'Al P. Legaspi, Sr.','Chairperson',1,'2026-06-19 14:39:44'),(22,32,2,'Desiree Ann M. Dahino','Vice Chairperson',2,'2026-06-19 14:39:44'),(23,32,2,'Enrico D. Salcedo','Member',3,'2026-06-19 14:39:44'),(24,32,2,'Agapito Eriberto G. Suan','Member',4,'2026-06-19 14:39:44'),(25,32,2,'Paolo Nicolo Gaane','Member',5,'2026-06-19 14:39:44'),(26,31,2,'Paolo Nicolo Gaane','Chairperson',1,'2026-06-19 14:42:05'),(27,31,2,'Moreno Y. Daba IV','Vice Chairperson',2,'2026-06-19 14:42:05'),(28,31,2,'Juancho R. Pascual','Member',3,'2026-06-19 14:42:05'),(29,31,2,'Kenneth John D. Sacala','Member',4,'2026-06-19 14:42:05'),(30,31,2,'Desiree Ann M. Dahino','Member',5,'2026-06-19 14:42:05'),(46,10,2,'Edgar S. Cabanlas','Chairperson',1,'2026-06-19 14:49:32'),(47,10,2,'Yan Lam S. Lim','Vice Chairperson',2,'2026-06-19 14:49:32'),(48,10,2,'Yevonna Yacine B. Emano','Member',3,'2026-06-19 14:49:32'),(49,10,2,'Gilda O. Go','Member',4,'2026-06-19 14:49:32'),(50,10,2,'Kenneth John D. Sacala','Member',5,'2026-06-19 14:49:32'),(71,13,2,'Yan Lam S. Lim','Chairperson',1,'2026-06-19 14:57:14'),(72,13,2,'Enrico D. Salcedo','Vice Chairperson',2,'2026-06-19 14:57:14'),(73,13,2,'Edgar S. Cabanlas','Member',3,'2026-06-19 14:57:14'),(74,13,2,'Desiree Ann M. Dahino','Member',4,'2026-06-19 14:57:14'),(75,13,2,'Juancho R. Pascual','Member',5,'2026-06-19 14:57:14'),(99,17,2,'Maximo T. Rodriguez Ill','Chairperson',1,'2026-06-19 15:02:04'),(100,17,2,'Kenneth John D. Sacala','Vice Chairperson',2,'2026-06-19 15:02:04'),(101,17,2,'Edgar S. Cabanlas','Member',3,'2026-06-19 15:02:04'),(102,17,2,'Enrico D. Salcedo','Member',4,'2026-06-19 15:02:04'),(103,17,2,'Desiree Ann M. Dahino','Member',5,'2026-06-19 15:02:04'),(174,7,2,'Marlo L. Tabac','Chairperson',1,'2026-07-14 06:47:36'),(175,7,2,'Kenneth John D. Sacala','Vice Chairperson',2,'2026-07-14 06:47:36'),(176,7,2,'Maximo T. Rodriguez Ill','Member',3,'2026-07-14 06:47:36'),(177,7,2,'Al P. Legaspi, Sr.','Member',4,'2026-07-14 06:47:36'),(178,7,2,'Paolo Nicolo Gaane','Member',5,'2026-07-14 06:47:36'),(186,6,2,'Juancho R. Pascual','Chairperson',1,'2026-07-16 02:15:55'),(187,6,2,'Desiree Ann M. Dahino','Vice Chairperson',2,'2026-07-16 02:15:55'),(188,6,2,'Paolo Nicolo Gaane','Member',3,'2026-07-16 02:15:55'),(189,6,2,'Moreno Y. Daba IV','Member',4,'2026-07-16 02:15:55'),(190,6,2,'George Christopher Q. Goking','Member',5,'2026-07-16 02:15:55'),(191,6,2,'Yevonna Yacine B. Emano','Member',6,'2026-07-16 02:15:55'),(192,30,2,'Maximo T. Rodriguez Ill','Chairperson',1,'2026-07-16 02:24:28'),(193,30,2,'George Christopher Q. Goking','Vice Chairperson',2,'2026-07-16 02:24:28'),(194,30,2,'Gilda O. Go','Member',3,'2026-07-16 02:24:28'),(195,30,2,'Yevonna Yacine B. Emano','Member',4,'2026-07-16 02:24:28'),(196,30,2,'Juancho R. Pascual','Member',5,'2026-07-16 02:24:28'),(197,8,2,'Gilda O. Go','Chairperson',1,'2026-07-16 02:25:17'),(198,8,2,'Desiree Ann M. Dahino','Vice Chairperson',2,'2026-07-16 02:25:17'),(199,8,2,'George Christopher Q. Goking','Member',3,'2026-07-16 02:25:17'),(200,8,2,'Al P. Legaspi, Sr.','Member',4,'2026-07-16 02:25:17'),(201,8,2,'Yevonna Yacine B. Emano','Member',5,'2026-07-16 02:25:17'),(202,33,2,'Datu Roberto P. Cabaring','Chairperson',1,'2026-07-16 02:29:15'),(203,33,2,'Joyleen Mercedes L. Balaba','Vice Chairperson',2,'2026-07-16 02:29:15'),(204,33,2,'Al P. Legaspi, Sr.','Member',3,'2026-07-16 02:29:15'),(205,33,2,'Roger G. Abaday','Member',4,'2026-07-16 02:29:15'),(206,33,2,'Juancho R. Pascual','Member',5,'2026-07-16 02:29:15'),(207,11,2,'Moreno Y. Daba IV','Chairperson',1,'2026-07-16 02:37:27'),(208,11,2,'Desiree Ann M. Dahino','Vice Chairperson',2,'2026-07-16 02:37:27'),(209,11,2,'Kenneth John D. Sacala','Member',3,'2026-07-16 02:37:27'),(210,11,2,'Juancho R. Pascual','Member',4,'2026-07-16 02:37:27'),(211,11,2,'Paolo Nicolo Gaane','Member',5,'2026-07-16 02:37:27'),(212,11,2,'George Christopher Q. Goking','Member',6,'2026-07-16 02:37:27'),(213,11,2,'Al P. Legaspi, Sr.','Member',7,'2026-07-16 02:37:27'),(214,12,2,'Enrico D. Salcedo','Chairperson',1,'2026-07-16 02:38:27'),(215,12,2,'Yan Lam S. Lim','Vice Chairperson',2,'2026-07-16 02:38:27'),(216,12,2,'Gilda O. Go','Member',3,'2026-07-16 02:38:27'),(217,12,2,'Paolo Nicolo Gaane','Member',4,'2026-07-16 02:38:27'),(218,12,2,'lmee Rose P. Moreno','Member',5,'2026-07-16 02:38:27'),(219,12,2,'Al P. Legaspi, Sr.','Member',6,'2026-07-16 02:38:27'),(220,12,2,'Roger G. Abaday','Member',7,'2026-07-16 02:38:27'),(221,9,2,'Edgar S. Cabanlas','Chairperson',1,'2026-07-16 02:39:22'),(222,9,2,'Roger G. Abaday','Vice Chairperson',2,'2026-07-16 02:39:22'),(223,9,2,'Maximo T. Rodriguez Ill','Member',3,'2026-07-16 02:39:22'),(224,9,2,'Moreno Y. Daba IV','Member',4,'2026-07-16 02:39:22'),(225,9,2,'Al P. Legaspi, Sr.','Member',5,'2026-07-16 02:39:22'),(226,9,2,'Agapito Eriberto G. Suan','Member',6,'2026-07-16 02:39:22'),(227,9,2,'Kenneth John D. Sacala','Member',7,'2026-07-16 02:39:22'),(228,14,2,'Moreno Y. Daba IV','Chairperson',1,'2026-07-16 03:23:46'),(229,14,2,'Al P. Legaspi, Sr.','Vice Chairperson',2,'2026-07-16 03:23:46'),(230,14,2,'Enrico D. Salcedo','Member',3,'2026-07-16 03:23:46'),(231,14,2,'Paolo Nicolo Gaane','Member',4,'2026-07-16 03:23:46'),(232,14,2,'Gilda O. Go','Member',5,'2026-07-16 03:23:46'),(233,14,2,'Juancho R. Pascual','Member',6,'2026-07-16 03:23:46'),(234,14,2,'Kenneth John D. Sacala','Member',7,'2026-07-16 03:23:46'),(235,15,2,'Paolo Nicolo Gaane','Chairperson',1,'2026-07-16 03:24:31'),(236,15,2,'Edgar S. Cabanlas','Vice Chairperson',2,'2026-07-16 03:24:31'),(237,15,2,'Yan Lam S. Lim','Member',3,'2026-07-16 03:24:31'),(238,15,2,'Moreno Y. Daba IV','Member',4,'2026-07-16 03:24:31'),(239,15,2,'George Christopher Q. Goking','Member',5,'2026-07-16 03:24:31'),(240,16,2,'Edgar S. Cabanlas','Chairperson',1,'2026-07-16 03:24:50'),(241,16,2,'Yan Lam S. Lim','Vice Chairperson',2,'2026-07-16 03:24:50'),(242,16,2,'Juancho R. Pascual','Member',3,'2026-07-16 03:24:50'),(243,16,2,'Joyleen Mercedes L. Balaba','Member',4,'2026-07-16 03:24:50'),(244,16,2,'George Christopher Q. Goking','Member',5,'2026-07-16 03:24:50'),(245,18,2,'Roger G. Abaday','Chairperson',1,'2026-07-16 03:35:34'),(246,18,2,'Al P. Legaspi, Sr.','Vice Chairperson',2,'2026-07-16 03:35:34'),(247,18,2,'Edgar S. Cabanlas','Member',3,'2026-07-16 03:35:34'),(248,18,2,'Enrico D. Salcedo','Member',4,'2026-07-16 03:35:34'),(249,18,2,'Yevonna Yacine B. Emano','Member',5,'2026-07-16 03:35:34'),(250,19,2,'Enrico D. Salcedo','Chairperson',1,'2026-07-16 03:39:22'),(251,19,2,'Roger G. Abaday','Vice Chairperson',2,'2026-07-16 03:39:22'),(252,19,2,'Maximo T. Rodriguez Ill','Member',3,'2026-07-16 03:39:22'),(253,19,2,'George Christopher Q. Goking','Member',4,'2026-07-16 03:39:22'),(254,19,2,'Yevonna Yacine B. Emano','Member',5,'2026-07-16 03:39:22'),(255,19,2,'Moreno Y. Daba IV','Member',6,'2026-07-16 03:39:22'),(256,20,2,'Al P. Legaspi, Sr.','Chairperson',1,'2026-07-16 03:40:35'),(257,20,2,'Enrico D. Salcedo','Vice Chairperson',2,'2026-07-16 03:40:35'),(258,20,2,'Kenneth John D. Sacala','Member',3,'2026-07-16 03:40:35'),(259,20,2,'lmee Rose P. Moreno','Member',4,'2026-07-16 03:40:35'),(260,20,2,'Joyleen Mercedes L. Balaba','Member',5,'2026-07-16 03:40:35'),(261,21,2,'Gilda O. Go','Chairperson',1,'2026-07-16 03:42:07'),(262,21,2,'Roger G. Abaday','Vice Chairperson',2,'2026-07-16 03:42:07'),(263,21,2,'George Christopher Q. Goking','Member',3,'2026-07-16 03:42:07'),(264,21,2,'Al P. Legaspi, Sr.','Member',4,'2026-07-16 03:42:07'),(265,21,2,'Maximo T. Rodriguez Ill','Member',5,'2026-07-16 03:42:07'),(266,22,2,'Maximo T. Rodriguez Ill','Chairperson',1,'2026-07-16 03:43:02'),(267,22,2,'Paolo Nicolo Gaane','Vice Chairperson',2,'2026-07-16 03:43:02'),(268,22,2,'Gilda O. Go','Member',3,'2026-07-16 03:43:02'),(269,22,2,'Juancho R. Pascual','Member',4,'2026-07-16 03:43:02'),(270,22,2,'lmee Rose P. Moreno','Member',5,'2026-07-16 03:43:02'),(271,22,2,'Moreno Y. Daba IV','Member',6,'2026-07-16 03:43:02'),(272,23,2,'Kenneth John D. Sacala','Chairperson',1,'2026-07-16 03:43:48'),(273,23,2,'Roger G. Abaday','Vice Chairperson',2,'2026-07-16 03:43:48'),(274,23,2,'Edgar S. Cabanlas','Member',3,'2026-07-16 03:43:48'),(275,23,2,'Yevonna Yacine B. Emano','Member',4,'2026-07-16 03:43:48'),(276,23,2,'Agapito Eriberto G. Suan','Member',5,'2026-07-16 03:43:48'),(277,23,2,'Paolo Nicolo Gaane','Member',6,'2026-07-16 03:43:48'),(278,23,2,'Moreno Y. Daba IV','Member',7,'2026-07-16 03:43:48'),(284,24,2,'Edgar S. Cabanlas','Chairperson',1,'2026-07-16 03:46:19'),(285,24,2,'George Christopher Q. Goking','Vice Chairperson',2,'2026-07-16 03:46:19'),(286,24,2,'Yan Lam S. Lim','Member',3,'2026-07-16 03:46:19'),(287,24,2,'Joyleen Mercedes L. Balaba','Member',4,'2026-07-16 03:46:19'),(288,24,2,'Kenneth John D. Sacala','Member',5,'2026-07-16 03:46:19'),(289,25,2,'Joyleen Mercedes L. Balaba','Chairperson',1,'2026-07-16 03:51:06'),(290,25,2,'Juancho R. Pascual','Vice Chairperson',2,'2026-07-16 03:51:06'),(291,25,2,'Gilda O. Go','Member',3,'2026-07-16 03:51:06'),(292,25,2,'Paolo Nicolo Gaane','Member',4,'2026-07-16 03:51:06'),(293,25,2,'Yan Lam S. Lim','Member',5,'2026-07-16 03:51:06'),(294,26,2,'George Christopher Q. Goking','Chairperson',1,'2026-07-16 03:51:55'),(295,26,2,'Moreno Y. Daba IV','Vice Chairperson',2,'2026-07-16 03:51:55'),(296,26,2,'Yevonna Yacine B. Emano','Member',3,'2026-07-16 03:51:55'),(297,26,2,'Desiree Ann M. Dahino','Member',4,'2026-07-16 03:51:55'),(298,26,2,'Paolo Nicolo Gaane','Member',5,'2026-07-16 03:51:55'),(299,27,2,'Al P. Legaspi, Sr.','Chairperson',1,'2026-07-16 03:52:32'),(300,27,2,'Juancho R. Pascual','Vice Chairperson',2,'2026-07-16 03:52:32'),(301,27,2,'Roger G. Abaday','Member',3,'2026-07-16 03:52:32'),(302,27,2,'Paolo Nicolo Gaane','Member',4,'2026-07-16 03:52:32'),(303,27,2,'lmee Rose P. Moreno','Member',5,'2026-07-16 03:52:32'),(304,28,2,'Yan Lam S. Lim','Chairperson',1,'2026-07-16 03:53:05'),(305,28,2,'Desiree Ann M. Dahino','Vice Chairperson',2,'2026-07-16 03:53:05'),(306,28,2,'George Christopher Q. Goking','Member',3,'2026-07-16 03:53:05'),(307,28,2,'Gilda O. Go','Member',4,'2026-07-16 03:53:05'),(308,28,2,'Moreno Y. Daba IV','Member',5,'2026-07-16 03:53:05'),(314,29,2,'Desiree Ann M. Dahino','Chairperson',1,'2026-07-16 03:54:41'),(315,29,2,'Gilda O. Go','Vice Chairperson',2,'2026-07-16 03:54:41'),(316,29,2,'George Christopher Q. Goking','Member',3,'2026-07-16 03:54:41'),(317,29,2,'Agapito Eriberto G. Suan','Member',4,'2026-07-16 03:54:41'),(318,29,2,'Joyleen Mercedes L. Balaba','Member',5,'2026-07-16 03:54:41');
/*!40000 ALTER TABLE `committee_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee_report_numbers`
--

DROP TABLE IF EXISTS `committee_report_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_report_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `committee_id` int(11) NOT NULL,
  `report_year` int(11) NOT NULL,
  `sequence_no` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_committee_report_record` (`record_id`,`committee_id`,`report_year`),
  KEY `idx_committee_report_counter` (`committee_id`,`report_year`,`sequence_no`),
  CONSTRAINT `fk_committee_report_committee` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_committee_report_record` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee_report_numbers`
--

LOCK TABLES `committee_report_numbers` WRITE;
/*!40000 ALTER TABLE `committee_report_numbers` DISABLE KEYS */;
INSERT INTO `committee_report_numbers` VALUES (1,1,7,2026,1,'2026-08-10 03:06:42'),(2,6,31,2026,1,'2026-08-10 06:17:50'),(3,7,24,2026,1,'2026-08-10 06:33:18');
/*!40000 ALTER TABLE `committee_report_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee_secretariats`
--

DROP TABLE IF EXISTS `committee_secretariats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_secretariats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_committee_secretariat` (`committee_id`,`user_id`),
  KEY `fk_committee_secretariats_user` (`user_id`),
  KEY `fk_committee_secretariats_assigned_by` (`assigned_by`),
  CONSTRAINT `fk_committee_secretariats_assigned_by` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_committee_secretariats_committee` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_committee_secretariats_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee_secretariats`
--

LOCK TABLES `committee_secretariats` WRITE;
/*!40000 ALTER TABLE `committee_secretariats` DISABLE KEYS */;
INSERT INTO `committee_secretariats` VALUES (39,23,13,8,'2026-07-14 03:39:13'),(61,31,13,1,'2026-07-14 07:40:16'),(62,31,22,1,'2026-07-14 07:40:16'),(77,7,10,8,'2026-07-15 07:24:02'),(78,7,12,8,'2026-07-15 07:24:02'),(79,7,24,8,'2026-07-15 07:24:02'),(80,7,27,8,'2026-07-15 07:24:02'),(81,7,22,8,'2026-07-15 07:24:02'),(82,33,10,8,'2026-07-15 07:24:26'),(83,33,12,8,'2026-07-15 07:24:26'),(84,33,24,8,'2026-07-15 07:24:26'),(85,33,27,8,'2026-07-15 07:24:26'),(86,33,22,8,'2026-07-15 07:24:26'),(87,14,10,8,'2026-07-15 07:24:58'),(88,14,12,8,'2026-07-15 07:24:58'),(89,14,24,8,'2026-07-15 07:24:58'),(90,14,27,8,'2026-07-15 07:24:58'),(91,26,11,8,'2026-07-15 07:25:16'),(92,26,13,8,'2026-07-15 07:25:16'),(93,28,11,8,'2026-07-15 07:25:33'),(94,28,12,8,'2026-07-15 07:25:33'),(95,28,13,8,'2026-07-15 07:25:33'),(96,29,11,8,'2026-07-15 07:25:49'),(97,29,12,8,'2026-07-15 07:25:49'),(98,29,13,8,'2026-07-15 07:25:49'),(99,8,12,8,'2026-07-15 07:26:14'),(100,8,24,8,'2026-07-15 07:26:14'),(101,8,27,8,'2026-07-15 07:26:14'),(102,8,22,8,'2026-07-15 07:26:14'),(103,6,10,8,'2026-07-15 07:26:23'),(104,6,12,8,'2026-07-15 07:26:23'),(105,6,24,8,'2026-07-15 07:26:23'),(106,6,27,8,'2026-07-15 07:26:23'),(107,6,22,8,'2026-07-15 07:26:23'),(108,17,12,8,'2026-07-15 07:39:44'),(109,17,24,8,'2026-07-15 07:39:44'),(110,17,27,8,'2026-07-15 07:39:44'),(111,18,12,8,'2026-07-15 07:40:40'),(112,18,24,8,'2026-07-15 07:40:40'),(113,18,27,8,'2026-07-15 07:40:40'),(114,21,12,8,'2026-07-15 07:40:52'),(115,21,24,8,'2026-07-15 07:40:52'),(116,21,27,8,'2026-07-15 07:40:52'),(117,10,13,8,'2026-07-15 07:41:29'),(118,10,4,8,'2026-07-15 07:41:29'),(119,10,26,8,'2026-07-15 07:41:29'),(120,9,13,8,'2026-07-15 07:41:49'),(121,9,4,8,'2026-07-15 07:41:49'),(122,9,26,8,'2026-07-15 07:41:49'),(126,15,13,8,'2026-07-15 07:42:24'),(127,15,4,8,'2026-07-15 07:42:24'),(128,15,26,8,'2026-07-15 07:42:24'),(129,24,13,8,'2026-07-15 07:42:38'),(130,24,4,8,'2026-07-15 07:42:38'),(131,24,22,8,'2026-07-15 07:42:38'),(135,32,28,8,'2026-07-15 07:52:02'),(136,32,25,8,'2026-07-15 07:52:02'),(137,32,22,8,'2026-07-15 07:52:02'),(138,27,17,8,'2026-07-15 07:52:34'),(139,27,28,8,'2026-07-15 07:52:34'),(140,25,28,8,'2026-07-15 07:52:58'),(141,25,6,8,'2026-07-15 07:52:58'),(142,11,16,8,'2026-07-15 07:57:54'),(143,11,29,8,'2026-07-15 07:57:54'),(144,30,25,8,'2026-07-15 07:58:16'),(145,30,29,8,'2026-07-15 07:58:16'),(146,30,22,8,'2026-07-15 07:58:16'),(147,12,6,8,'2026-07-15 08:00:31'),(148,12,30,8,'2026-07-15 08:00:31'),(149,22,30,8,'2026-07-15 08:00:56'),(150,22,18,8,'2026-07-15 08:00:56'),(151,20,16,8,'2026-07-15 08:01:50'),(152,20,17,8,'2026-07-15 08:01:50'),(153,19,16,8,'2026-07-15 08:02:18'),(154,19,18,8,'2026-07-15 08:02:18'),(155,13,13,8,'2026-07-30 08:46:52'),(156,13,4,8,'2026-07-30 08:46:52'),(157,13,22,8,'2026-07-30 08:46:52'),(158,13,26,8,'2026-07-30 08:46:52'),(159,16,4,1,'2026-07-31 02:06:11'),(160,16,15,1,'2026-07-31 02:06:11'),(161,16,22,1,'2026-07-31 02:06:11'),(162,16,26,1,'2026-07-31 02:06:11');
/*!40000 ALTER TABLE `committee_secretariats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committee_terms`
--

DROP TABLE IF EXISTS `committee_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `start_year` year(4) NOT NULL,
  `end_year` year(4) NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee_terms`
--

LOCK TABLES `committee_terms` WRITE;
/*!40000 ALTER TABLE `committee_terms` DISABLE KEYS */;
INSERT INTO `committee_terms` VALUES (2,'21st Sangguniang Panlungsod',2025,2028,1,'2026-06-19 10:25:33'),(3,'22nd Sangguniang Panlungsod',2028,2031,0,'2026-06-19 21:08:16');
/*!40000 ALTER TABLE `committee_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `committees`
--

DROP TABLE IF EXISTS `committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `committee_code` varchar(20) DEFAULT NULL,
  `chairperson` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committees`
--

LOCK TABLES `committees` WRITE;
/*!40000 ALTER TABLE `committees` DISABLE KEYS */;
INSERT INTO `committees` VALUES (6,'Agriculture, Fisheries & Aquatic Resources','AGR','Juancho R. Pascual','','2026-06-19 14:09:36'),(7,'Barangay Affairs','BAR','Marlo L. Tabac','','2026-06-19 14:12:28'),(8,'Cooperative, Labor & Employment','CLE','Gilda O. Go','','2026-06-19 14:26:56'),(9,'Ethics & Blue Ribbon','ETH','Edgar S. Cabanlas','','2026-06-19 14:27:07'),(10,'Economic Enterprises','ECOE','Edgar S. Cabanlas','','2026-06-19 14:27:15'),(11,'Education','EDU','Moreno Y. Daba IV','','2026-06-19 14:27:30'),(12,'Environment','ENV','Enrico D. Salcedo','','2026-06-19 14:27:39'),(13,'Finance, Budget & Appropriations','FBA','Yan Lam S. Lim','','2026-06-19 14:28:15'),(14,'Games & Amusement','GAM','Moreno Y. Daba IV','','2026-06-19 14:28:23'),(15,'Health, Nutrition & Health Insurance','HNH','Paolo Nicolo Gaane','','2026-06-19 14:28:32'),(16,'Laws and Rules','LAR','Edgar S. Cabanlas','','2026-06-19 14:28:40'),(17,'Planning, Research & Innovation and People\'s Organization Accreditation','PRI','Maximo T. Rodriguez Ill','','2026-06-19 14:28:58'),(18,'Public Order and Safety','POS','Roger G. Abaday','','2026-06-19 14:29:06'),(19,'Public Utilities (Roads &Traffic Management and Energy}','PUT','Enrico D. Salcedo','','2026-06-19 14:29:48'),(20,'Public Works','PWK','Al P. Legaspi, Sr.','','2026-06-19 14:30:00'),(21,'Senior Citizens','SCN','Gilda O. Go','','2026-06-19 14:30:08'),(22,'Social Services','SOC','Maximo T. Rodriguez Ill','','2026-06-19 14:30:16'),(23,'Sports & Youth Development','SYD','Kenneth John D. Sacala','','2026-06-19 14:30:43'),(24,'Subdivision, Housing, Development & Landed Estate','SHL','Edgar S. Cabanlas','','2026-06-19 14:31:36'),(25,'Tourism & Sister City Relation','TSR','Joyleen Mercedes L. Balaba','','2026-06-19 14:32:11'),(26,'Trade & Commerce','TAC','George Christopher Q. Goking','','2026-06-19 14:33:14'),(27,'Urban & Rural Poor','URP','Al P. Legaspi, Sr.','','2026-06-19 14:33:26'),(28,'Ways & Means','WAM','Yan Lam S. Lim','','2026-06-19 14:33:42'),(29,'Women and Family Relations','WFR','Desiree Ann M. Dahino','','2026-06-19 14:34:01'),(30,'Consumer Protection','CON','Maximo T. Rodriguez Ill','','2026-06-19 14:34:10'),(31,'Climate Change Adaptation & Mitigation and Disaster Risk Reduction','CCA','Paolo Nicolo Gaane','','2026-06-19 14:34:47'),(32,'Arbitration of Barangay Boundary Disputes','ABD','Al P. Legaspi, Sr.','','2026-06-19 14:36:21'),(33,'Cultural Communities','CUL','Datu Roberto P. Cabaring','','2026-06-19 14:36:44');
/*!40000 ALTER TABLE `committees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division_chief_secretariats`
--

DROP TABLE IF EXISTS `division_chief_secretariats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division_chief_secretariats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division_chief_user_id` int(11) NOT NULL,
  `secretariat_user_id` int(11) NOT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_division_chief_secretariat` (`division_chief_user_id`,`secretariat_user_id`),
  KEY `fk_division_chief_secretariats_secretariat` (`secretariat_user_id`),
  KEY `fk_division_chief_secretariats_assigned_by` (`assigned_by`),
  CONSTRAINT `fk_division_chief_secretariats_assigned_by` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_division_chief_secretariats_chief` FOREIGN KEY (`division_chief_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_division_chief_secretariats_secretariat` FOREIGN KEY (`secretariat_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division_chief_secretariats`
--

LOCK TABLES `division_chief_secretariats` WRITE;
/*!40000 ALTER TABLE `division_chief_secretariats` DISABLE KEYS */;
INSERT INTO `division_chief_secretariats` VALUES (8,7,6,1,'2026-06-19 11:49:35'),(13,3,4,1,'2026-07-14 07:38:57'),(14,3,22,1,'2026-07-14 07:38:57');
/*!40000 ALTER TABLE `division_chief_secretariats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_attachments`
--

DROP TABLE IF EXISTS `record_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `mime_type` varchar(120) NOT NULL,
  `file_size` int(11) NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_record_attachments_record` (`record_id`),
  KEY `fk_record_attachments_user` (`uploaded_by`),
  CONSTRAINT `fk_record_attachments_record` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_record_attachments_user` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_attachments`
--

LOCK TABLES `record_attachments` WRITE;
/*!40000 ALTER TABLE `record_attachments` DISABLE KEYS */;
INSERT INTO `record_attachments` VALUES (1,1,'A-0000-2026.pdf','1_0b367960e024aaf23ea40c1f9e7e8952.pdf','application/pdf',392459,35,'2026-08-10 01:29:48'),(2,2,'A-0000-2026.pdf','2_59f3f00041fc096628adbc447215f672.pdf','application/pdf',268347,35,'2026-08-10 02:33:47'),(3,3,'A-00001-2026.pdf','3_f176a8498c6ff6f38a6fbc47cf194362.pdf','application/pdf',245931,35,'2026-08-10 02:38:52'),(4,4,'A-00002-2026.pdf','4_d2b0b21a0f252952f989e27830e65067.pdf','application/pdf',375219,35,'2026-08-10 02:40:48'),(5,5,'L-00001-2026.pdf','5_7f129f4d1a463a9435003bcfce536042.pdf','application/pdf',281741,35,'2026-08-10 03:14:11'),(6,6,'L-000002-2026.pdf','6_0f46212666751ecf0538b38a5c147cd9.pdf','application/pdf',336296,35,'2026-08-10 04:17:49'),(7,7,'L-00003-2026.pdf','7_4ab3afcf8797d210d3ef0076ec78460c.pdf','application/pdf',356827,35,'2026-08-10 06:17:32'),(8,8,'A-00003-2026.pdf','8_ed3bbe62370a64836f6e7235bd878343.pdf','application/pdf',220797,35,'2026-08-10 08:55:32');
/*!40000 ALTER TABLE `record_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_committees`
--

DROP TABLE IF EXISTS `record_committees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_committees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `committee_id` int(11) NOT NULL,
  `sequence_no` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_record_committee` (`record_id`,`committee_id`),
  KEY `idx_record_committees_record` (`record_id`),
  KEY `idx_record_committees_committee` (`committee_id`),
  CONSTRAINT `fk_record_committees_committee` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_record_committees_record` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_committees`
--

LOCK TABLES `record_committees` WRITE;
/*!40000 ALTER TABLE `record_committees` DISABLE KEYS */;
INSERT INTO `record_committees` VALUES (24,1,7,1,'2026-08-10 03:01:04'),(26,6,31,1,'2026-08-10 06:12:34'),(28,7,24,1,'2026-08-10 06:24:37');
/*!40000 ALTER TABLE `record_committees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_division_receipts`
--

DROP TABLE IF EXISTS `record_division_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_division_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `division_name` varchar(160) NOT NULL,
  `received_by` int(11) DEFAULT NULL,
  `received_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_record_division_receipt` (`record_id`,`division_name`),
  KEY `idx_division_receipts_division` (`division_name`,`received_at`),
  KEY `fk_division_receipts_user` (`received_by`),
  CONSTRAINT `fk_division_receipts_record` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_division_receipts_user` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_division_receipts`
--

LOCK TABLES `record_division_receipts` WRITE;
/*!40000 ALTER TABLE `record_division_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_division_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_movements`
--

DROP TABLE IF EXISTS `record_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_movements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `from_status` varchar(80) DEFAULT NULL,
  `to_status` varchar(80) NOT NULL,
  `from_location` varchar(180) DEFAULT NULL,
  `to_location` varchar(180) NOT NULL,
  `notes` text DEFAULT NULL,
  `report_title` varchar(1000) DEFAULT NULL,
  `report_remarks` text DEFAULT NULL,
  `chief_remarks` text DEFAULT NULL,
  `chief_remarks_updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_movements_record` (`record_id`),
  KEY `fk_movements_user` (`updated_by`),
  CONSTRAINT `fk_movements_record` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_movements_user` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_movements`
--

LOCK TABLES `record_movements` WRITE;
/*!40000 ALTER TABLE `record_movements` DISABLE KEYS */;
INSERT INTO `record_movements` VALUES (1,1,NULL,'Received',NULL,'Committee Assignment','Record created.',NULL,NULL,NULL,NULL,35,'2026-08-10 01:29:47'),(2,2,NULL,'Received',NULL,'Legislative Committees Division','Record created.',NULL,NULL,NULL,NULL,35,'2026-08-10 02:33:47'),(3,3,NULL,'Received',NULL,'Legislative Committees Division','Record created.',NULL,NULL,NULL,NULL,35,'2026-08-10 02:38:52'),(4,4,NULL,'Received',NULL,'Legislative Committees Division','Record created.',NULL,NULL,NULL,NULL,35,'2026-08-10 02:40:48'),(5,4,'Received','Completed','Legislative Committees Division','Admin Receiving Section - Acted Upon','City Secretary action/instruction: Forward to Mr. Jun Dumaug: kindly act on this; same as before.',NULL,NULL,NULL,NULL,1,'2026-08-10 03:00:31'),(6,1,'Received','Pending to the Committee','Committee Assignment','Admin Receiving Section - For Printing','',NULL,NULL,NULL,NULL,1,'2026-08-10 03:01:04'),(7,2,'Received','Completed','Legislative Committees Division','Admin Receiving Section - Acted Upon','City Secretary action/instruction: To Admin. Division: For information dissemination to all employees/staff.',NULL,NULL,NULL,NULL,1,'2026-08-10 03:03:34'),(8,3,'Received','Completed','Legislative Committees Division','Admin Receiving Section - Acted Upon','City Secretary action/instruction: Furnish Mr. Gamos; For filing',NULL,NULL,NULL,NULL,1,'2026-08-10 03:04:35'),(9,1,'Pending to the Committee','Pending to the Committee','Admin Receiving Section - For Printing','Admin Receiving Section - For Printing','Committee Referral print timestamp generated.',NULL,NULL,NULL,NULL,35,'2026-08-10 03:06:42'),(10,5,NULL,'For Plenary Session',NULL,'City Secretary - For Plenary','Certified Urgent record created and routed directly for plenary session.',NULL,NULL,NULL,NULL,35,'2026-08-10 03:14:11'),(11,5,'For Plenary Session','For Plenary Session','City Secretary - For Plenary','City Secretary - For Plenary','Date: 2026-08-10\nNotes: For inclusion in the 48th Regular Session on August 10, 2026 as Urgent Measure',NULL,'For inclusion in the 48th Regular Session on August 10, 2026 as Urgent Measure',NULL,NULL,1,'2026-08-10 03:28:58'),(12,5,'For Plenary Session','For Plenary Session','City Secretary - For Plenary','City Secretary - For Plenary','Proposed Resolution Number: 2026-379',NULL,NULL,NULL,NULL,1,'2026-08-10 03:30:30'),(13,6,NULL,'Received',NULL,'Committee Assignment','Record created.',NULL,NULL,NULL,NULL,35,'2026-08-10 04:17:49'),(14,1,'Pending to the Committee','Pending to the Committee','Admin Receiving Section - For Printing','Division Chief / Committee Secretariat','Committee Referral printed and forwarded to the assigned committee.',NULL,NULL,NULL,NULL,35,'2026-08-10 06:06:43'),(15,6,'Received','Pending to the Committee','Committee Assignment','Admin Receiving Section - For Printing','',NULL,NULL,NULL,NULL,1,'2026-08-10 06:12:34'),(16,7,NULL,'Received',NULL,'Committee Assignment','Record created.',NULL,NULL,NULL,NULL,35,'2026-08-10 06:17:32'),(17,6,'Pending to the Committee','Pending to the Committee','Admin Receiving Section - For Printing','Admin Receiving Section - For Printing','Committee Referral print timestamp generated.',NULL,NULL,NULL,NULL,35,'2026-08-10 06:17:50'),(18,7,'Received','Pending to the Committee','Committee Assignment','Admin Receiving Section - For Printing','',NULL,NULL,NULL,NULL,1,'2026-08-10 06:24:37'),(19,6,'Pending to the Committee','Pending to the Committee','Admin Receiving Section - For Printing','Division Chief / Committee Secretariat','Committee Referral printed and forwarded to the assigned committee.',NULL,NULL,NULL,NULL,35,'2026-08-10 06:32:58'),(20,7,'Pending to the Committee','Pending to the Committee','Admin Receiving Section - For Printing','Admin Receiving Section - For Printing','Committee Referral print timestamp generated.',NULL,NULL,NULL,NULL,35,'2026-08-10 06:33:18'),(21,7,'Pending to the Committee','Pending to the Committee','Admin Receiving Section - For Printing','Division Chief / Committee Secretariat','Committee Referral printed and forwarded to the assigned committee.',NULL,NULL,NULL,NULL,35,'2026-08-10 07:47:00'),(22,8,NULL,'Received',NULL,'Legislative Committees Division','Record created.',NULL,NULL,NULL,NULL,35,'2026-08-10 08:55:32');
/*!40000 ALTER TABLE `record_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_recipients`
--

DROP TABLE IF EXISTS `record_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `title` varchar(80) DEFAULT NULL,
  `name` varchar(180) NOT NULL,
  `position` varchar(180) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `contact_number` varchar(80) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_record_recipients_record` (`record_id`),
  KEY `fk_record_recipients_created_by` (`created_by`),
  CONSTRAINT `fk_record_recipients_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_record_recipients_record` FOREIGN KEY (`record_id`) REFERENCES `records` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_recipients`
--

LOCK TABLES `record_recipients` WRITE;
/*!40000 ALTER TABLE `record_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_number` varchar(60) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `document_type` varchar(80) NOT NULL,
  `origin` varchar(180) NOT NULL,
  `client_name` varchar(180) DEFAULT NULL,
  `contact_number` varchar(80) DEFAULT NULL,
  `client_email` varchar(180) DEFAULT NULL,
  `committee_id` int(11) DEFAULT NULL,
  `assigned_user_id` int(11) DEFAULT NULL,
  `receiving_clerk_id` int(11) DEFAULT NULL,
  `priority` enum('Low','Normal','High','Urgent') NOT NULL DEFAULT 'Normal',
  `status` enum('Received','Assigned to the Committee','Pending to the Committee','For Meeting','For Inspection','Recommending Approval','Deferred','Tabled','Noted','Referred To','Referred Back to Committee','Perusal','Endorsement','For Plenary Session','Disapproved','Approved in the Plenary','For Vice Mayor''s Signature','Returned from The Vice Mayor','Forwarded for Admin/Mayor Signature','Returned from Admin/Mayor','Veto','Lapse into Ordinance','Forwarded to the Messengerial Services','For Transmittal','Others','Completed','Archived') NOT NULL DEFAULT 'Received',
  `received_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `current_location` varchar(180) NOT NULL DEFAULT 'Legislative Committees Division',
  `remarks` text DEFAULT NULL,
  `proposed_ordinance_number` varchar(80) DEFAULT NULL,
  `proposed_resolution_number` varchar(80) DEFAULT NULL,
  `approved_ordinance_number` varchar(80) DEFAULT NULL,
  `approved_resolution_number` varchar(80) DEFAULT NULL,
  `plenary_approved_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_records_control_number` (`control_number`),
  KEY `fk_records_committee` (`committee_id`),
  KEY `fk_records_assigned_user` (`assigned_user_id`),
  KEY `fk_records_receiving_clerk` (`receiving_clerk_id`),
  KEY `fk_records_created_by` (`created_by`),
  KEY `fk_records_updated_by` (`updated_by`),
  CONSTRAINT `fk_records_assigned_user` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_records_committee` FOREIGN KEY (`committee_id`) REFERENCES `committees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_records_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_records_receiving_clerk` FOREIGN KEY (`receiving_clerk_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_records_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,'L-00000-2026','BARANGAY ORDINANCE NO. 15-2026: \"AN ORDINANCE ENFORCING CURFEW HOURS AND PROHIBITNG THE USE, POSSESSION, AND INHALATION OF RUGBY AND OTHER VOLATILE SUBSTANCES AMONG MINORS, AND IMPOSING PENALTIES AND ACCOUNTABILITY ON PARENTS OR GUARDIANS FOR GROSS NEGLIGENCE OF THEIR CHILDREN WITHIN THE JURISDICTION OF BARANGAY MACABALAN','Committee Referrals','','BARANGAY MACABALAN','','',7,3,35,'Normal','Pending to the Committee','2026-08-10',NULL,'Division Chief / Committee Secretariat','',NULL,NULL,NULL,NULL,NULL,35,35,'2026-08-10 01:29:47','2026-08-10 06:06:43'),(2,'A-00000-2026','INVITATION TO SUPPORT AND VISIT THE KAHIMUAN REGIONAL TRADE FAIR 2026 ON AUGUST 25-31, 2026','Transmittals, Letters and Endorsements','CITY ADMIN/DTI-10',NULL,'','',NULL,NULL,35,'Normal','Completed','2026-08-10',NULL,'Admin Receiving Section - Acted Upon','To Admin. Division: For information dissemination to all employees/staff.',NULL,NULL,NULL,NULL,NULL,35,1,'2026-08-10 02:33:47','2026-08-10 03:03:34'),(3,'A-00001-2026','MA-2368-2026: PROVISION OF SERVICES','Memorandum, Executive Order, Directive Order and Etc.','CITY ADMIN',NULL,'','',NULL,NULL,35,'Normal','Completed','2026-08-10',NULL,'Admin Receiving Section - Acted Upon','Furnish Mr. Gamos; For filing',NULL,NULL,NULL,NULL,NULL,35,1,'2026-08-10 02:38:52','2026-08-10 03:04:35'),(4,'A-00002-2026','MM-1742-2026: AUTHORITY TO ALLOW ALL CASUAL OR JOB ORDER PERSONNEL TO RENDER EXTRA SERVICES','Memorandum, Executive Order, Directive Order and Etc.','CITY MAYOR OFFICE',NULL,'','',NULL,NULL,35,'Normal','Completed','2026-08-10',NULL,'Admin Receiving Section - Acted Upon','Forward to Mr. Jun Dumaug: kindly act on this; same as before.',NULL,NULL,NULL,NULL,NULL,35,1,'2026-08-10 02:40:48','2026-08-10 03:00:31'),(5,'L-00001-2026','SEEKING APPROVAL AND CONFIRMATION  OF THE DESIGNATED MEMBERS OF THE CITY COUNCIL TO SERVE AS CO-CHAIRPERSONS ACROSS THE CORE, MAJOR, AND MINOR EVENTS OF THE HIGALAAY FESTIVAL','Certified Urgent','CITY MAYOR OFFICE',NULL,'','',NULL,NULL,35,'Normal','For Plenary Session','2026-08-10',NULL,'City Secretary - For Plenary','Date: 2026-08-10\nNotes: For inclusion in the 48th Regular Session on August 10, 2026 as Urgent Measure',NULL,'2026-379',NULL,NULL,NULL,35,1,'2026-08-10 03:14:11','2026-08-10 03:30:30'),(6,'L-00002-2026','BARANGAY RESOLUTION NO. 007-2026: \"A RESOLUTION DECLARING PORTIONS OF BARANGAY SEVEN (7), THIS CITY, UNDER THE STATE OF CALAMITY DUE TO THE CONFLAGRATION THAT OCCURRED THEREAT LAST AUGUST 4, 2026','Committee Referrals','','BARANGAY 7','','',31,3,35,'Normal','Pending to the Committee','2026-08-10',NULL,'Division Chief / Committee Secretariat','',NULL,NULL,NULL,NULL,NULL,35,35,'2026-08-10 04:17:49','2026-08-10 06:32:58'),(7,'L-00003-2026','REQUEST FOR IMMEDIATE INVESTIGATION AND SITE INSPECTION OF ONGOING LAND DEVELOPMENT ADJACENT TO TERRY HILLS SUBDIVISION','Committee Referrals','','DIONNE P. GERSANA','','',24,3,35,'Normal','Pending to the Committee','2026-08-10',NULL,'Division Chief / Committee Secretariat','',NULL,NULL,NULL,NULL,NULL,35,35,'2026-08-10 06:17:32','2026-08-10 07:47:00'),(8,'A-00003-2026','REQUESTING THE REVIEW AND STRENGTHENING OF EXISTING REGULATIONS ON RESIDENTIAL NOISE, PARTICULARLY THE USE OF KARAOKE, SUBWOOFERS, AND OTHER AMPLIFIED SOUND SYSTEMS','Transmittals, Letters and Endorsements','OVM/MONSANTO',NULL,'','',NULL,NULL,35,'Normal','Received','2026-08-10',NULL,'Legislative Committees Division','',NULL,NULL,NULL,NULL,NULL,35,35,'2026-08-10 08:55:32','2026-08-10 08:55:32');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `nickname` varchar(80) DEFAULT NULL,
  `division_name` varchar(160) DEFAULT NULL,
  `email` varchar(160) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','city_secretary','division_chief','receiving_clerk','secretariat','division_staff','administrative_support','others','records_officer','staff') NOT NULL DEFAULT 'secretariat',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Arturo S. de San Miguel','Torks',NULL,'admin@example.com','$2y$10$W0DprJaU6K.t0f5GJ2kuA.ClrjnJTSb.Qb.0YuhYYhBv6eSW/kQe6','city_secretary',1,'2026-06-19 10:07:43'),(2,'Kathrina','KR','Administrative Support Division','records@example.com','$2y$10$sfPnZfN2GF1ylUyBa9xYAuWilqP4S0JnJ4t3YzdQXOI0SH7xab6YS','receiving_clerk',1,'2026-06-19 10:07:43'),(3,'Maria Carla','Carla','Legislative Committees Division','licayanmariacarla@gmail.com','$2y$10$kuygQxLSwrlNCwCCnhMPbe0AKeUuCB2bLWnmw1H5Rg05r/imbZRbG','division_chief',1,'2026-06-19 10:39:22'),(4,'Julie Ann F. Olavides','Lalai','Legislative Committees Division','jfolavides@gmail.com','$2y$10$kwLKNdAxW7FhLRSc4reyseuuulsb.0f9yIFUx8iIXASs7loNOsSXW','secretariat',1,'2026-06-19 10:39:22'),(5,'Kathrina Raiza','KR',NULL,'kr.agamin@gmail.com','$2y$10$ZXIeC5fSRnC59mbyrf7Sdu3zi3RgeYNt99x.DUB6uAgqI3BA3SliG','admin',1,'2026-06-19 10:43:46'),(6,'Gelie A. Paquino','Gel','Legislative Support Services Division','gelopez1863pacs@gmail.com','$2y$10$UuIuBj7/mZY/93xhHtwY9OIIf1k4I1Fjzo4mqw5HphWcss5N8IAVu','secretariat',1,'2026-06-19 11:22:01'),(7,'Eileen Josephine Borja','Eileen','Legislative Support Services Division','eileenborja184@gmail.com','$2y$10$DOwf2PmQepADd7fzzhhlp.0CbpbFJ1/bW6qdbf7sMyrlHak8H3WES','division_chief',1,'2026-06-19 11:22:34'),(8,'Danielle Katrina','Diane',NULL,'dkespra@gmail.com','$2y$10$I4KG4SyOIGvLR/V2fsnmMuEAMo6MIYcRw7LBx6XTH8abrikoNuJym','admin',1,'2026-07-13 05:46:34'),(9,'Sherwin Marc T. Sullano','Loloy','Administrative Support Division','sherwinsullano7@gmail.com','$2y$10$4pF1twAwSErpJATD9ZHqt.1Ai.9ePVFBO/1xFYWoVrZbkaKUyKDBO','administrative_support',1,'2026-07-14 02:12:49'),(10,'Albert Gil G. Arroyo','Gil','Legislative Committees Division','gilalbert88@gmail.com','$2y$10$xp/SdwRVC3vUBbnP37IB2.cNHARq2VltU9ncXyqK2WssCbz19A3dO','secretariat',1,'2026-07-14 02:25:53'),(11,'Carlene R. Figuracion','Carlene','Legislative Committees Division','clynfigx@gmail.com','$2y$10$.me6JFp/lC/R4qXC9l6nGu8g4yL5fZI1eXkLNE5Jk8MFJwm0IpDoe','secretariat',1,'2026-07-14 02:30:28'),(12,'Cheryl C. Amper','Cheryl','Legislative Committees Division','cherylamper1968@gmail.com','$2y$10$5cQUuxeUiWPvfDhkaWLnE.BwdGATlbQ2Qm3cSq98nzkOFrDou3WMa','secretariat',1,'2026-07-14 02:32:06'),(13,'Febbie Mae B. Echeveria','Febbie','Legislative Committees Division','febbiebernaldez123@gmail.com','$2y$10$fP2UEmCSeJY70xC6XxfvguprLRrWeWy4NLXj4Ao3PBaSxkoKqQJL.','secretariat',1,'2026-07-14 02:33:28'),(15,'Maria Carla L. Licayan','Carla','Legislative Committees Division','mcarla11@yahoo.com','$2y$10$WRCyIXTLgIhEz64mkqzfjO1xwkfGMkYkItoBEFx42kMgvjzP.7Zpi','secretariat',1,'2026-07-14 02:35:15'),(16,'Aevryllee Kathlyne G. Go','Kath','Legislative Support Services Division','kathgowork@gmail.com','$2y$10$UZWeoYx5lu0SXnh5gtiPk.Xq9Xdfq4qce5vS4ig7pHup1qu.387Em','secretariat',1,'2026-07-14 03:05:00'),(17,'Antonietto M. Casiño','Tony','Legislative Support Services Division','2nycasino73@gmail.com','$2y$10$5fLVqpXVyafZcxTzoEMFYudqZDTyFZsUIIaatry1349R0HYSxEg06','secretariat',1,'2026-07-14 03:12:55'),(18,'Richeto J. Pacheco','Chito','Legislative Support Services Division','chetorzdgreat@gmail.com','$2y$10$r5Vet3FOV1Dv69hgdPO0j.02YEKYAp63VomnIBeEiOWA6uUwiPi36','secretariat',1,'2026-07-14 03:14:25'),(19,'Jan Neri','Jan','Administrative Support Division','jancamo25@gmail.com','$2y$10$noNrfg5hqR2QR6eOoFpRCOYwCVqSwTdxiiRgbDAZ7wl77LAntcQsO','receiving_clerk',1,'2026-07-14 03:15:39'),(20,'Alec Sarmiento','Alec','Administrative Support Division','benj165hz@gmail.com','$2y$10$HEIj2bm5St22UM2iIPZIKONU9qd/uVNXMHPwHPCvD8PemzVbXmIbW','receiving_clerk',1,'2026-07-14 03:16:25'),(22,'Secretariat','Secretary','Legislative Committees Division','secretariat@example.com','$2y$10$aKiTIy5uNV7De/FeEK9zH.xooNrnFk95I2JtHN6DKIFMSF2HsqLba','secretariat',1,'2026-07-14 07:37:53'),(23,'Div Staff','Div','Legislative Support Services Division','divisionstaff@example.com','$2y$10$xeXEJ4Wf1qx56ZGmuGBy5.MyjrV7ujpv9KXpyIomOze6GYGD7u22q','division_staff',1,'2026-07-14 09:12:01'),(24,'Rotchie Mae E. Relos','Gigi','Legislative Committees Division','relosrotchiemae@gmail.com','$2y$10$ykBjLKzplEPIgL3pWbpsQeZ9PAV0z5HbgUQb9F89yR50xOVcHyjQa','secretariat',1,'2026-07-15 06:03:20'),(25,'Eucille Fe T. Faelnar','Eucille','Legislative Support Services Division','faelnareucillefe@gmail.com','$2y$10$fA23Gl6xmybv.Kp/IayqYOeat.LG8B1xFK2Q/QvLoYdjnO2EavhYC','secretariat',1,'2026-07-15 06:03:54'),(26,'Yvette Marie B. Bernabe','Yvette','Legislative Committees Division','ymbeja02@gmail.com','$2y$10$yczJ8tyge6dD/2oLoTMpAO/PeyWTbpsVrDo3fSDFUhxQ3U9kgNThi','secretariat',1,'2026-07-15 06:44:06'),(27,'Sandy C. Maghinay','Sandy','Legislative Committees Division','maghinaysandy@gmail.com','$2y$10$l3/8QjucVhsHLCeqguEwAOPGTYxjp0RTLrJRZC4NEmtZjwzOjFlhO','secretariat',1,'2026-07-15 06:50:50'),(28,'Caryl Isis B. Sumilia','Caryl','Legislative Support Services Division','scarylisis@gmail.com','$2y$10$rort3TD.U4DzljHp0T7BguXTY2ANT.6xJx1A4zNbzNE4NBOPzrQzy','secretariat',1,'2026-07-15 07:51:40'),(29,'Rhenlyne C. Rigayo','Rhen','Legislative Support Services Division','rhenlyne.cabaraban@gmail.com','$2y$10$ZifHD.Hn31XoHjrdIke30e27fvgpRJJHtrPfatCMvKI3nuTD20.TO','secretariat',1,'2026-07-15 07:57:27'),(30,'Joanna Lynn W. Bacarro','Joanna','Legislative Support Services Division','bjoanna0486@gmail.com','$2y$10$5qQwCBsns1e3.ovSFtlbDutomIisAm6la4REPtB9q898dd.PEDNxu','secretariat',1,'2026-07-15 08:00:14'),(31,'Retchie Agguirre','Retchie','Legislative Committees Division','retchieagguirre155@gmail.com','$2y$10$kPGpDpn6IZtVa8q/cCNLBeC8m1rc4IT.E5lzWjATNLyhznYcHzE7W','division_staff',1,'2026-07-15 08:04:17'),(32,'test','test','Legislative Committees Division','chief@example.com','$2y$10$YNN4EYjWMdc9IV84oPQKJu7zQvIsH3VH.w1fcN.DUhw.7vj87Uhju','division_chief',1,'2026-07-16 02:48:30'),(34,'kr','kr','Administrative Support Division','lmisrecords@example.com','$2y$10$zygcTfL6JYm/8v.O7ZFkUOUZYBank6FxrwRDCHl6G1HpF2B.kCLSa','administrative_support',1,'2026-07-27 10:34:56'),(35,'Justin Kyle Asne','Justin','Administrative Support Division','justinasnekyle@gmail.com','$2y$10$p1EBaS1yDP8761kWEwiNAOW6Vv9nVWGJeKwnPkNT99Ps.rOYa8R02','receiving_clerk',1,'2026-07-31 01:05:56'),(36,'Rhenlyne C. Rigayo','Rhen','Legislative Support Services Division','rhenkathlssd@gmail.com','$2y$10$YYNxuRrZ5jgallxVR0puLe3bDMSv8boQCmHvapeVpP70YTiQlD1WO','division_staff',1,'2026-07-31 05:16:19'),(37,'Aevryllee Kathlyne G. Go','Kath','Legislative Support Services Division','goaevrylleekathlyne@gmail.com','$2y$10$B2y9193fEyUlm0t.IwuAHOJnEeC35uDgSthx5tGzgCgJsjasve25.','division_staff',1,'2026-07-31 05:16:47'),(46,'Roderico Y. Dumaug, Jr.','Jun Dumaug','Administrative Support Division','ovmlegislative@gmail.com','$2y$10$7JZjKrVp..XZIceXPskB9ufgzWn/VmhTlZjo5GChwsgd08xbCi1MW','receiving_clerk',1,'2026-08-07 03:28:04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lcd_records'
--

--
-- Dumping routines for database 'lcd_records'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-17 10:50:46
