-- ==============================================
-- SCHEMA UPDATE: Added UNIQUE constraint to agencies table
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-18  
-- Purpose: Adds UNIQUE constraint to agencies.agencies_name
-- ==============================================

BEGIN;

ALTER TABLE agencies
ADD CONSTRAINT unique_agency_name UNIQUE (agency_name);

COMMIT;
