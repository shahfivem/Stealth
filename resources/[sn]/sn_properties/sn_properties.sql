DROP table IF EXISTS `properties`;

CREATE TABLE IF NOT EXISTS `properties` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `owner` varchar(50) DEFAULT NULL,
    `coords` JSON NULL DEFAULT NULL,
    `label` VARCHAR(100) NULL,
    `zone` VARCHAR(100) NULL,
    `keys` JSON NULL DEFAULT NULL,
    `wall_color` varchar(50) DEFAULT NULL,
    `price` int(11) NOT NULL DEFAULT 0,
    `type` varchar(50) NOT NULL,
    `shell` JSON DEFAULT NULL,
    `ipl` varchar(50) DEFAULT NULL,
    `doors` JSON NULL DEFAULT NULL,
    `furniture` JSON NULL DEFAULT NULL,
    `house_zone` JSON NULL DEFAULT NULL,
    `garage_zone` JSON NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP table IF EXISTS `motorhomes`;

CREATE TABLE IF NOT EXISTS `motorhomes` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `plate` varchar(50) NOT NULL,
    `keys` JSON NULL DEFAULT NULL,
    `wall_color` varchar(50) DEFAULT NULL,
    `furniture` JSON NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;