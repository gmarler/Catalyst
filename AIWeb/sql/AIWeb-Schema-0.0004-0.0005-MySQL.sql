-- Convert schema 'sql/AIWeb-Schema-0.0004-MySQL.sql' to 'AIWeb::Schema v0.0005':;

BEGIN;

SET foreign_key_checks=0;

CREATE TABLE `host_appgroup` (
  `appgroup_id` integer(11) NOT NULL,
  `host_id` integer(11) NOT NULL,
  INDEX `host_appgroup_idx_appgroup_id` (`appgroup_id`),
  INDEX `host_appgroup_idx_host_id` (`host_id`),
  PRIMARY KEY (`appgroup_id`, `host_id`),
  CONSTRAINT `host_appgroup_fk_appgroup_id` FOREIGN KEY (`appgroup_id`) REFERENCES `appgroups` (`appgroup_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `host_appgroup_fk_host_id` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`host_id`)
) ENGINE=InnoDB;

SET foreign_key_checks=1;

ALTER TABLE appgroups DROP FOREIGN KEY appgroups_fk_fk_host_id,
                      DROP INDEX appgroups_idx_fk_host_id,
                      DROP COLUMN fk_host_id;


COMMIT;

