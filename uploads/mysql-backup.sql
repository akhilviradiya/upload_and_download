-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: oterri_verison-manager_local
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('20220907045927-create-role.js'),('20220907052845-create-user.js'),('20220907060726-add-columns-role.js'),('20220907060728-create-module-master.js'),('20220907060729-create-permission.js'),('20220907060730-add-columns-role.js'),('20220907060740-create-user_verification_links.js'),('20220907060745-add-columns-user.js'),('20220907060746-add-columns-user.js'),('20231205104720-create-audit-logs.js'),('20231205104730-create-audit-logs-details.js'),('20231205104740-add-columns-audit-logs-and-details.js'),('20231205104760-environment.js'),('20231205104770-app-version.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `isRequired` tinyint(1) NOT NULL DEFAULT '1',
  `platform` varchar(255) NOT NULL COMMENT '1-> Android, 2-> IOS',
  `appVersion` varchar(255) NOT NULL,
  `appUrl` varchar(255) NOT NULL,
  `baseUrl` varchar(255) NOT NULL,
  `communityUrl` varchar(255) DEFAULT NULL,
  `marketplaceUrl` varchar(255) DEFAULT NULL,
  `environmentId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `description` text,
  `status` int(11) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `createdBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `deletedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `environmentId` (`environmentId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  KEY `deletedBy` (`deletedBy`),
  CONSTRAINT `app_version_ibfk_1` FOREIGN KEY (`environmentId`) REFERENCES `environment` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `app_version_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `app_version_ibfk_3` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `app_version_ibfk_4` FOREIGN KEY (`deletedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
INSERT INTO `app_version` VALUES ('83c70b3b-06cd-4b8b-a5b3-97208ea1fae7',1,'1','2.0.10','https://play.google.com/store/apps/details?id=com.mksoterri.app&hl=en_IN','https://dev-v3.oterri.com','https://dev-api.marketplace.oterri.com/api/v1','https://dev-api.community.oterri.com/api/v1','409c29c0-e023-4688-a6d8-6d5eba4c08a2','',1,'2025-02-20 06:50:48','8c6bcbe1-1319-4606-bdf8-e297efe78280','2025-02-20 07:03:55','8c6bcbe1-1319-4606-bdf8-e297efe78280',NULL,NULL);
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_logs` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `operation` varchar(20) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `moduleId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `requestPath` varchar(255) DEFAULT NULL,
  `requestMethod` varchar(255) DEFAULT NULL,
  `responseStatus` int(11) DEFAULT NULL,
  `responseMessage` varchar(255) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `routerIpAddress` varchar(255) DEFAULT NULL,
  `localIpAddress` varchar(255) DEFAULT NULL,
  `deviceName` varchar(255) DEFAULT NULL,
  `operatingSystem` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `userAgent` text,
  `createdAt` datetime NOT NULL,
  `createdBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `moduleId` (`moduleId`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`moduleId`) REFERENCES `module_master` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `audit_logs_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs_details`
--

DROP TABLE IF EXISTS `audit_logs_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_logs_details` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `auditLogId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `documentId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `oldValues` text,
  `newValues` text,
  `affectedColumns` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auditLogId` (`auditLogId`),
  CONSTRAINT `audit_logs_details_ibfk_1` FOREIGN KEY (`auditLogId`) REFERENCES `audit_logs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs_details`
--

LOCK TABLES `audit_logs_details` WRITE;
/*!40000 ALTER TABLE `audit_logs_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment`
--

DROP TABLE IF EXISTS `environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environment` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `status` int(11) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `createdBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `deletedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  KEY `deletedBy` (`deletedBy`),
  CONSTRAINT `environment_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `environment_ibfk_2` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `environment_ibfk_3` FOREIGN KEY (`deletedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment`
--

LOCK TABLES `environment` WRITE;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` VALUES ('409c29c0-e023-4688-a6d8-6d5eba4c08a2','Oterri_Customer_App',NULL,1,'2025-02-20 06:49:49','8c6bcbe1-1319-4606-bdf8-e297efe78280','2025-02-20 06:49:49',NULL,NULL,NULL);
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_master`
--

DROP TABLE IF EXISTS `module_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_master` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1 for group, 2 for module, 3 for right',
  `description` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `parentId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `module_master_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `module_master` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `module_master_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `module_master_ibfk_3` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_master`
--

LOCK TABLES `module_master` WRITE;
/*!40000 ALTER TABLE `module_master` DISABLE KEYS */;
INSERT INTO `module_master` VALUES ('03c3c561-a254-4d8b-a3d3-6fba76c3e36e','Add','3','User Add','1','41a48d08-4d13-4cd8-bb74-3e383a2fbaf8','2022-09-06 17:34:46',NULL,'2022-09-06 17:34:46',NULL),('0a3773d3-5450-4f00-a7d0-adb3c1f51309','View','3','User - View','1','41a48d08-4d13-4cd8-bb74-3e383a2fbaf8','2022-09-06 17:36:15',NULL,'2023-12-27 13:00:47',NULL),('1d132fff-6bef-4126-be1a-c225a5caaad2','Add','3','Environment Android Add','1','681462d2-bde3-4a47-bd2e-96a1560fd3de','2025-02-19 15:48:58',NULL,'2025-02-19 15:48:58',NULL),('21aa2df3-43c1-4fad-aa9f-64536df8c291','Add','3','Environment Add','1','b19056a2-b632-47a5-874e-06c218ca7258','2025-02-19 15:47:44',NULL,'2025-02-19 15:47:44',NULL),('2f65ba39-3510-4d3a-8e11-d68e9485ca43','Edit','3','Environment Android Edit','1','681462d2-bde3-4a47-bd2e-96a1560fd3de','2025-02-19 15:49:08',NULL,'2025-02-19 15:49:08',NULL),('3566c134-44ce-4f5f-8ae5-df17b99a9be0','Reset Password','3','Reset Password User','1','41a48d08-4d13-4cd8-bb74-3e383a2fbaf8','2023-11-30 11:19:15',NULL,'2023-11-30 11:19:15',NULL),('41a48d08-4d13-4cd8-bb74-3e383a2fbaf8','User','2','User','1','5e1d0285-79b6-4d99-ade6-84cc9fbf32fb','2022-09-06 17:34:36',NULL,'2022-09-06 17:34:36',NULL),('48e5dd71-9c89-4214-b7a0-e6cc2e80429f','Edit','3','Environment Edit','1','b19056a2-b632-47a5-874e-06c218ca7258','2025-02-19 15:47:53',NULL,'2025-02-19 15:47:53',NULL),('5b9af182-1011-48a5-aeb7-fa0f00e80287','Delete','3','Environment Delete','1','b19056a2-b632-47a5-874e-06c218ca7258','2025-02-19 15:48:08',NULL,'2025-02-19 15:48:08',NULL),('5e1d0285-79b6-4d99-ade6-84cc9fbf32fb','Setup','1','Setup','1',NULL,'2022-09-06 17:26:40',NULL,'2022-09-06 17:26:40',NULL),('681462d2-bde3-4a47-bd2e-96a1560fd3de','Android','2','Environment Android','1','b19056a2-b632-47a5-874e-06c218ca7258','2025-02-19 15:48:34',NULL,'2025-02-19 15:48:34',NULL),('6b9af91f-9f0e-4cb8-8b6c-28ad44d0ceaa','Delete','3','Environment IOS Delete','1','c3fb2a32-85a3-456c-96d0-400dcd082db2','2025-02-19 15:49:49',NULL,'2025-02-19 15:49:49',NULL),('75e632bb-43c1-49c2-977b-268e387eefbd','Update Hierarchy','3','Role - Update Hierarchy','1','9d254493-df8f-4f4d-be22-8401433dfd25','2022-09-12 12:47:20',NULL,'2023-12-27 12:51:43',NULL),('7f9c9dbd-d520-4a19-a036-ae8b76bd7e6e','Assign Permission','3','Role - Assign Permission','1','9d254493-df8f-4f4d-be22-8401433dfd25','2022-09-12 12:47:05',NULL,'2022-09-12 12:47:05',NULL),('81c28771-7efc-4691-b10b-36d2b35eaf29','Delete','3','User Delete','1','41a48d08-4d13-4cd8-bb74-3e383a2fbaf8','2022-09-06 17:36:08',NULL,'2022-09-06 17:36:08',NULL),('9d254493-df8f-4f4d-be22-8401433dfd25','Role','2','Role','1','5e1d0285-79b6-4d99-ade6-84cc9fbf32fb','2022-09-06 17:26:40',NULL,'2022-09-06 17:26:40',NULL),('a518315f-c4fb-480c-b710-d9a320378c6a','Add','3','Role Add','1','9d254493-df8f-4f4d-be22-8401433dfd25','2022-09-06 17:27:14',NULL,'2022-09-06 17:27:14',NULL),('a715dcae-fb8e-4be3-9f34-98c0cc086676','Delete','3','Environment Android Delete','1','681462d2-bde3-4a47-bd2e-96a1560fd3de','2025-02-19 15:49:21',NULL,'2025-02-19 15:49:21',NULL),('a9fd76cb-7719-427a-9ab1-1aafc4fe982a','Edit','3','Environment IOS Edit','1','c3fb2a32-85a3-456c-96d0-400dcd082db2','2025-02-19 15:49:41',NULL,'2025-02-19 15:49:41',NULL),('b19056a2-b632-47a5-874e-06c218ca7258','Environment','1','Environment','1',NULL,'2025-02-19 15:40:20',NULL,'2025-02-19 15:40:20',NULL),('bc9c4a48-72bb-4ea5-bae2-c8af7c367e85','Edit','3','User Edit','1','41a48d08-4d13-4cd8-bb74-3e383a2fbaf8','2022-09-06 17:34:55',NULL,'2022-09-06 17:34:55',NULL),('c3fb2a32-85a3-456c-96d0-400dcd082db2','IOS','2','Environment IOS','1','b19056a2-b632-47a5-874e-06c218ca7258','2025-02-19 15:48:48',NULL,'2025-02-19 15:48:48',NULL),('c519611d-0e8a-4321-a9c9-57c4a0bc0c40','Mock Login','3','Mock Login User','1','41a48d08-4d13-4cd8-bb74-3e383a2fbaf8','2023-11-30 11:20:32',NULL,'2023-11-30 11:20:32',NULL),('d0896f7d-72e5-41dc-80bb-bcedf458b56d','Add','3','Environment IOS Add','1','c3fb2a32-85a3-456c-96d0-400dcd082db2','2025-02-19 15:49:31',NULL,'2025-02-19 15:49:31',NULL),('d96fa055-1261-46c9-b58c-e35adcf4da1a','Edit','3','Role Edit','1','9d254493-df8f-4f4d-be22-8401433dfd25','2022-09-06 17:34:10',NULL,'2022-09-06 17:34:10',NULL),('e05c3fa9-44c6-4144-866d-8850c663615b','Delete','3','Role Delete','1','9d254493-df8f-4f4d-be22-8401433dfd25','2022-09-06 17:34:16',NULL,'2022-09-06 17:34:16',NULL),('fcd957f0-2f3c-43d9-8bfa-fe9d602703a4','View','3','Role - View','1','9d254493-df8f-4f4d-be22-8401433dfd25','2022-09-06 17:34:20',NULL,'2023-12-27 13:00:29',NULL);
/*!40000 ALTER TABLE `module_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `roleId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `moduleId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `moduleId` (`moduleId`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`moduleId`) REFERENCES `module_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_ibfk_3` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES ('2d3e895d-2c37-4ba7-ae5b-04a7f6e6e836','a499f243-e187-4ca8-8c18-aff92910d68e','681462d2-bde3-4a47-bd2e-96a1560fd3de','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('55039bf2-e8d3-4cd5-9dbb-54b09fb7039f','a499f243-e187-4ca8-8c18-aff92910d68e','21aa2df3-43c1-4fad-aa9f-64536df8c291','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('57d945f8-3963-4392-b87b-d1dcd90666e2','a499f243-e187-4ca8-8c18-aff92910d68e','c3fb2a32-85a3-456c-96d0-400dcd082db2','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('5c1bcb9e-b5b5-4dc9-bd34-8dd59bdf3065','a499f243-e187-4ca8-8c18-aff92910d68e','b19056a2-b632-47a5-874e-06c218ca7258','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('6427854f-76a0-48a0-a0e0-61ef7ba1cf7e','a499f243-e187-4ca8-8c18-aff92910d68e','48e5dd71-9c89-4214-b7a0-e6cc2e80429f','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('76e5fb5d-0a70-4041-9159-ea56a8d1ce80','a499f243-e187-4ca8-8c18-aff92910d68e','d0896f7d-72e5-41dc-80bb-bcedf458b56d','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('7be6d4af-5691-46c9-a5c5-d7785ac7f3da','a499f243-e187-4ca8-8c18-aff92910d68e','6b9af91f-9f0e-4cb8-8b6c-28ad44d0ceaa','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('7d117792-48a4-4a0e-b01d-4ad050e3b372','a499f243-e187-4ca8-8c18-aff92910d68e','5b9af182-1011-48a5-aeb7-fa0f00e80287','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('9b185c01-82ce-4253-9876-6d2f53df31fa','a499f243-e187-4ca8-8c18-aff92910d68e','a9fd76cb-7719-427a-9ab1-1aafc4fe982a','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('b58c6b31-49c4-496e-aa83-e017d59b367f','a499f243-e187-4ca8-8c18-aff92910d68e','2f65ba39-3510-4d3a-8e11-d68e9485ca43','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('dea2d18b-ed70-4163-967c-ae7a9f82a596','a499f243-e187-4ca8-8c18-aff92910d68e','1d132fff-6bef-4126-be1a-c225a5caaad2','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49'),('fd5437bc-59ad-4bef-91ce-0cabde446a4f','a499f243-e187-4ca8-8c18-aff92910d68e','a715dcae-fb8e-4be3-9f34-98c0cc086676','2025-02-19 13:50:49','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-19 13:50:49');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `isSystemAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `systemDefault` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `status` enum('0','1') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `createdBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `updatedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `deletedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_createdBy_foreign_idx` (`createdBy`),
  KEY `role_updatedBy_foreign_idx` (`updatedBy`),
  KEY `role_deletedBy_foreign_idx` (`deletedBy`),
  CONSTRAINT `role_createdBy_foreign_idx` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `role_deletedBy_foreign_idx` FOREIGN KEY (`deletedBy`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `role_updatedBy_foreign_idx` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('4db03064-6826-4a94-8943-5dbbba2f5de2','System Admin',1,0,1,'System Admin Description','1','2022-09-16 07:39:04','2022-09-16 07:39:04',NULL,NULL,NULL,NULL,0),('766b7ee4-9347-4752-84ab-24b9cc7c996e','Admin',0,1,1,'Admin Description','1','2022-09-16 07:41:10','2022-09-16 07:41:10',NULL,NULL,NULL,NULL,1),('a499f243-e187-4ca8-8c18-aff92910d68e','Flutter Team',0,0,0,'Flutter Team','1','2025-02-19 13:49:38','2025-02-19 13:49:38',NULL,'f2b13458-ac56-4c54-a6cb-53f879dbfe6c',NULL,NULL,2);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizeData`
--

DROP TABLE IF EXISTS `sequelizeData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequelizeData` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizeData`
--

LOCK TABLES `sequelizeData` WRITE;
/*!40000 ALTER TABLE `sequelizeData` DISABLE KEYS */;
INSERT INTO `sequelizeData` VALUES ('20220909130958-role.js'),('20220909131017-user.js'),('20250219155211-module-master.js');
/*!40000 ALTER TABLE `sequelizeData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profileImage` text,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `roleId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `updatedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `deletedBy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `isEmailVerified` enum('0','1') NOT NULL DEFAULT '0',
  `isPasswordChangeRequired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `roleId` (`roleId`),
  KEY `createdBy` (`createdBy`),
  KEY `updatedBy` (`updatedBy`),
  KEY `deletedBy` (`deletedBy`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`deletedBy`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('8c6bcbe1-1319-4606-bdf8-e297efe78280','Meet','Mevada','9924859611','meet.mevada@mksdigitech.com','$2b$10$fSENJPUWnZREBe5xdZRxr.rLKOQZMMJ7bIS9wz3VYDBCZOM6c66sO',NULL,'1','a499f243-e187-4ca8-8c18-aff92910d68e','2025-02-19 13:50:16','f2b13458-ac56-4c54-a6cb-53f879dbfe6c','2025-02-20 05:53:53','8c6bcbe1-1319-4606-bdf8-e297efe78280',NULL,NULL,'0',0),('f2b13458-ac56-4c54-a6cb-53f879dbfe6c','System','admin','1234567890','superadmin@gmail.com','$2b$10$VmvIybf97TvOBAzqbW7GNeEd2a3zRvCzYwaNYxXw02AiLJBKG/ZRy',NULL,'1','4db03064-6826-4a94-8943-5dbbba2f5de2','2022-09-16 07:22:55',NULL,'2025-02-20 05:57:50','f2b13458-ac56-4c54-a6cb-53f879dbfe6c',NULL,NULL,'0',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_verification_links`
--

DROP TABLE IF EXISTS `user_verification_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_verification_links` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `userId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `token` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '1 Active, 0 InActive',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_verification_links_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_verification_links`
--

LOCK TABLES `user_verification_links` WRITE;
/*!40000 ALTER TABLE `user_verification_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_verification_links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-21 11:55:04
