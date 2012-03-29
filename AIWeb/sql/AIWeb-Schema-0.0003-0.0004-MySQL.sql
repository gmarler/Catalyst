-- Convert schema 'sql/AIWeb-Schema-0.0003-MySQL.sql' to 'AIWeb::Schema v0.0004':;

BEGIN;

ALTER TABLE osrels DROP COLUMN fk_host_id;


COMMIT;

