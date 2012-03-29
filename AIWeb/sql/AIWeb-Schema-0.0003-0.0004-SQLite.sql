-- Convert schema 'sql/AIWeb-Schema-0.0003-SQLite.sql' to 'sql/AIWeb-Schema-0.0004-SQLite.sql':;

BEGIN;

CREATE TEMPORARY TABLE osrels_temp_alter (
  osrel_id INTEGER PRIMARY KEY NOT NULL,
  entire_version VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL
);

INSERT INTO osrels_temp_alter SELECT osrel_id, entire_version, description FROM osrels;

DROP TABLE osrels;

CREATE TABLE osrels (
  osrel_id INTEGER PRIMARY KEY NOT NULL,
  entire_version VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL
);

INSERT INTO osrels SELECT osrel_id, entire_version, description FROM osrels_temp_alter;

DROP TABLE osrels_temp_alter;


COMMIT;

