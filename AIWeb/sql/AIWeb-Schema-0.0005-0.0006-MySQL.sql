-- Convert schema 'sql/AIWeb-Schema-0.0005-MySQL.sql' to 'AIWeb::Schema v0.0006':;

BEGIN;

ALTER TABLE host_appgroup DROP FOREIGN KEY host_appgroup_fk_host_id;

ALTER TABLE host_appgroup ADD CONSTRAINT host_appgroup_fk_host_id FOREIGN KEY (host_id) REFERENCES hosts (host_id) ON DELETE CASCADE;


COMMIT;

