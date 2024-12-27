CREATE TABLE IF NOT EXISTS `ot_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `stamina` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `strength` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `driving` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `shooting` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `diving` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `drugs` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `crafting` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `gunsmithing` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `chemistry` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `woodcutting` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `mixology` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  `cooking` longtext DEFAULT '{"statlevel":0,"xp":0,"level":1}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
