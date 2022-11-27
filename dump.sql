-- MySQL dump 10.13  Distrib 8.0.30, for macos12.5 (arm64)
--
-- Host: localhost    Database: DNA_Project
-- ------------------------------------------------------
-- Server version	8.0.30

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 12:40:39

DROP DATABASE IF EXISTS `DNA_Project`;
CREATE SCHEMA `DNA_Project`;
USE `DNA_Project`;

DROP TABLE IF EXISTS `Weapon`;
CREATE TABLE `Weapon` (
  `Name` varchar(255) PRIMARY KEY,
  `Type` varchar(255),
  `Cost` int
);
LOCK TABLES `Weapon` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Wield_weapon`;
CREATE TABLE `Wield_weapon` (
  `Owner_name` varchar(255),
  `Weapon_name` varchar(255),
  PRIMARY KEY (`Owner_name`, `Weapon_name`)
);
LOCK TABLES `Wield_weapon` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Weapon_supported_attachments`;
CREATE TABLE `Weapon_supported_attachments` (
  `Weapon_name` varchar(255),
  `Attachment` varchar(255),
  PRIMARY KEY (`Weapon_name`, `Attachment`)
);
LOCK TABLES `Weapon_supported_attachments` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Weapon_customisation_set`;
CREATE TABLE `Weapon_customisation_set` (
  `Weapon_name` varchar(255) PRIMARY KEY,
  `Tint` varchar(255),
  `Clip_size` int,
  `Clip_type` varchar(255)
);
LOCK TABLES `Weapon_customisation_set` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Adversary_wield`;
CREATE TABLE `Adversary_wield` (
  `Adversary_name` varchar(255),
  `Weapon_name` varchar(255),
  PRIMARY KEY (`Adversary_name`, `Weapon_name`)
);
LOCK TABLES `Adversary_wield` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Bulk_purchase`;
CREATE TABLE `Bulk_purchase` (
  `Purchase_id` int PRIMARY KEY,
  `Organisation_name` varchar(255),
  `Weapon_name` varchar(255),
  `Quantity` int
);
LOCK TABLES `Bulk_purchase` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Criminal_organisation`;
CREATE TABLE `Criminal_organisation` (
  `Name` varchar(255) PRIMARY KEY,
  `Boss` varchar(255),
  `Member_count` int,
  `Status` varchar(255)
);
LOCK TABLES `Criminal_organisation` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Event_involves`;
CREATE TABLE `Event_involves` (
  `Associate_name` varchar(255),
  `Event_number` int,
  `Adversary_name` varchar(255),
  `Organisation_name` varchar(255),
  PRIMARY KEY (`Associate_name`, `Event_number`, `Adversary_name`, `Organisation_name`)
);
LOCK TABLES `Event_involves` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Hires`;
CREATE TABLE `Hires` (
  `Organisation_name` varchar(255),
  `Adversary_name` varchar(255),
  PRIMARY KEY (`Organisation_name`, `Adversary_name`)
);
LOCK TABLES `Hires` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Adversary`;
CREATE TABLE `Adversary` (
  `Name` varchar(255) PRIMARY KEY,
  `Status` varchar(255),
  `Adversary_of` varchar(255)
);
LOCK TABLES `Adversary` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Business`;
CREATE TABLE `Business` (
  `Name` varchar(255),
  `BAWSAQ_Index` varchar(4) PRIMARY KEY,
  `Type` varchar(255),
  `Owner_organisation_name` varchar(255),
  `Valuation` int
);
LOCK TABLES `Business` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
  `Model` varchar(255) PRIMARY KEY,
  `Manafacturer` varchar(255),
  `Max_speed` int,
  `Vehicle_type` varchar(255)
);
LOCK TABLES `Vehicle` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Drive`;
CREATE TABLE `Drive` (
  `Owner_name` varchar(255),
  `Vehicle_model` varchar(255),
  PRIMARY KEY (`Owner_name`, `Vehicle_model`)
);
LOCK TABLES `Drive` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Close_associate`;
CREATE TABLE `Close_associate` (
  `Name` varchar(255) PRIMARY KEY,
  `Year_of_birth` YEAR,
  `Age` int,
  `Address_id` int,
  `Special_skill` varchar(255)
);
LOCK TABLES `Close_associate` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Collaborate_with`;
CREATE TABLE `Collaborate_with` (
  `collaboration_id` int PRIMARY KEY,
  `Associate1` varchar(255),
  `Associate2` varchar(255),
  `In_event` int
);
LOCK TABLES `Collaborate_with` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Consort`;
CREATE TABLE `Consort` (
  `Name` varchar(255) PRIMARY KEY,
  `Associate_name` varchar(255)
);
LOCK TABLES `Consort` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Address`;
CREATE TABLE `Address` (
  `Address_id` int PRIMARY KEY,
  `House_number` int,
  `Street` varchar(255),
  `Neighbourhood` varchar(255),
  `City` varchar(255),
  `County` varchar(255)
);
LOCK TABLES `Address` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Landmark_event`;
CREATE TABLE `Landmark_event` (
  `Serial_number` int PRIMARY KEY,
  `Event_name` varchar(255),
  `Consequential_outcome` varchar(255),
  `Major_location` varchar(255)
);
LOCK TABLES `Landmark_event` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Property`;
CREATE TABLE `Property` (
  `Property_id` int PRIMARY KEY,
  `Owner_name` varchar(255),
  `Address_id` int,
  `Valuation` int
);
LOCK TABLES `Property` WRITE;
UNLOCK TABLES;

ALTER TABLE `Wield_weapon` ADD FOREIGN KEY (`Weapon_name`) REFERENCES `Weapon` (`Name`);

ALTER TABLE `Wield_weapon` ADD FOREIGN KEY (`Owner_name`) REFERENCES `Close_associate` (`Name`);

ALTER TABLE `Adversary_wield` ADD FOREIGN KEY (`Adversary_name`) REFERENCES `Adversary` (`Name`);

ALTER TABLE `Adversary_wield` ADD FOREIGN KEY (`Weapon_name`) REFERENCES `Weapon` (`Name`);

ALTER TABLE `Collaborate_with` ADD FOREIGN KEY (`Associate1`) REFERENCES `Close_associate` (`Name`);

ALTER TABLE `Collaborate_with` ADD FOREIGN KEY (`Associate2`) REFERENCES `Close_associate` (`Name`);

ALTER TABLE `Collaborate_with` ADD FOREIGN KEY (`In_event`) REFERENCES `Landmark_event` (`Serial_number`);

ALTER TABLE `Consort` ADD FOREIGN KEY (`Associate_name`) REFERENCES `Close_associate` (`Name`);

ALTER TABLE `Drive` ADD FOREIGN KEY (`Owner_name`) REFERENCES `Close_associate` (`Name`);

ALTER TABLE `Drive` ADD FOREIGN KEY (`Vehicle_model`) REFERENCES `Vehicle` (`Model`);

ALTER TABLE `Property` ADD FOREIGN KEY (`Address_id`) REFERENCES `Address` (`Address_id`);

ALTER TABLE `Business` ADD FOREIGN KEY (`Owner_organisation_name`) REFERENCES `Criminal_organisation` (`Name`);

ALTER TABLE `Event_involves` ADD FOREIGN KEY (`Associate_name`) REFERENCES `Close_associate` (`Name`);

ALTER TABLE `Event_involves` ADD FOREIGN KEY (`Adversary_name`) REFERENCES `Adversary` (`Name`);

ALTER TABLE `Event_involves` ADD FOREIGN KEY (`Event_number`) REFERENCES `Landmark_event` (`Serial_number`);

ALTER TABLE `Event_involves` ADD FOREIGN KEY (`Organisation_name`) REFERENCES `Criminal_organisation` (`Name`);

ALTER TABLE `Hires` ADD FOREIGN KEY (`Organisation_name`) REFERENCES `Criminal_organisation` (`Name`);

ALTER TABLE `Hires` ADD FOREIGN KEY (`Adversary_name`) REFERENCES `Adversary` (`Name`);

ALTER TABLE `Bulk_purchase` ADD FOREIGN KEY (`Organisation_name`) REFERENCES `Criminal_organisation` (`Name`);

ALTER TABLE `Bulk_purchase` ADD FOREIGN KEY (`Weapon_name`) REFERENCES `Weapon` (`Name`);

ALTER TABLE `Property` ADD FOREIGN KEY (`Owner_name`) REFERENCES `Close_associate` (`Name`);

ALTER TABLE `Property` ADD FOREIGN KEY (`Owner_name`) REFERENCES `Adversary` (`Name`);

ALTER TABLE `Weapon_supported_attachments` ADD FOREIGN KEY (`Weapon_name`) REFERENCES `Weapon_customisation_set` (`Weapon_name`);

ALTER TABLE `Weapon_customisation_set` ADD FOREIGN KEY (`Weapon_name`) REFERENCES `Weapon` (`Name`);
