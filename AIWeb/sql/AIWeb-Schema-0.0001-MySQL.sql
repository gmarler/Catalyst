-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sun Mar 25 19:59:02 2012
-- 
SET foreign_key_checks=0;

DROP TABLE IF EXISTS `hosts`;

--
-- Table: `hosts`
--
CREATE TABLE `hosts` (
  `host_id` integer(11) unsigned NOT NULL auto_increment,
  `hostname` VARCHAR(255) NOT NULL,
  `last_modified` datetime NOT NULL,
  PRIMARY KEY (`host_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `appgroups`;

--
-- Table: `appgroups`
--
CREATE TABLE `appgroups` (
  `appgroup_id` integer(11) unsigned NOT NULL auto_increment,
  `name` VARCHAR(255) NOT NULL,
  `fk_host_id` integer(11) unsigned NOT NULL,
  INDEX `appgroups_idx_fk_host_id` (`fk_host_id`),
  PRIMARY KEY (`appgroup_id`),
  CONSTRAINT `appgroups_fk_fk_host_id` FOREIGN KEY (`fk_host_id`) REFERENCES `hosts` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `osrels`;

--
-- Table: `osrels`
--
CREATE TABLE `osrels` (
  `osrel_id` integer(11) unsigned NOT NULL auto_increment,
  `entire_version` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `fk_host_id` integer(11) unsigned NOT NULL,
  INDEX `osrels_idx_fk_host_id` (`fk_host_id`),
  PRIMARY KEY (`osrel_id`),
  CONSTRAINT `osrels_fk_fk_host_id` FOREIGN KEY (`fk_host_id`) REFERENCES `hosts` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

SET foreign_key_checks=1;

