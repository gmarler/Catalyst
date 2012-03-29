-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Thu Mar 29 08:23:29 2012
-- 

BEGIN TRANSACTION;

--
-- Table: hosts
--
DROP TABLE hosts;

CREATE TABLE hosts (
  host_id INTEGER PRIMARY KEY NOT NULL,
  hostname VARCHAR(255) NOT NULL,
  last_modified DATETIME NOT NULL
);

--
-- Table: osrels
--
DROP TABLE osrels;

CREATE TABLE osrels (
  osrel_id INTEGER PRIMARY KEY NOT NULL,
  entire_version VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  fk_host_id INT(11) NOT NULL
);

--
-- Table: appgroups
--
DROP TABLE appgroups;

CREATE TABLE appgroups (
  appgroup_id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  fk_host_id INT(11) NOT NULL,
  FOREIGN KEY(fk_host_id) REFERENCES hosts(host_id)
);

CREATE INDEX appgroups_idx_fk_host_id ON appgroups (fk_host_id);

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
