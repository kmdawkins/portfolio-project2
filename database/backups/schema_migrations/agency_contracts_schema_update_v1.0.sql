-- ==============================================
-- SCHEMA UPDATE: Added agency_id and dropped agency_name from agency_contracts table 
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-18  
-- Purpose: Adds agency_id to normalize and optimize database querying
-- ==============================================

BEGIN;

-- Drop old agency_name column
ALTER TABLE agency_contracts
DROP COLUMN agency_name;

-- Add agency_id as a foreign key
ALTER TABLE agency_contracts
ADD COLUMN agency_id INT NOT NULL REFERENCES agencies(agency_id);

COMMIT;

