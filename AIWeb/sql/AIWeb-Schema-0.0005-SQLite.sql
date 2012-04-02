-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Sun Apr  1 12:04:26 2012
-- 

BEGIN TRANSACTION;

--
-- Table: appgroups
--
DROP TABLE appgroups;

CREATE TABLE appgroups (
  appgroup_id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

--
-- Table: hosts
--
DROP TABLE hosts;

CREATE TABLE hosts (
  host_id INTEGER PRIMARY KEY NOT NULL,
  hostname VARCHAR(255) NOT NULL,
  last_modified datetime NOT NULL
);

--
-- Table: osrels
--
DROP TABLE osrels;

CREATE TABLE osrels (
  osrel_id INTEGER PRIMARY KEY NOT NULL,
  entire_version VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL
);

--
-- Table: host_appgroup
--
DROP TABLE host_appgroup;

CREATE TABLE host_appgroup (
  appgroup_id INT(11) NOT NULL,
  host_id INT(11) NOT NULL,
  PRIMARY KEY (appgroup_id, host_id),
  FOREIGN KEY(appgroup_id) REFERENCES appgroups(appgroup_id),
  FOREIGN KEY(host_id) REFERENCES hosts(host_id)
);

CREATE INDEX host_appgroup_idx_appgroup_id ON host_appgroup (appgroup_id);

CREATE INDEX host_appgroup_idx_host_id ON host_appgroup (host_id);

--
-- Table: host_osrel
--
DROP TABLE host_osrel;

CREATE TABLE host_osrel (
  osrel_id INT(11) NOT NULL,
  host_id INT(11) NOT NULL,
  PRIMARY KEY (osrel_id, host_id),
  FOREIGN KEY(host_id) REFERENCES hosts(host_id),
  FOREIGN KEY(osrel_id) REFERENCES osrels(osrel_id)
);

CREATE INDEX host_osrel_idx_host_id ON host_osrel (host_id);

CREATE INDEX host_osrel_idx_osrel_id ON host_osrel (osrel_id);

COMMIT;
