-- Convert schema 'sql/AIWeb-Schema-0.0004-SQLite.sql' to 'sql/AIWeb-Schema-0.0005-SQLite.sql':;

BEGIN;

CREATE TABLE host_appgroup (
  appgroup_id INT(11) NOT NULL,
  host_id INT(11) NOT NULL,
  PRIMARY KEY (appgroup_id, host_id),
  FOREIGN KEY(appgroup_id) REFERENCES appgroups(appgroup_id),
  FOREIGN KEY(host_id) REFERENCES hosts(host_id)
);

CREATE INDEX host_appgroup_idx_appgroup_id ON host_appgroup (appgroup_id);

CREATE INDEX host_appgroup_idx_host_id ON host_appgroup (host_id);

CREATE TEMPORARY TABLE appgroups_temp_alter (
  appgroup_id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

INSERT INTO appgroups_temp_alter SELECT appgroup_id, name FROM appgroups;

DROP TABLE appgroups;

CREATE TABLE appgroups (
  appgroup_id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

INSERT INTO appgroups SELECT appgroup_id, name FROM appgroups_temp_alter;

DROP TABLE appgroups_temp_alter;


COMMIT;

