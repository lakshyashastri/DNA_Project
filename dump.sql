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

SET GLOBAL FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `Weapon` VALUES ("Special Carbine", "Assault Rifles", 14750), ("Carbine Rifle", "Assault Rifles", 2100), ("Bullpup Rifle", "Assault Rifles", 14500), ("Assault Rifle", "Assault Rifle", 1400), ("Advanced Rifle", "Assault Rifles", 3500), ("AP Pistol", "Handguns", 1000), ("Combat Pistol", "Handguns", 600), ("Heavy Pistol", "Handguns", 3750), ("Marksman Pistol", "Handguns", 4350), ("Pistol", "Handguns", 350), ("Pistol .50", "Handguns", 4000), ("SNS Pistol", "Handguns", 2750), ("Stun Gun", "Handguns", 100), ("Vintage Pistol", "Handguns", 3450), ("Machete", "Melee", 8900), ("Antique Cavalry Dagger", "Melee", 2000), ("Baseball Bat", "Melee", NULL), ("Broken Bottle", "Melee", 300), ("Crowbar", "Melee", NULL), ("Fist", "Melee", NULL), ("Golf Club", "Melee", NULL), ("Hammer", "Melee", 500), ("Hatchet", "Melee", 750), ("Knife", "Melee", 100), ("Knuckledusters", "Melee", 7500), ("Nightstick", "Melee", 100), ("Assault Shotgun", "Shotguns", 1500), ("Bullpup Shotgun", "Shotguns", 1250), ("Heavy Shotgun", "Shotgus", 13550), ("Musket", "Shotguns", 21400), ("Pump Shotgun", "Shotguns", 550), ("Sawed-Off Shotgun", "Shotguns", 300), ("Heavy Sniper", "Sniper Rifles", 9500), ("Marksman Rifle", "Sniper Rifles", 15750), ("Sniper Rifle", "Sniper Rifles", 5000), ("Minigun", "Heavy Weapons", 15000), ("Firework Launcher", "Heavy Weapons", 65000), ("Grenade Launcher", "Heavy Weapons", 8100), ("Homing Launcher", "Heavy Weapons", 15500), ("Railgun", "Heavy Weapons", 250000), ("Rocket Launcher", "Heavy Weapons", 6500), ("Grenade", "Thrown Weapons", 150), ("Tear Gas", "Thrown Weapons", 150), ("Sticky Bomb", "Thrown Weapons", 400), ("Proximity Mine", "Thrown Weapons", 1000), ("Jerry Can", "Thrown Weapons", 25), ("Molotov Cocktail", "Thrown Weapons", NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Wield_weapon`;
CREATE TABLE `Wield_weapon` (
  `Owner_name` varchar(255),
  `Weapon_name` varchar(255),
  PRIMARY KEY (`Owner_name`, `Weapon_name`)
);
LOCK TABLES `Wield_weapon` WRITE;
INSERT INTO `Wield_weapon` VALUES ("Michael", "Carbine Rifle"), ("Michael", "Combat Pistol"), ("Michael", "Assault Shotgun"), ("Franklin", "Pistol"), ("Franklin", "Pump Shotgun"), ("Franklin", "Heavy Sniper"), ("Trevor", "Pistol .50"), ("Trevor", "Machete"), ("Trevor", "Pump Shotgun"), ("Trevor", "Sniper Rifle");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Weapon_supported_attachments`;
CREATE TABLE `Weapon_supported_attachments` (
  `Weapon_name` varchar(255),
  `Attachment` varchar(255),
  PRIMARY KEY (`Weapon_name`, `Attachment`)
);
LOCK TABLES `Weapon_supported_attachments` WRITE;
INSERT INTO `Weapon_supported_attachments` VALUES ("AP Pistol", "Flashlight"), ("AP Pistol", "Suppressor"), ("Pump Shotgun", "Flashlight"), ("Pump Shotgun", "Suppressor"), ("Special Carbine", "Flashlight"), ("Special Carbine", "Scope"), ("Special Carbine", "Suppressor"), ("Special Carbine", "Grip"), ("Sniper Rifle", "Scope"), ("Sniper Rifle", "Suppressor"), ("Sniper Rifle", "Advanced Scope"), ("Grenade Launcher", "Grip"), ("Grenade Launcher", "Flashlight"), ("Grenade Launcher", "Scope");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Weapon_customisation_set`;
CREATE TABLE `Weapon_customisation_set` (
  `Weapon_name` varchar(255) PRIMARY KEY,
  `Tint` varchar(255),
  `Clip_size` int,
  `Clip_type` varchar(255)
);
LOCK TABLES `Weapon_customisation_set` WRITE;
INSERT INTO `Weapon_customisation_set` VALUES ("Pistol", "Platinum", 16, NULL), ("Pump Shotgun", "Gold", 16, "Explosive Slugs"), ("Bullpup Rifle", "LSPD", 60, NULL), ("Marksman Rifle", "Pink", 16, "Incendiary Rounds"), ("Grenade Launcher", "Orange", 1, NULL);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Adversary_wield`;
CREATE TABLE `Adversary_wield` (
  `Adversary_name` varchar(255),
  `Weapon_name` varchar(255),
  PRIMARY KEY (`Adversary_name`, `Weapon_name`)
);
LOCK TABLES `Adversary_wield` WRITE;
INSERT INTO `Adversary_wield` VALUES ("Steve Haines", "Carbine Rifle"), ("Stretch", "Pump Shotgun"), ("Johnny Klebitz", "Sawed-Off Shotgun");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Bulk_purchase`;
CREATE TABLE `Bulk_purchase` (
  `Purchase_id` int PRIMARY KEY,
  `Organisation_name` varchar(255),
  `Weapon_name` varchar(255),
  `Quantity` int
);
LOCK TABLES `Bulk_purchase` WRITE;
INSERT INTO `Bulk_purchase` VALUES (1, "Merryweather Security", "Special Carbine", 5000), (2, "Merryweather Security", "Micro SMG", 10000), (3, "The Lost Motorcycle Club", "Sawed-Off Shotgun", 950), (4, "Trevor Philips Enterprises", "Pump Shotgun", 20), (5, "Madrazo Cartel", "Pistol", 240), (6, "Ballas", "Knuckledusters", 500);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Criminal_organisation`;
CREATE TABLE `Criminal_organisation` (
  `Name` varchar(255) PRIMARY KEY,
  `Boss` varchar(255),
  `Member_count` int,
  `Status` varchar(255)
);
LOCK TABLES `Criminal_organisation` WRITE;
INSERT INTO `Criminal_organisation` VALUES ("Ballas", "Stretch", 500, "Operational"), ("Los Santos Vagos", "Edgar Carlos", 290, "Operational"), ("The Families", "The Boss", 300, "Operational"), ("Madrazo Cartel", "Martin Madrazo", 250, "Operational"), ("Merryweather Security", "Don Percival", 5000, "Operational"), ("Altruist Cult", NULL, 30, "Inoperative"), ("Trevor Philips Enterprises", "Trevor Philips", 20, "Operational"), ("O'Neil Brothers", "Elwood O'Neil", 100, "Inoperative"), ("The Lost Motorcycle Club", "Johnny Klebitz", 950, "Operational"), ("Federal Investigation Bereau", "Steve Haines", 2400, "Operational"), ("Los Santos Triads", "Wei Cheng", 500, "Operational"), ("Devin Weston Holdings", "Devin Weston", 15000, "Unknown");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Adversary`;
CREATE TABLE `Adversary` (
  `Name` varchar(255) PRIMARY KEY,
  `Status` varchar(255),
  `Adversary_of` varchar(255)
);
LOCK TABLES `Adversary` WRITE;
INSERT INTO `Adversary` VALUES ("Devin Weston", "Deceased", "Michael"), ("Steve Haines", "Deceased", "Trevor"), ("Wei Cheng", "Deceased", "Trevor"), ("Stretch", "Deceased", "Franklin"), ("Johnny Klebitz", "Deceased", "Trevor");
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
INSERT INTO `Event_involves` VALUES ("Michael", 1, "Steve Haines", "Federal Investigation Bereau"), ("Michael", 4, "Martin Madrazo", "Madrazo Cartel"), ("Trevor", 8, "Johnny Klebitz", "The Lost Motorcycle Club"), ("Michael", 11, "Steve Haines", "Federal Investigation Bereau"), ("Trevor", 12, "Don Percival", "Merryweather Security"), ("Michael", 20, "Wei Cheng", "Los Santos Triads"), ("Michael", 24, "Steve Haines", "Federal Investigation Bereau"), ("Michael", 25, "Steve Haines", "Devin Weston Holdings"), ("Michael", 26, "Steve Haines", "Devin Weston Holdings");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Hires`;
CREATE TABLE `Hires` (
  `Organisation_name` varchar(255),
  `Adversary_name` varchar(255),
  PRIMARY KEY (`Organisation_name`, `Adversary_name`)
);
LOCK TABLES `Hires` WRITE;
INSERT INTO `Hires` VALUES ("Merryweather Security", "Devin Weston"), ("Ballas", "Steve Haines"), ("Trevor Philips Enterprises", "Wei Cheng");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Business`;
CREATE TABLE `Business` (
  `Name` varchar(255),
  `BAWSAQ_Index` varchar(4) PRIMARY KEY,
  `Type` varchar(255),
  `Valuation` int
);
LOCK TABLES `Business` WRITE;
INSERT INTO `Business` VALUES ("FlyUS", "FUS", "Airlines", 150), ("Ponsonbys", "PON", "Clothing", 250), ("Lifeinvader", "LFI", "Electronics", 500), ("Burger Shot", "BGR", "Food & Drink", 50), ("Sprunk", "SPU", "Food & Drink", 75), ("Los Santos Customs", "LSC", "Garages", 100), ("Weazel", "WZL", "Media", 125), ("Merryweather", "MER", "Other", 750);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
  `Model` varchar(255) PRIMARY KEY,
  `Manafacturer` varchar(255),
  `Max_speed` int,
  `Vehicle_type` varchar(255)
);
LOCK TABLES `Vehicle` WRITE;
INSERT INTO `Vehicle` VALUES ("Banshee", "Bravado", 148, "Sports"), ("Coquette", "Invetero", 152, "Sports"), ("Rapid GT", "Dewbauchee", 152, "Sports"), ("Buffalo S", "Bravado", 145, "Sports"), ("Dominator", "Vapid", 145, "Muscle"), ("Gauntlet", "Bravado", 145, "Muscle"), ("Adder", "Truffade", 160, "Super"), ("Entity XF", "Overflod", 165, "Super"), ("Infernus", "Pegassi", 150, "Super"), ("T20", "Progen", 159, "Super"), ("Tailgater", "Obey", 145, "Sedan"), ("Issi", "Weeny", 135, "Compact"), ("Bati 801", "Pegassi", 150, "Motorcycle"), ("Hakuchou", "Shitzu", 152, "Motorcycle"), ("Sanchez", "Maibatsu", 118, "Motorcycle"), ("Bodhi", "Canis", 134, "Off-Road"), ("BMX", NULL, 50, "Cycle"), ("Rhino Tanl", NULL, 55, "Military"), ("Luxor", "Buckhingham", 140, "Plane"), ("P-996 LAZER", "Jobuilt", 210, "Plane"), ("Buzzard", "Nagasaki", 160, "Helicopter");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Drive`;
CREATE TABLE `Drive` (
  `Owner_name` varchar(255),
  `Vehicle_model` varchar(255),
  PRIMARY KEY (`Owner_name`, `Vehicle_model`)
);
LOCK TABLES `Drive` WRITE;
INSERT INTO `Drive` VALUES ("Michael", "Tailgater"), ("Franklin", "Buffalo S"), ("Trevor", "Bodhi");
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
INSERT INTO `Close_associate` VALUES ("Michael", 1968, 54, 1, "Area Kill"), ("Franklin", 1984, 38, 2, "Driving Focus"), ("Trevor", 1971, 47, 3, "Red Mist");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Collaborate_with`;
CREATE TABLE `Collaborate_with` (
  `collaboration_id` int PRIMARY KEY,
  `Associate1` varchar(255),
  `Associate2` varchar(255),
  `In_event` int
);
LOCK TABLES `Collaborate_with` WRITE;
INSERT INTO `Collaborate_with` VALUES (1, "Michael", "Trevor", 1), (2, "Michael", "Franklin", 4), (3, "Michael", "Franklin", 7), (4, "Michael", "Trevor", 10), (5, "Michael", "Franklin", 11), (6, "Franklin", "Trevor", 12), (7, "Michael", "Trevor", 14), (8, "Michael", "Trevor", 16), (9, "Michael", "Trevor", 17), (10, "Michael", "Trevor", 18), (11, "Michael", "Franklin", 21), (12, "Michael", "Franklin", 23), (13, "Michael", "Trevor", 24), (14, "Trevor", "Franklin", 27), (15, "Michael", "Trevor", 28);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Consort`;
CREATE TABLE `Consort` (
  `Name` varchar(255) PRIMARY KEY,
  `Associate_name` varchar(255)
);
LOCK TABLES `Consort` WRITE;
INSERT INTO `Consort` VALUES ("Lamar", "Franklin"), ("Tonya", "Franklin"), ("Jimmy", "Michael"), ("Amanda", "Michael"), ("Tracey", "Michael"), ("Ron", "Trevor"), ("Wade", "Trevor");
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
INSERT INTO `Address` VALUES (1, 4, "Portola Drive", "Rockford Hills", "Los Santos", "LS County"), (2, 3671, "Whispymound Drive", "Vinewood Hills", "Los Santos", "LS County"), (3, 8, "Zancudo Avenue", "Sandy Shores", "Sandy Shores", "Blaine County"), (4, 36, "Forum Drive", "Strawberry", "Los Santos", "LS County"), (5, 2, "Goma Street", "Vespucci Beach", "Los Santos", "LS County");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Landmark_event`;
CREATE TABLE `Landmark_event` (
  `Serial_number` int PRIMARY KEY,
  `Event_name` varchar(255),
  `Consequential_outcome` varchar(255),
  `Major_location` varchar(255)
);
LOCK TABLES `Landmark_event` WRITE;
INSERT INTO `Landmark_event` VALUES (1, "Prologue", "Michael supposedly dies but secretly escapes after a botched robbery, Trevor goes missing", "Ludendorff, North Yankton"), (2, "Franklin and Lamar", "Franklin meets Jimmy", "Simeon's Car Dealership"), (3, "Complications", "Franklin meets Michael", "De Santa Residence"), (4, "Marriage Conselling", "Michael gets indebted to Martin Madrazo", "Martin Madrazo's Stilt House"), (5, "The Long Stretch", "Frankling and Lamar meet Stretch", "Recycling Center in La Puerta"), (6, "Friend Request", "Michael murders Lifeinvader's CEO", "Lifeinvader Office"), (7, "The Jewel Store Job", "Michael and Franklin rob Vangelico to pay off Martin Madrazo; Trevor finds out Michael is alive", "Vangelico Store"), (8, "Mr. Philips", "Trevor murder Johnny Klebitz and starts a gang war", "Sandy Shores"), (9, "Friends Reunited", "Trevor moves to Los Santos in search of Michael", "Floyd's Apartment"), (10, "Fame or Shame", "Trevor meets Michael and they save Tracey", "Maze Bank Arena"), (11, "Three's Company", "Franklin, Michael, Trevor work for the FIB and meet Steve Haines", "IAA Headquarters"), (12, "The Merrywheather Heist", "Franklin, Michael, Trevor steal a nuclear warhead before being forced to return it back, leading to distrust among the three", "Port of Los Santos"), (13, "Did Somebody Say Yoga?", "Michael's family leaves him", "De Santa Residence"), (14, "Blitz Play", "Franklin, Michael, Trevor steal IAA funds on request from Steve Haines for Devin Weston; Michael meets Devin Weston", "Devin Weston's House"), (15, "Mr. Richards", "Michael meets Solomon Richards through Devin Weston", "Solomon's Office"), (16, "Caida Libre", "Trevor kidnaps Martin Madrazo's wife, leading to exile from LS for both of them", "Blaine County"), (17, "The Paleto Score", "Franklin, Michael, Trevor rob the bank in Paleto Bay to finance an upcoming raid on Humane Labs", "Paleto Bay"), (18, "Monkey Business", "Franklin, Michael, Trevor help steal a nerve agent for Steve Haines; Trevor returns Martin Madrazo's wife, ending his and Michael's exile", "Humane Labs"), (19, "Hang Ten", "Trevor murders Floyd and moves over to a club with Wade", "Floyd's Apartment"), (20, "Bury the Hatchet", "Trevor finds out Michael had a deal with FIB during Prologue, and finds out Michael betrayed him; Michael gets kidnapped by Los Santos Triads, who are enemies of Trevor", "Ludendorff, North Yankton"), (21, "Fresh Meat", "Franklin saves Michael from the Los Santos Triads", "Raven Slaughterhouse"), (22, "Reuniting the Family", "Michael reunites with his family", "Dr. Friedlander's Office"), (23, "The Bereau Raid", "Franklin, Michael raid the FIB to retrieve intel against Steve Haines; Michael deletes his past criminal records, destroying Haines' leverage on him", "FIB Headquarters"), (24, "The Wrap Up", "Steve Haines makes Michael get caught up in a shootout between the FIB, IAA, Merryweather; Trevor saves him", "Kortz Center"), (25, "Legal Trouble", "Devin Weston's assistant gets killed during a confrontation with Michael; Devin Weston becomes enemies with Michael", "LSIA"), (26, "Meltdown", "Devin Weston hires Merryweather to murder Michael's family, Michael saves them", "Michael's house"), (27, "The Big Score", "Franklin, Michael, Trevor steal four tons of gold from the Union Depository", "Union Depository"), (28, "The Third Way", "Franklin, Michael, Trevor eliminate all their enemies", "San Andreas");
UNLOCK TABLES;

DROP TABLE IF EXISTS `Property`;
CREATE TABLE `Property` (
  `Property_id` int PRIMARY KEY,
  `Owner_name` varchar(255),
  `Address_id` int,
  `Valuation` int
);
LOCK TABLES `Property` WRITE;
INSERT INTO `Property` VALUES (1, "Michael", 1, 4500000), (2, "Franklin", 2, 7921568), (3, "Trevor", 3, 0), (4, "Franklin", 4, 500000), (5, "Trevor", 5, 1500000);
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
