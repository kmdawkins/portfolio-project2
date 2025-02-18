-- ==============================================
-- SCHEMA UPDATE: Dropped company_name and company_legal_entity from the campaigns table
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-18  
-- Purpose: Drops company_name and company_legal_entity to normalize and optimize database querying
-- ==============================================

BEGIN;

ALTER TABLE campaigns
DROP COLUMN company_name,
DROP COLUMN company_legal_entity;

COMMIT;
