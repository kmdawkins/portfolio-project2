-- ==============================================
-- SCHEMA UPDATE: Drop column budget_account from campaign_mapping table
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-20  
-- Purpose: Drops campaign_mapping.budget_account to eliminate redundancy
-- and improve database normalization
-- ==============================================

BEGIN;

ALTER TABLE campaign_mapping
DROP COLUMN budget_account;

COMMIT;