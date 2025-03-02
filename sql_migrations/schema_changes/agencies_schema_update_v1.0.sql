-- ==============================================
-- SCHEMA UPDATE: Added agencies table to budget schema
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-18  
-- Purpose: Adds agencies to normalize pr agency details
-- ==============================================

BEGIN;

-- Create the agencies table
CREATE TABLE agencies (
    agency_id               SERIAL PRIMARY KEY,
    agency_code             TEXT GENERATED ALWAYS AS ('AGY' || LPAD(agency_id::TEXT, 4, '0')) STORED UNIQUE,
    agency_name             VARCHAR(75) NOT NULL CHECK (agency_name <> ''),
    agency_legal_entity     VARCHAR(75) NOT NULL CHECK (agency_legal_entity <> '')
);

-- Alter agency_contracts to reference agencies
ALTER TABLE agency_contracts
DROP COLUMN agency_name,
ADD COLUMN agency_id INT NOT NULL,
ADD CONSTRAINT fk_agency FOREIGN KEY (agency_id) REFERENCES agencies(agency_id);

COMMIT;