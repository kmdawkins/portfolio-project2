-- ==============================================
-- SCHEMA UPDATE: Dropped campaigns table
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-19  
-- Purpose: Dropped empty campaigns table to correct SQL script execution errors
-- ==============================================

BEGIN;

DROP TABLE IF EXISTS campaigns CASCADE;

COMMIT;