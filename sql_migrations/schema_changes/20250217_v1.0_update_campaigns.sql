-- ==============================================
-- SCHEMA UPDATE: Add column campaign_code to campaigns
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-17  
-- Purpose: Adds campaign_code as a generated column for uniqueness
-- ==============================================

BEGIN;

ALTER TABLE campaigns
ADD COLUMN campaign_code TEXT GENERATED ALWAYS AS ('CAMP' || LPAD(campaign_id::TEXT, 5, '0')) STORED UNIQUE;

COMMIT;