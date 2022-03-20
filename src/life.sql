/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : localhost:3306
 Source Schema         : life

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 27/05/2020 17:34:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for default_player
-- ----------------------------
DROP TABLE IF EXISTS `default_player`;
CREATE TABLE `default_player`  (
  `key` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastUpdate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of default_player
-- ----------------------------
INSERT INTO `default_player` VALUES ('bank', '1000', '2020-04-26 00:37:42');
INSERT INTO `default_player` VALUES ('cash', '124', '2020-04-26 01:01:58');
INSERT INTO `default_player` VALUES ('gearCivilian', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '2020-04-26 00:35:54');
INSERT INTO `default_player` VALUES ('gearMechanic', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '2020-04-26 00:36:32');
INSERT INTO `default_player` VALUES ('gearMedic', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '2020-04-26 00:36:29');
INSERT INTO `default_player` VALUES ('gearPolice', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '2020-04-26 00:36:26');
INSERT INTO `default_player` VALUES ('invVirtual', '\"\"\"[]\"\"\"', '2020-04-26 00:37:21');

-- ----------------------------
-- Table structure for gang
-- ----------------------------
DROP TABLE IF EXISTS `gang`;
CREATE TABLE `gang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for garage
-- ----------------------------
DROP TABLE IF EXISTS `garage`;
CREATE TABLE `garage`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `size` int(11) NOT NULL DEFAULT 0,
  `owner_type` enum('PLAYER','HOUSE','GANG','MEDIC','MECHANIC','POLICE','') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'PLAYER' COMMENT 'a garage can be owned by a player, gang or a house, etc.',
  `owner_id` int(11) UNSIGNED NOT NULL COMMENT 'the Key of the player',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of garage
-- ----------------------------
INSERT INTO `garage` VALUES (1, 10, 'PLAYER', 1);
INSERT INTO `garage` VALUES (2, 10, 'PLAYER', 2);
INSERT INTO `garage` VALUES (3, 10, 'PLAYER', 3);

-- ----------------------------
-- Table structure for garagevehicle
-- ----------------------------
DROP TABLE IF EXISTS `garagevehicle`;
CREATE TABLE `garagevehicle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Internal ID of Vehicle for identification',
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'classname of a3 vehicle',
  `nameDisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `canSpawn` tinyint(255) NULL DEFAULT 1 COMMENT 'default 1 | could be disabled so no ingame spawn is possible',
  `priceBuy` int(11) NULL DEFAULT NULL,
  `ownerID` int(11) UNSIGNED NOT NULL COMMENT 'garage owner if null no garage and will be removed',
  `inventoryVirt` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'default \"[]\"',
  `fuel` float(10, 0) NULL DEFAULT 1 COMMENT 'default 1',
  `hitInfo` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `cargoBackpack` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `cargoItem` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `cargoWeapon` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `cargoMagazine` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `turretWeapon` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `turretAmmo` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `dateInsert` varchar(0) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT unix_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `garage`(`ownerID`) USING BTREE,
  CONSTRAINT `garage` FOREIGN KEY (`ownerID`) REFERENCES `garage` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner` int(10) UNSIGNED NOT NULL,
  `ownerType` enum('GANG','PLAYER','COMPANY') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'PLAYER',
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nameCustom` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `position` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, 1, 'PLAYER', 'Land_House_2W03_F', 'KrassesHaus', '\"\"\"[1,1,1]\"\"\"');

-- ----------------------------
-- Table structure for housefurniture
-- ----------------------------
DROP TABLE IF EXISTS `housefurniture`;
CREATE TABLE `housefurniture`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `houseID` int(10) UNSIGNED NOT NULL COMMENT 'FK',
  `position` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pos in the house',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'upgradeable?',
  `size` int(10) UNSIGNED NULL DEFAULT 0 COMMENT 'upgradeable?',
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoItem` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoWeapon` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoMagazine` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cargoBackpack` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `virtInventory` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `houseID`(`houseID`) USING BTREE,
  CONSTRAINT `houseID` FOREIGN KEY (`houseID`) REFERENCES `house` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of housefurniture
-- ----------------------------
INSERT INTO `housefurniture` VALUES (1, 1, '\"\"\"[1,2,3]\"\"\"', '1', 1, 'Land_ShelvesMetal_F', '\"\"\"[]\"\"\"', '\"\"\"[]\"\"\"', '\"\"\"[]\"\"\"', '\"\"\"[]\"\"\"', '\"\"\"[]\"\"\"');

-- ----------------------------
-- Table structure for list_item_types
-- ----------------------------
DROP TABLE IF EXISTS `list_item_types`;
CREATE TABLE `list_item_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_item_types
-- ----------------------------
INSERT INTO `list_item_types` VALUES (1, 'WEAPON');
INSERT INTO `list_item_types` VALUES (2, 'EDIBLE');
INSERT INTO `list_item_types` VALUES (3, 'VEST');
INSERT INTO `list_item_types` VALUES (4, 'HEAD');

-- ----------------------------
-- Table structure for list_items
-- ----------------------------
DROP TABLE IF EXISTS `list_items`;
CREATE TABLE `list_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'FK',
  `isVirtual` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `nameClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nameDisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `priceBuy` int(255) NOT NULL,
  `priceSell` int(255) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_items
-- ----------------------------
INSERT INTO `list_items` VALUES (1, '2', 1, 'bottleWater', 'Wasserflasche', 2, 1);
INSERT INTO `list_items` VALUES (2, '2', 1, 'bottleCola', 'Colaflasche', 3, 1);

-- ----------------------------
-- Table structure for list_maps
-- ----------------------------
DROP TABLE IF EXISTS `list_maps`;
CREATE TABLE `list_maps`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `nameMap` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_maps
-- ----------------------------
INSERT INTO `list_maps` VALUES (1, 'altis');
INSERT INTO `list_maps` VALUES (2, 'tanoa');
INSERT INTO `list_maps` VALUES (3, 'malden');
INSERT INTO `list_maps` VALUES (4, 'stratis');

-- ----------------------------
-- Table structure for list_servers
-- ----------------------------
DROP TABLE IF EXISTS `list_servers`;
CREATE TABLE `list_servers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `map` int(10) UNSIGNED NOT NULL COMMENT 'FK',
  `ipv4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'IPv4 or hostname',
  `ipv6` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `port` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `map`(`map`) USING BTREE,
  CONSTRAINT `list_servers_ibfk_1` FOREIGN KEY (`map`) REFERENCES `list_maps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_servers
-- ----------------------------
INSERT INTO `list_servers` VALUES (1, 'ALTIS LIFE SERVER#01 ONE-UNIT.NET JOIN NOW TO GET STARTED', 1, '127.0.0.1', NULL, 2304);

-- ----------------------------
-- Table structure for list_shop_items
-- ----------------------------
DROP TABLE IF EXISTS `list_shop_items`;
CREATE TABLE `list_shop_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `shop` int(10) UNSIGNED NOT NULL COMMENT 'FK',
  `item` int(10) UNSIGNED NOT NULL COMMENT 'FK',
  `stock` int(255) NOT NULL,
  `priceBuy` int(255) NOT NULL,
  `priceSell` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shop`(`shop`) USING BTREE,
  INDEX `item`(`item`) USING BTREE,
  CONSTRAINT `shop` FOREIGN KEY (`shop`) REFERENCES `list_shops` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item` FOREIGN KEY (`item`) REFERENCES `list_items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_shop_items
-- ----------------------------
INSERT INTO `list_shop_items` VALUES (4, 1, 1, 3000, 12, 3);

-- ----------------------------
-- Table structure for list_shops
-- ----------------------------
DROP TABLE IF EXISTS `list_shops`;
CREATE TABLE `list_shops`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DBString\r\n',
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'not used yet',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DBString',
  `map` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'FK',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'DBString',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `map`(`map`) USING BTREE,
  CONSTRAINT `list_shops_ibfk_1` FOREIGN KEY (`map`) REFERENCES `list_maps` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of list_shops
-- ----------------------------
INSERT INTO `list_shops` VALUES (1, 'adminshop', NULL, 'UTIL', 1, NULL);
INSERT INTO `list_shops` VALUES (2, 'heftigershop', NULL, 'UTIL', 1, NULL);

-- ----------------------------
-- Table structure for player_alias
-- ----------------------------
DROP TABLE IF EXISTS `player_alias`;
CREATE TABLE `player_alias`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner`(`owner_id`) USING BTREE,
  CONSTRAINT `owner` FOREIGN KEY (`owner_id`) REFERENCES `players` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for player_servertransact
-- ----------------------------
DROP TABLE IF EXISTS `player_servertransact`;
CREATE TABLE `player_servertransact`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `player_id` int(10) UNSIGNED NOT NULL COMMENT 'FK',
  `steamid64` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'String',
  `serverFrom` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'String',
  `serverTo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'String',
  `vehicle` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String\r\n\r\n',
  `vehicleSkin` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String',
  `velocity` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBArray',
  `dateAdded` bigint(20) NULL DEFAULT unix_timestamp COMMENT 'unwichtig für A3S',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_id`(`player_id`) USING BTREE,
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `steamid64` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `a3name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `rankTeam` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `rankDonator` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `location` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBARRAY',
  `loggedAs` enum('"1"','"2"','"3"','"4"','{POL}') CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '\"1\"' COMMENT 'default CIVILIAN | logged as civ, cop, etc',
  `garageCivilian` int(255) NULL DEFAULT 0 COMMENT 'default 0 | FS --> also for Police / etc.?',
  `gearCivilian` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBARRAY',
  `gearPolice` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBARRAY',
  `gearMedic` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBARRAY',
  `gearMechanic` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBARRAY',
  `invVirtual` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBARRAY',
  `alive` tinyint(255) NULL DEFAULT 0 COMMENT 'default 0',
  `arrested` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'DBARRAY',
  `banned` tinyint(255) NULL DEFAULT 0 COMMENT 'default 0',
  `cash` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `bank` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `teamkills` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `kills` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `deaths` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `xp` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `levelPlayer` int(255) NULL DEFAULT 0 COMMENT 'default 0 | complete player is meant for civ /copy / med too --> global exp system incoming',
  `levelPolice` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `levelMedic` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `levelMech` int(255) NULL DEFAULT 0 COMMENT 'default 0',
  `playtime` bigint(255) UNSIGNED ZEROFILL NULL DEFAULT 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 COMMENT 'default 0',
  `firstconnect` bigint(255) NULL DEFAULT 0 COMMENT 'default 0',
  `lastconnect` bigint(255) NULL DEFAULT 0 COMMENT 'default 0',
  `lastip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gang_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gang`(`gang_id`) USING BTREE,
  CONSTRAINT `gang` FOREIGN KEY (`gang_id`) REFERENCES `gang` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (1, '76561198216442289', 'Prof Bildungsstop', 0, 0, '', '\"[]\"', '\"1\"', 0, '\"[[`hgun_PDW2000_Holo_snds_F`,`muzzle_snds_L`,``,`optic_Holosight_smg`,[`30Rnd_9x21_Mag`,15],[],``],[],[`hgun_Pistol_heavy_02_Yorris_F`,``,``,`optic_Yorris`,[`6Rnd_45ACP_Cylinder`,5],[],``],[`U_OrestesBody`,[]],[`V_BandollierB_cbr`,[]],[`B_Carryall_oli`,[[`FirstAidKit`,2],[`30Rnd_9x21_Mag`,8,30],[`6Rnd_45ACP_Cylinder`,8,6],[`30Rnd_9x21_Mag`,1,7],[`6Rnd_45ACP_Cylinder`,1,3]]],`H_Beret_02`,`G_Sport_Blackred`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`ItemGPS`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGoggles`]]\"', '\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"', '\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"', '\"[[`hgun_PDW2000_Holo_snds_F`,`muzzle_snds_L`,``,`optic_Holosight_smg`,[`30Rnd_9x21_Mag`,30],[],``],[],[`hgun_Pistol_heavy_02_Yorris_F`,``,``,`optic_Yorris`,[`6Rnd_45ACP_Cylinder`,6],[],``],[`U_OrestesBody`,[]],[`V_BandollierB_cbr`,[]],[`B_Carryall_oli`,[[`FirstAidKit`,2],[`30Rnd_9x21_Mag`,9,30],[`6Rnd_45ACP_Cylinder`,9,6]]],`H_Beret_02`,`G_Sport_Blackred`,[`Rangefinder`,``,``,``,[],[],``],[`ItemMap`,`ItemGPS`,`ItemRadio`,`ItemCompass`,`ItemWatch`,`NVGoggles`]]\"', '\"[]\"', 0, '\"[]\"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1587856593, 0, NULL, NULL);
INSERT INTO `players` VALUES (2, 'asdasaasadff', 'Petear', 0, 0, NULL, '\"[]\"', '\"1\"', 0, '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[]\"\"\"', 0, '\"[]\"', 0, 124, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1587856790, 0, NULL, NULL);
INSERT INTO `players` VALUES (3, '76561198248607510', 'lkjh', 0, 0, NULL, '\"[]\"', '\"1\"', 0, '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[[],[],[],[`U_C_Poloshirt_blue`,[]],[],[],``,``,[],[`ItemMap`,``,``,`ItemCompass`,`ItemWatch`,``]]\"\"\"', '\"\"\"[]\"\"\"', 0, '\"[]\"', 0, 124, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1588086769, 0, NULL, NULL);

-- ----------------------------
-- Procedure structure for spAddNewUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `spAddNewUser`;
delimiter ;;
CREATE PROCEDURE `spAddNewUser`(IN steamID CHAR(20),
	IN ingamename CHAR(30))
BEGIN

	DECLARE default_cash 						INT DEFAULT 0;
	DECLARE default_bank 						INT DEFAULT 0;
	DECLARE default_gearCivilian 		TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_gearPolice 			TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_gearMedic				TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_gearMechanic		TEXT DEFAULT '"""[[],[],[],[],[],[],``,``,[],[``,``,``,``,``,``]]"""';
	DECLARE default_invVirt					TEXT DEFAULT '"""[]"""';
	
	SET default_cash 						= CAST((SELECT dp.value FROM default_player dp WHERE dp.key = 'cash') AS INT);
	SET default_bank 						= CAST((SELECT dp.value FROM default_player dp WHERE dp.key = 'bank') AS INT);
	SET default_gearCivilian 		= (SELECT dp.value FROM default_player dp WHERE dp.key = 'gearCivilian');
	SET default_gearPolice 			= (SELECT dp.value FROM default_player dp WHERE dp.key = 'gearPolice');
	SET default_gearMedic 			= (SELECT dp.value FROM default_player dp WHERE dp.key = 'gearMedic');
	SET default_gearMechanic 		= (SELECT dp.value FROM default_player dp WHERE dp.key = 'gearMechanic');
	SET default_invVirt 		= (SELECT dp.value FROM default_player dp WHERE dp.key = 'invVirtual');

	IF ((SELECT COUNT(id) FROM players WHERE steamid64 = steamID) = 0) THEN
		INSERT INTO players (steamid64, a3name, location, bank, cash, gearCivilian, gearPolice, gearMedic, gearMechanic, invVirtual, arrested,  firstconnect) VALUES 
												(steamID, ingamename, '"[]"', default_bank, default_cash, default_gearCivilian, default_gearPolice, default_gearMedic, default_gearMechanic, default_invVirt, '"[]"', UNIX_TIMESTAMP(NOW()));
		INSERT INTO garage (size, owner_type, owner_id) VALUES (10, 'PLAYER', (SELECT id FROM players WHERE steamid64 = steamID));
	ELSE
		SELECT 'Player already exists!' as 'error';
	END IF;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for spDeleteOldsFromPlayerServertransact
-- ----------------------------
DROP PROCEDURE IF EXISTS `spDeleteOldsFromPlayerServertransact`;
delimiter ;;
CREATE PROCEDURE `spDeleteOldsFromPlayerServertransact`()
proc:BEGIN

	# declares
	DECLARE done INT DEFAULT FALSE;
  DECLARE date INT;
  DECLARE cur1 CURSOR FOR (SELECT dateAdded FROM player_servertransact WHERE TIMESTAMPDIFF(MINUTE, FROM_UNIXTIME(dateAdded), NOW()) > 10);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
  OPEN cur1;

  read_loop: LOOP
    FETCH cur1 INTO date;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
		
		DELETE FROM player_servertransact WHERE dateAdded = date;
		
		
  END LOOP;

  CLOSE cur1;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for spGetEconomyShopData
-- ----------------------------
DROP PROCEDURE IF EXISTS `spGetEconomyShopData`;
delimiter ;;
CREATE PROCEDURE `spGetEconomyShopData`(IN serverID INT(20))
BEGIN
	
	SELECT shops.id as 'shopID', shops.name as 'shopName', shops.class as 'shopClass', items.isVirtual as 'itemIsVirtual', items.nameClass as 'itemClass', items.nameDisplay as 'itemName', types.name as 'itemType', shopitems.priceBuy as 'itemPriceBuy', shopitems.priceSell as 'itemPriceSell', shopitems.stock as 'itemStock' FROM list_servers servers 
			LEFT JOIN list_shops shops ON servers.map = shops.map
			LEFT JOIN list_shop_items shopitems ON shops.id = shopitems.shop
			LEFT JOIN list_items items ON items.id = shopitems.item
			LEFT JOIN list_item_types types ON types.id = items.type
	WHERE servers.id = serverID;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for spGetPlayerGarageVehiclesByteSizes
-- ----------------------------
DROP PROCEDURE IF EXISTS `spGetPlayerGarageVehiclesByteSizes`;
delimiter ;;
CREATE PROCEDURE `spGetPlayerGarageVehiclesByteSizes`(IN steamID varchar(20))
BEGIN
	DECLARE nPlayerID INT UNSIGNED;
	DECLARE nGarageID INT UNSIGNED;

	DECLARE done INT DEFAULT FALSE;
	DECLARE a, b CHAR(200);
	DECLARE c INT;
	DECLARE curVehicles CURSOR FOR SELECT id, intid FROM life.garagevehicle WHERE ownerID = nGarageID;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	DROP TABLE IF EXISTS tblTMPplayerVehiclesDataSize;
	
	CREATE TEMPORARY TABLE tblTMPplayerVehiclesDataSize(
		id INT UNSIGNED,
		intid VARCHAR(20),
		size INT UNSIGNED
	);

	SET nPlayerID = (SELECT id from players WHERE steamid64 = steamID);
	SET nGarageID = (SELECT id FROM garage WHERE owner_id = nPlayerID AND owner_type = 'PLAYER');

	OPEN curVehicles;
	
	read_loop: LOOP
	
		FETCH curVehicles INTO a, b;
		
		INSERT INTO tblTMPplayerVehiclesDataSize (id, intid, size) VALUES (a, b, (SELECT SUM(
			COALESCE (CHAR_LENGTH(intid)					, 0)
		+	COALESCE (CHAR_LENGTH(nameClass)			, 0)
		+	COALESCE (CHAR_LENGTH(nameDisplay)		, 0)
		+	COALESCE (CHAR_LENGTH(canSpawn)				, 0)
		+	COALESCE (CHAR_LENGTH(priceBuy)     	, 0)
		+	COALESCE (CHAR_LENGTH(ownerID)      	, 0)
		+	COALESCE (CHAR_LENGTH(inventoryVirt)	, 0)
		+	COALESCE (CHAR_LENGTH(fuel)						, 0)
		+	COALESCE (CHAR_LENGTH(hitInfo)				, 0)
		+	COALESCE (CHAR_LENGTH(cargoBackpack)	, 0)
		+	COALESCE (CHAR_LENGTH(cargoItem)			, 0)
		+	COALESCE (CHAR_LENGTH(cargoWeapon)		, 0)
		+	COALESCE (CHAR_LENGTH(cargoMagazine)	, 0)
		+	COALESCE (CHAR_LENGTH(turretWeapon)		, 0)
		+	COALESCE (CHAR_LENGTH(turretAmmo)			, 0)
		
		
		) FROM garagevehicle WHERE id = a
		));
		
		IF done THEN
			LEAVE read_loop;
		END IF;
	
	
	
	END LOOP;	
	CLOSE curVehicles;




	SELECT * FROM tblTMPplayerVehiclesDataSize;
	
	
	DROP TABLE IF EXISTS tblTMPplayerVehiclesDataSize;



END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for spGetPlayerServerTransaction
-- ----------------------------
DROP PROCEDURE IF EXISTS `spGetPlayerServerTransaction`;
delimiter ;;
CREATE PROCEDURE `spGetPlayerServerTransaction`(IN parSteamID64 CHAR(20))
proc:BEGIN

	# check if player is in database
	IF (SELECT COUNT(id) FROM players WHERE steamid64 = parSteamID64) <= 0
	THEN
	
		select '01' as 'info';
		LEAVE proc;
	
	END IF;
	
	# check if player has an active transaction
	IF (SELECT COUNT(id) FROM player_servertransact WHERE steamid64 = parSteamID64) <= 0
	THEN
	
		select '02' as 'info';
		LEAVE proc;
	
	END IF;
	
	
	# Errorchecks done, now return the needed data
	
	SELECT steamid64, serverFrom, serverTo, vehicle, vehicleSkin, velocity FROM player_servertransact WHERE steamid64 = parSteamID64;
	DELETE FROM player_servertransact WHERE steamid64 = parSteamID64;
	
	
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for spGetVehiclesFromGarage
-- ----------------------------
DROP PROCEDURE IF EXISTS `spGetVehiclesFromGarage`;
delimiter ;;
CREATE PROCEDURE `spGetVehiclesFromGarage`(IN VehicleIDs VARCHAR(10000))
BEGIN

	DECLARE szStatement VARCHAR(4000);
	
	SET szStatement = CONCAT('SELECT * FROM garagevehicle WHERE id IN (',VehicleIDs, ')');
	PREPARE stmt FROM szStatement;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for spRequestPlayerTransactToServer
-- ----------------------------
DROP PROCEDURE IF EXISTS `spRequestPlayerTransactToServer`;
delimiter ;;
CREATE PROCEDURE `spRequestPlayerTransactToServer`(IN parSteamID64 CHAR(20),
	IN parServerFrom CHAR(20),
	IN parServerTo CHAR(30),
	IN parVehicle CHAR(100),
	IN parVehicleSkin CHAR(100),
	IN parVelocity CHAR (100))
BEGIN

	# check if player is there and if player is not doing another transaction
	IF (((SELECT COUNT(p.id) FROM players p WHERE p.steamid64 = steamID64) > 0)
				AND 	(SELECT COUNT(pst.id) FROM player_servertransact pst WHERE pst.steamid64 = parSteamID64) <= 0)
	THEN
			
			
			INSERT INTO player_servertransact (player_id, steamid64, serverFrom, serverTo, vehicle, vehicleSkin, velocity) VALUES
			((SELECT p.id from players p WHERE p.steamid64 = parSteamID64), parSteamID64, parServerFrom, parServerTo, parVehicle, parVehicleSkin, parVelocity);
	
	ELSE
	  
		SELECT 'ERROR' as '';
		
		
	END IF;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Event structure for deleteOldServerTransactions
-- ----------------------------
DROP EVENT IF EXISTS `deleteOldServerTransactions`;
delimiter ;;
CREATE EVENT `deleteOldServerTransactions`
ON SCHEDULE
EVERY '1' MINUTE STARTS '2020-05-03 01:29:52'
ON COMPLETION PRESERVE
DO CALL spDeleteOldsFromPlayerServertransact()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
