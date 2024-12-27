CREATE TABLE IF NOT EXISTS `sd_beekeeping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hive_type` varchar(50) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci CHECK (json_valid(`options`)),
  `data` longtext DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `collaborators` JSON DEFAULT NULL,
  `durability` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74;
