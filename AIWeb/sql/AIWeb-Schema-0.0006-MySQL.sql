-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sun Apr  1 12:16:21 2012
-- 
SET foreign_key_checks=0;

DROP TABLE IF EXISTS `appgroups`;

--
-- Table: `appgroups`
--
CREATE TABLE `appgroups` (
  `appgroup_id` integer(11) unsigned NOT NULL auto_increment,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`appgroup_id`)
) ENGINE=InnoDB;

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

DROP TABLE IF EXISTS `osrels`;

--
-- Table: `osrels`
--
CREATE TABLE `osrels` (
  `osrel_id` integer(11) unsigned NOT NULL auto_increment,
  `entire_version` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`osrel_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `host_appgroup`;

--
-- Table: `host_appgroup`
--
CREATE TABLE `host_appgroup` (
  `appgroup_id` integer(11) NOT NULL,
  `host_id` integer(11) NOT NULL,
  INDEX `host_appgroup_idx_appgroup_id` (`appgroup_id`),
  INDEX `host_appgroup_idx_host_id` (`host_id`),
  PRIMARY KEY (`appgroup_id`, `host_id`),
  CONSTRAINT `host_appgroup_fk_appgroup_id` FOREIGN KEY (`appgroup_id`) REFERENCES `appgroups` (`appgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `host_appgroup_fk_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE CASCADE
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `host_osrel`;

--
-- Table: `host_osrel`
--
CREATE TABLE `host_osrel` (
  `osrel_id` integer(11) NOT NULL,
  `host_id` integer(11) NOT NULL,
  INDEX `host_osrel_idx_host_id` (`host_id`),
  INDEX `host_osrel_idx_osrel_id` (`osrel_id`),
  PRIMARY KEY (`osrel_id`, `host_id`),
  CONSTRAINT `host_osrel_fk_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`) ON DELETE CASCADE,
  CONSTRAINT `host_osrel_fk_osrel_id` FOREIGN KEY (`osrel_id`) REFERENCES `osrels` (`osrel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

SET foreign_key_checks=1;

