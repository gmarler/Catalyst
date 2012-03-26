-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Sun Mar 25 19:59:02 2012
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
-- Table: osrels
--
DROP TABLE osrels;

CREATE TABLE osrels (
  osrel_id INTEGER PRIMARY KEY NOT NULL,
  entire_version VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  fk_host_id INT(11) NOT NULL,
  FOREIGN KEY(fk_host_id) REFERENCES hosts(host_id)
);

CREATE INDEX osrels_idx_fk_host_id ON osrels (fk_host_id);

COMMIT;
