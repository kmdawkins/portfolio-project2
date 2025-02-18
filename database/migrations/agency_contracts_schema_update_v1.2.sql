-- ==============================================
-- SCHEMA UPDATE: Add INDEX on contract_no
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-18  
-- Purpose: Creates an index on agency_contracts.contract_no to improve query performance
-- ==============================================

BEGIN;

CREATE INDEX idx_contract_no ON agency_contracts(contract_no);

COMMIT;
