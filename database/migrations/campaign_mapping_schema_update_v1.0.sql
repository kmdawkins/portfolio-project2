-- ==============================================
-- SCHEMA UPDATE: Add INDEX on campaign.campaing_id
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-19  
-- Purpose: Creates an index on campaign.campaing_id to improve query performance
-- ==============================================

BEGIN;

CREATE INDEX idx_campaign_mapping_campaign ON campaign_mapping (campaign_id);

COMMIT;

