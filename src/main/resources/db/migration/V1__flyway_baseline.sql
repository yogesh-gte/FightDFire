-- Flyway introduction.
-- Entity tables remain managed by Hibernate ddl-auto for now.
-- New durable schema changes should be added as V2+, V3+, ...

CREATE TABLE IF NOT EXISTS schema_meta (
    version_key VARCHAR(64) NOT NULL PRIMARY KEY,
    applied_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes VARCHAR(512) NULL
);

INSERT INTO schema_meta (version_key, notes)
VALUES ('flyway_introduced', 'Flyway enabled; Hibernate still syncs entity tables until cutover to validate+migrations')
ON DUPLICATE KEY UPDATE notes = VALUES(notes);
