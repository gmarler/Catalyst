-- Convert schema 'sql/AIWeb-Schema-0.0002-MySQL.sql' to 'AIWeb::Schema v0.0003':;

BEGIN;

ALTER TABLE host_osrel DROP FOREIGN KEY host_osrel_fk_host_id;

ALTER TABLE host_osrel ADD CONSTRAINT host_osrel_fk_host_id FOREIGN KEY (host_id) REFERENCES hosts (host_id) ON DELETE CASCADE;


COMMIT;

