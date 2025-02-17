-- ==============================================
-- SCHEMA UPDATE: Drop column region_name from campaigns
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-17  
-- Purpose: Drops the 'region_name' column from 'campaigns' to eliminate redundancy
-- and improve database normalization
-- ==============================================

BEGIN;

ALTER TABLE campaigns
DROP COLUMN region_name

COMMIT;