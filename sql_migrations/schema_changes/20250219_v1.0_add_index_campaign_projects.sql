-- ==============================================
-- SCHEMA UPDATE: Add INDEX on campaign_projects.campaign_id
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-19  
-- Purpose: Creates an index on campaign_projects.campaign_id to improve query performance
-- ==============================================

BEGIN;

CREATE INDEX idx_campaign_projects_campaign ON campaign_projects (campaign_id);

COMMIT;
