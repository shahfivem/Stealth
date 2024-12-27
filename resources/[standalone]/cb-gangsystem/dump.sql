-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table qbcoreframework_6d59dd.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(10) NOT NULL,
  `name` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `balance` int(11) NOT NULL DEFAULT 0,
  `home_turf` varchar(255) DEFAULT NULL,
  `last_blueprint` int(20) DEFAULT 0,
  `last_gift` int(20) DEFAULT 0,
  `last_home_turf` int(20) DEFAULT 0,
  `penalty` int(20) DEFAULT 0,
  `last_bm_shop` int(20) DEFAULT 0,
  `storage` varchar(50) DEFAULT NULL,
  `boss_menu` varchar(50) DEFAULT NULL,
  `color` int(11) DEFAULT 0,
  `purchased_hints` varchar(255) DEFAULT '[]',
  `ranks` varchar(255) DEFAULT ' Prospect, Member, Enforcer, Treasurer, Sergeant at Arms, Vice President, President',
  `image` varchar(255) DEFAULT NULL,
  `leader_cid` varchar(50) DEFAULT NULL,
  `last_active` varchar(50) DEFAULT NULL,
  `war` int(20) DEFAULT 0,
  `warOutfit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'NA',
  `prevalence` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gangs_ui_tag` (`tag`),
  UNIQUE KEY `gangs_ui_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_6d59dd.gangs: ~10 rows (approximately)
REPLACE INTO `gangs` (`id`, `tag`, `name`, `created_at`, `balance`, `home_turf`, `last_blueprint`, `last_gift`, `last_home_turf`, `penalty`, `last_bm_shop`, `storage`, `boss_menu`, `color`, `purchased_hints`, `ranks`, `image`, `leader_cid`, `last_active`, `war`, `warOutfit`, `prevalence`) VALUES
	(39, 'crw', 'The Crew', '2024-08-06 00:01:27', 0, 'KOREAT', 0, 1726892823, 1727395008, 0, 0, 'vector3(-690.63, -878.44, 24.50)', NULL, 47, '[]', ' Prospect, Member,OG, Treasurer, Sergeant at Arms,Core, President', 'nui://ant-gangsystem/logos/logo.png', 'ABF02924', '10-03-2024 08:34', 0, 'NA', 0),
	(42, 'und', 'Underground', '2024-08-09 20:07:32', 0, 'RICHM', 0, 1725725506, 1723234452, 0, 0, NULL, NULL, 21, '[]', ' Prospect,Recruit,Assosciate,Member,Enforcer,Underboss,Boss', 'nui://ant-gangsystem/logos/logo.png', 'PDV27403', '10-02-2024 19:09', 0, 'NA', 0),
	(47, 'lsg', 'LosSangringos', '2024-08-15 04:29:56', 7563516, 'HAWICK', 0, 1727582468, 1725637018, 0, 0, 'vector3(-87.50, 373.36, 112.47)', NULL, 38, '[]', ' Prospect, Member, Enforcer, Treasurer, Sergeant at Arms, Vice President, President', 'nui://ant-gangsystem/logos/logo.png', 'SNW45230', '10-02-2024 19:25', 0, 'NA', 0),
	(54, 'vgf', 'Vanguard Firm', '2024-08-23 23:43:48', 0, 'SANDY', 0, 1727223751, 1724458295, 0, 0, 'vector3(1905.73, 3886.86, 33.36)', NULL, 27, '[]', ' Prospect, Member, Enforcer, Treasurer, Sergeant at Arms, Vice President, President', 'nui://ant-gangsystem/logos/logo.png', 'LDM10864', '10-02-2024 19:15', 0, 'NA', 0),
	(56, 'shd', 'Shadow Company', '2024-08-24 04:42:12', 78400, 'PALETO', 0, 1727829672, 1727389935, 0, 0, 'vector3(-236.92, 6228.77, 31.50)', NULL, 1, '[]', 'Associate, Member, Enforcer,Soldier,Capo,Underboss,Boss', 'nui://ant-gangsystem/logos/logo.png', 'ELA18160', '10-02-2024 22:07', 0, 'NA', 0),
	(57, 'sin', 'Sinister', '2024-08-24 05:11:20', 0, 'VESP', 0, 1727950454, 1724476357, 0, 0, NULL, NULL, 4, '[]', 'Dont Use,Underboss,Associates,Soldier,Caporegime,Consigliere,Boss', 'nui://ant-gangsystem/logos/logo.png', 'HDL30023', '10-03-2024 09:06', 0, 'NA', 0),
	(64, 'fmc', 'Fallen Angels MC', '2024-09-04 05:18:03', 90606, 'GRAPES', 0, 1727932903, 1725477423, 0, 0, 'vector3(2073.67, 5077.08, 41.95)', NULL, 7, '[2]', ' Prospect, Member, Enforcer,RC/TREASURER, Sergeant at Arms, Vice President, President', 'nui://ant-gangsystem/logos/logo.png', 'TWR78887', '10-03-2024 09:00', 0, 'NA', 0),
	(66, 'k.c', 'Kage Collective', '2024-09-25 01:31:24', 0, 'MIRR', 0, 1727626005, 1727910660, 0, 0, 'vector3(-1276.63, 618.57, 139.26)', NULL, 15, '[]', ' Prospect, Member, Enforcer, Treasurer, Sergeant at Arms, Vice President, President', 'nui://ant-gangsystem/logos/logo.png', 'GPD15668', '10-03-2024 09:01', 0, 'NA', 0),
	(67, 'gsf', 'G.S.F', '2024-09-28 18:24:59', 0, 'STRAW', 0, 1727549655, 1727549285, 0, 0, 'vector3(-10.16, -1430.15, 31.10)', NULL, 2, '[1]', 'Soldier,Goon,G,Enforcer,Shotcaller,Vice OG,OG', 'nui://ant-gangsystem/logos/logo.png', 'YRH96653', '10-03-2024 08:09', 0, 'NA', 0),
	(68, '762', '7.62', '2024-10-02 17:05:19', 0, 'MORN', 0, 1727890680, 1727933498, 0, 0, 'vector3(-1862.85, -329.49, 57.08)', NULL, 4, '[3]', 'Hangaround, Member,Top 10,Captains,Head Captain,Underboss,Boss', 'nui://ant-gangsystem/logos/logo.png', 'BIO48552', '10-03-2024 08:10', 0, 'NA', 0),
	(69, 'grm', 'Reapers', '2024-10-04 05:14:03', 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, 39, '[]', ' Prospect, Member, Enforcer, Treasurer, Sergeant at Arms, Vice President, President', 'nui://cb-gangsystem/logos/logo.png', 'I54C5TOI', NULL, 0, 'NA', 0);

-- Dumping structure for table qbcoreframework_6d59dd.gang_perms
CREATE TABLE IF NOT EXISTS `gang_perms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang_id` int(11) NOT NULL,
  `add_money_perms` varchar(255) DEFAULT '[]',
  `remove_money_perms` varchar(255) DEFAULT '[]',
  `declare_turf_perms` varchar(255) DEFAULT '[]',
  `move_gang_storage` varchar(255) DEFAULT '[]',
  `access_storage` varchar(50) DEFAULT '[]',
  `add_members` varchar(50) DEFAULT '[]',
  `rename_gang` varchar(50) DEFAULT '[]',
  `manage_ranks` varchar(50) DEFAULT '[]',
  `change_color` varchar(255) DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `gang_id` (`gang_id`),
  CONSTRAINT `gang_perms_ibfk_1` FOREIGN KEY (`gang_id`) REFERENCES `gangs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_6d59dd.gang_perms: ~10 rows (approximately)
REPLACE INTO `gang_perms` (`id`, `gang_id`, `add_money_perms`, `remove_money_perms`, `declare_turf_perms`, `move_gang_storage`, `access_storage`, `add_members`, `rename_gang`, `manage_ranks`, `change_color`) VALUES
	(7, 39, '[5,2]', '[5,2]', '[5]', '[5]', '[5,2]', '[]', '[]', '[]', '[]'),
	(8, 42, '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]'),
	(9, 47, '[5]', '[5]', '[]', '[5]', '[5]', '[]', '[]', '[]', '[5]'),
	(10, 54, '[5]', '[5]', '[]', '[5]', '[5]', '[]', '[]', '[]', '[]'),
	(11, 56, '[5]', '[5]', '[5]', '[5]', '[5]', '[]', '[]', '[]', '[5]'),
	(12, 57, '[5,4,1]', '[5,1]', '[5]', '[5]', '[5,4,1]', '[]', '[]', '[]', '[5]'),
	(13, 64, '[3]', '[3]', '[5,3,4]', '[5,3,4]', '[5,3,4,2,1,0]', '[]', '[]', '[]', '[4,5,3]'),
	(14, 66, '[5,4,3,2]', '[5,3]', '[5]', '[5,3]', '[5,4,3,1]', '[]', '[]', '[]', '[5]'),
	(15, 67, '[5,0,4,1,2,3]', '[5,4]', '[5]', '[5,4]', '[5,4]', '[]', '[]', '[]', '[5]'),
	(16, 68, '[5,1,2,3,4]', '[5]', '[5]', '[5]', '[5,1,2,3,4]', '[]', '[]', '[]', '[5]'),
	(22, 69, '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]', '[]');

-- Dumping structure for table qbcoreframework_6d59dd.gang_rivalries
CREATE TABLE IF NOT EXISTS `gang_rivalries` (
  `zone` varchar(255) DEFAULT NULL,
  `escrow` int(11) DEFAULT NULL,
  `competition` varchar(255) DEFAULT '[]',
  `started` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_6d59dd.gang_rivalries: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_6d59dd.gang_wars
CREATE TABLE IF NOT EXISTS `gang_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `declareeGangID` int(11) NOT NULL,
  `gangID` int(11) NOT NULL,
  `warType` varchar(50) NOT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `startTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL,
  `warStatus` varchar(20) DEFAULT 'Active',
  `declareeScore` int(11) DEFAULT 0,
  `gangScore` int(11) DEFAULT 0,
  `surrenderGang` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_6d59dd.gang_wars: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_6d59dd.gang_zones
CREATE TABLE IF NOT EXISTS `gang_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `gang_id` int(11) NOT NULL,
  `loyalty` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `gang_zones_fk_id` (`gang_id`),
  CONSTRAINT `gang_zones_fk_id` FOREIGN KEY (`gang_id`) REFERENCES `gangs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_6d59dd.gang_zones: ~29 rows (approximately)
REPLACE INTO `gang_zones` (`id`, `name`, `gang_id`, `loyalty`) VALUES
	(966, 'DAVIS', 39, 0),
	(967, 'SLAB', 39, 0),
	(982, 'PALETO', 42, 0),
	(1032, 'WVINE', 47, 59),
	(1034, 'HAWICK', 47, 57),
	(1040, 'SANDY', 54, 211),
	(1041, 'VESP', 57, 340),
	(1069, 'DTVINE', 47, 72),
	(1077, 'HARMO', 54, 200),
	(1081, 'GRAPES', 64, 568),
	(1115, 'ROCKF', 54, 0),
	(1126, 'KOREAT', 39, 116),
	(1127, 'RICHM', 42, 10),
	(1129, 'CHIL', 66, 104),
	(1130, 'PALETO', 56, 647),
	(1131, 'STAB', 64, 54),
	(1132, 'VCANA', 57, 171),
	(1134, 'STRAW', 67, 92),
	(1135, 'CHAMH', 67, 71),
	(1137, 'DAVIS', 67, 68),
	(1138, 'ROCKF', 47, 5),
	(1142, 'DELPE', 68, 239),
	(1144, 'VESP', 68, 412),
	(1145, 'VCANA', 68, 291),
	(1146, 'ROCKF', 68, 27),
	(1147, 'MORN', 68, 129),
	(1148, 'BURTON', 68, 16),
	(1149, 'MIRR', 66, 219),
	(1150, 'RICHM', 66, 7);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
