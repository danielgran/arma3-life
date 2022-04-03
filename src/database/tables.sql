-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: arma3
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `gang`
--

DROP TABLE IF EXISTS `gang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gang` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gang`
--

LOCK TABLES `gang` WRITE;
/*!40000 ALTER TABLE `gang` DISABLE KEYS */;
/*!40000 ALTER TABLE `gang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garage`
--

DROP TABLE IF EXISTS `garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `size` int NOT NULL DEFAULT '0',
  `owner_type` enum('PLAYER','HOUSE','GANG','MEDIC','MECHANIC','POLICE','') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'PLAYER' COMMENT 'a garage can be owned by a player, gang or a house, etc.',
  `owner_id` int unsigned NOT NULL COMMENT 'the Key of the player',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garage`
--

LOCK TABLES `garage` WRITE;
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
INSERT INTO `garage` (`id`, `size`, `owner_type`, `owner_id`) VALUES (1,10,'PLAYER',1),(2,10,'PLAYER',2),(3,10,'PLAYER',3);
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garagevehicle`
--

DROP TABLE IF EXISTS `garagevehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garagevehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Internal ID of Vehicle for identification',
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'classname of a3 vehicle',
  `nameDisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `canSpawn` tinyint DEFAULT '1' COMMENT 'default 1 | could be disabled so no ingame spawn is possible',
  `priceBuy` int DEFAULT NULL,
  `ownerID` int unsigned NOT NULL COMMENT 'garage owner if null no garage and will be removed',
  `inventoryVirt` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'default "[]"',
  `fuel` float(10,0) DEFAULT '1' COMMENT 'default 1',
  `hitInfo` text CHARACTER SET utf8 COLLATE utf8_bin,
  `cargoBackpack` text CHARACTER SET utf8 COLLATE utf8_bin,
  `cargoItem` text CHARACTER SET utf8 COLLATE utf8_bin,
  `cargoWeapon` text CHARACTER SET utf8 COLLATE utf8_bin,
  `cargoMagazine` text CHARACTER SET utf8 COLLATE utf8_bin,
  `turretWeapon` text CHARACTER SET utf8 COLLATE utf8_bin,
  `turretAmmo` text CHARACTER SET utf8 COLLATE utf8_bin,
  `dateInsert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `garage` (`ownerID`),
  CONSTRAINT `garage` FOREIGN KEY (`ownerID`) REFERENCES `garage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garagevehicle`
--

LOCK TABLES `garagevehicle` WRITE;
/*!40000 ALTER TABLE `garagevehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `garagevehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner` int unsigned NOT NULL,
  `ownerType` enum('GANG','PLAYER','COMPANY') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'PLAYER',
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nameCustom` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `position` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` (`id`, `owner`, `ownerType`, `nameClass`, `nameCustom`, `position`) VALUES (1,1,'PLAYER','Land_House_2W03_F','KrassesHaus','\"\"\"[1,1,1]\"\"\"');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housefurniture`
--

DROP TABLE IF EXISTS `housefurniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housefurniture` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `houseID` int unsigned NOT NULL COMMENT 'FK',
  `position` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pos in the house',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'upgradeable?',
  `size` int unsigned DEFAULT '0' COMMENT 'upgradeable?',
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoItem` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoWeapon` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoMagazine` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoBackpack` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `virtInventory` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `houseID` (`houseID`) USING BTREE,
  CONSTRAINT `houseID` FOREIGN KEY (`houseID`) REFERENCES `house` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housefurniture`
--

LOCK TABLES `housefurniture` WRITE;
/*!40000 ALTER TABLE `housefurniture` DISABLE KEYS */;
INSERT INTO `housefurniture` (`id`, `houseID`, `position`, `level`, `size`, `nameClass`, `cargoItem`, `cargoWeapon`, `cargoMagazine`, `cargoBackpack`, `virtInventory`) VALUES (1,1,'\"\"\"[1,2,3]\"\"\"','1',1,'Land_ShelvesMetal_F','\"\"\"[]\"\"\"','\"\"\"[]\"\"\"','\"\"\"[]\"\"\"','\"\"\"[]\"\"\"','\"\"\"[]\"\"\"');
/*!40000 ALTER TABLE `housefurniture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_item_types`
--

DROP TABLE IF EXISTS `list_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_item_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_item_types`
--

LOCK TABLES `list_item_types` WRITE;
/*!40000 ALTER TABLE `list_item_types` DISABLE KEYS */;
INSERT INTO `list_item_types` (`id`, `name`) VALUES (1,'WEAPON'),(2,'EDIBLE'),(3,'VEST'),(4,'HEAD');
/*!40000 ALTER TABLE `list_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_items`
--

DROP TABLE IF EXISTS `list_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'FK',
  `isVirtual` tinyint unsigned NOT NULL DEFAULT '0',
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nameDisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `priceBuy` int NOT NULL,
  `priceSell` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_items`
--

LOCK TABLES `list_items` WRITE;
/*!40000 ALTER TABLE `list_items` DISABLE KEYS */;
INSERT INTO `list_items` (`id`, `type`, `isVirtual`, `nameClass`, `nameDisplay`, `priceBuy`, `priceSell`) VALUES (1,'2',1,'bottleWater','Wasserflasche',2,1),(2,'2',1,'bottleCola','Colaflasche',3,1);
/*!40000 ALTER TABLE `list_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_maps`
--

DROP TABLE IF EXISTS `list_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_maps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `nameMap` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_maps`
--

LOCK TABLES `list_maps` WRITE;
/*!40000 ALTER TABLE `list_maps` DISABLE KEYS */;
INSERT INTO `list_maps` (`id`, `nameMap`) VALUES (1,'altis'),(2,'tanoa'),(3,'malden'),(4,'stratis');
/*!40000 ALTER TABLE `list_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_servers`
--

DROP TABLE IF EXISTS `list_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_servers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `map` int unsigned NOT NULL COMMENT 'FK',
  `ipv4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'IPv4 or hostname',
  `ipv6` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `map` (`map`) USING BTREE,
  CONSTRAINT `list_servers_ibfk_1` FOREIGN KEY (`map`) REFERENCES `list_maps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_servers`
--

LOCK TABLES `list_servers` WRITE;
/*!40000 ALTER TABLE `list_servers` DISABLE KEYS */;
INSERT INTO `list_servers` (`id`, `name`, `map`, `ipv4`, `ipv6`, `port`) VALUES (1,'ALTIS LIFE SERVER#01 ONE-UNIT.NET JOIN NOW TO GET STARTED',1,'127.0.0.1',NULL,2304);
/*!40000 ALTER TABLE `list_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_shop_items`
--

DROP TABLE IF EXISTS `list_shop_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_shop_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `shop` int unsigned NOT NULL COMMENT 'FK',
  `item` int unsigned NOT NULL COMMENT 'FK',
  `stock` int NOT NULL,
  `priceBuy` int NOT NULL,
  `priceSell` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shop` (`shop`) USING BTREE,
  KEY `item` (`item`) USING BTREE,
  CONSTRAINT `item` FOREIGN KEY (`item`) REFERENCES `list_items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shop` FOREIGN KEY (`shop`) REFERENCES `list_shops` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_shop_items`
--

LOCK TABLES `list_shop_items` WRITE;
/*!40000 ALTER TABLE `list_shop_items` DISABLE KEYS */;
INSERT INTO `list_shop_items` (`id`, `shop`, `item`, `stock`, `priceBuy`, `priceSell`) VALUES (4,1,1,3000,12,3);
/*!40000 ALTER TABLE `list_shop_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_shops`
--

DROP TABLE IF EXISTS `list_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_shops` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DBString\r\n',
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'not used yet',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DBString',
  `map` int unsigned DEFAULT NULL COMMENT 'FK',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'DBString',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `map` (`map`) USING BTREE,
  CONSTRAINT `list_shops_ibfk_1` FOREIGN KEY (`map`) REFERENCES `list_maps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_shops`
--

LOCK TABLES `list_shops` WRITE;
/*!40000 ALTER TABLE `list_shops` DISABLE KEYS */;
INSERT INTO `list_shops` (`id`, `name`, `class`, `type`, `map`, `description`) VALUES (1,'adminshop',NULL,'UTIL',1,NULL),(2,'heftigershop',NULL,'UTIL',1,NULL);
/*!40000 ALTER TABLE `list_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_alias`
--

DROP TABLE IF EXISTS `player_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_alias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner` (`owner_id`) USING BTREE,
  CONSTRAINT `owner` FOREIGN KEY (`owner_id`) REFERENCES `players` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_alias`
--

LOCK TABLES `player_alias` WRITE;
/*!40000 ALTER TABLE `player_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_servertransact`
--

DROP TABLE IF EXISTS `player_servertransact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_servertransact` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `player_id` int unsigned NOT NULL COMMENT 'FK',
  `steamid64` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'String',
  `serverFrom` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'String',
  `serverTo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'String',
  `vehicle` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'String\r\n\r\n',
  `vehicleSkin` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'String',
  `velocity` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBArray',
  `dateAdded` bigint DEFAULT '0' COMMENT 'unwichtig für A3S',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE,
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_servertransact`
--

LOCK TABLES `player_servertransact` WRITE;
/*!40000 ALTER TABLE `player_servertransact` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_servertransact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `steamid64` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `a3name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `rankTeam` int DEFAULT '0' COMMENT 'default 0',
  `rankDonator` int DEFAULT '0' COMMENT 'default 0',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBARRAY',
  `loggedAs` enum('"1"','"2"','"3"','"4"','{POL}') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '"1"' COMMENT 'default CIVILIAN | logged as civ, cop, etc',
  `garageCivilian` int DEFAULT '0' COMMENT 'default 0 | FS --> also for Police / etc.?',
  `gearCivilian` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBARRAY',
  `gearPolice` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBARRAY',
  `gearMedic` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBARRAY',
  `gearMechanic` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBARRAY',
  `invVirtual` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBARRAY',
  `alive` tinyint DEFAULT '0' COMMENT 'default 0',
  `arrested` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'DBARRAY',
  `banned` tinyint DEFAULT '0' COMMENT 'default 0',
  `cash` int DEFAULT '0' COMMENT 'default 0',
  `bank` int DEFAULT '0' COMMENT 'default 0',
  `teamkills` int DEFAULT '0' COMMENT 'default 0',
  `kills` int DEFAULT '0' COMMENT 'default 0',
  `deaths` int DEFAULT '0' COMMENT 'default 0',
  `xp` int DEFAULT '0' COMMENT 'default 0',
  `levelPlayer` int DEFAULT '0' COMMENT 'default 0 | complete player is meant for civ /copy / med too --> global exp system incoming',
  `levelPolice` int DEFAULT '0' COMMENT 'default 0',
  `levelMedic` int DEFAULT '0' COMMENT 'default 0',
  `levelMech` int DEFAULT '0' COMMENT 'default 0',
  `playtime` bigint(255) unsigned zerofill DEFAULT '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' COMMENT 'default 0',
  `firstconnect` bigint DEFAULT '0' COMMENT 'default 0',
  `lastconnect` bigint DEFAULT '0' COMMENT 'default 0',
  `lastip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gang_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gang` (`gang_id`) USING BTREE,
  CONSTRAINT `gang` FOREIGN KEY (`gang_id`) REFERENCES `gang` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`id`, `steamid64`, `a3name`, `rankTeam`, `rankDonator`, `nickname`, `location`, `loggedAs`, `garageCivilian`, `gearCivilian`, `gearPolice`, `gearMedic`, `gearMechanic`, `invVirtual`, `alive`, `arrested`, `banned`, `cash`, `bank`, `teamkills`, `kills`, `deaths`, `xp`, `levelPlayer`, `levelPolice`, `levelMedic`, `levelMech`, `playtime`, `firstconnect`, `lastconnect`, `lastip`, `gang_id`) VALUES (1,'76561198216442289','Prof Bildungsstop',0,0,'','\"[]\"','\"1\"',0,'\"[[`hgun_PDW2000_Holo_snds_F`,`muzzle_snds_L`,``,`optic_Holosight_smg`,[`30Rnd_9x21_Mag`,15],[],``],[],[`hgun_Pistol_heavy_02_Yorris_F`,``,``,`optic_Yorris`,[`6Rnd_45ACP_Cylinder`,5],[],``],[`U_OrestesBody`,[]],[`V_BandollierB_cbr`,[]],[`B_Carryall_oli`,[[`FirstAidKit`,2],[`30Rnd_9x21_Mag`,8,30],[`6Rnd_45ACP_Cylinder`,8,6],[`30Rnd_9x21_Mag`,1,7],[`6Rnd_45ACP_Cylinder`,1,3]]],`H_Beret_02`,`G_Sport_Blackred`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`ItemGPS`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGoggles`]]\"','\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"','\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"','\"[[`hgun_PDW2000_Holo_snds_F`,`muzzle_snds_L`,``,`optic_Holosight_smg`,[`30Rnd_9x21_Mag`,30],[],``],[],[`hgun_Pistol_heavy_02_Yorris_F`,``,``,`optic_Yorris`,[`6Rnd_45ACP_Cylinder`,6],[],``],[`U_OrestesBody`,[]],[`V_BandollierB_cbr`,[]],[`B_Carryall_oli`,[[`FirstAidKit`,2],[`30Rnd_9x21_Mag`,9,30],[`6Rnd_45ACP_Cylinder`,9,6]]],`H_Beret_02`,`G_Sport_Blackred`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`ItemGPS`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGoggles`]]\"','\"[]\"',0,'\"[]\"',0,0,0,0,0,0,0,0,0,0,0,000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,1587856593,0,NULL,NULL),(2,'asdasaasadff','Petear',0,0,NULL,'\"[]\"','\"1\"',0,'\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[]\"\"\"',0,'\"[]\"',0,124,1000,0,0,0,0,0,0,0,0,000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,1587856790,0,NULL,NULL),(3,'76561198248607510','lkjh',0,0,NULL,'\"[]\"','\"1\"',0,'\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"','\"\"\"[]\"\"\"',0,'\"[]\"',0,124,1000,0,0,0,0,0,0,0,0,000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,1588086769,0,NULL,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03 12:18:05
