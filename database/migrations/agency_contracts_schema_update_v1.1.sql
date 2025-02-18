-- ==============================================
-- SCHEMA UPDATE: Add UNIQUE and CHECK constraints
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-18  
-- Purpose: Adds a UNIQUE constraint to agency_contracts table 
--          and a CHECK constraint to ensure contract_no is not empty.
-- ==============================================

BEGIN;

-- Ensure each agency has unique contract numbers
ALTER TABLE agency_contracts
ADD CONSTRAINT unique_contract_per_agency UNIQUE (contract_no, agency_id);

-- Prevent empty contract_no values
ALTER TABLE agency_contracts
ADD CONSTRAINT contract_no_not_empty CHECK (contract_no <> '');

COMMIT;


