--liquibase formatted sql

--changeset shop-management:schema-002
--comment: Add OAuth2 fields to users table

ALTER TABLE users
    ALTER COLUMN password DROP NOT NULL;

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS provider VARCHAR(20) NOT NULL DEFAULT 'LOCAL',
    ADD COLUMN IF NOT EXISTS provider_id VARCHAR(255),
    ADD COLUMN IF NOT EXISTS avatar_url VARCHAR(500);

CREATE INDEX IF NOT EXISTS idx_users_provider_provider_id ON users(provider, provider_id);
