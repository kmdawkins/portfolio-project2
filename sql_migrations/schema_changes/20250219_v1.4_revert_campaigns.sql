-- ==============================================
-- SCHEMA UPDATE: Revert campaign_id to VARCHAR
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-19  
-- Purpose: Reverts campaign_id back to VARCHAR(10) to align with existing foreign key relationships, 
-- minimize disruption, and move on to advanced SQL querying. 
-- Noting SERIAL and IDENTITY are industry best practices (approach used going forward).
-- ==============================================

BEGIN;

-- Drop existing campaigns table (ensure safe drop)
DROP TABLE IF EXISTS campaigns CASCADE;

-- Recreate campaigns table with campaign_id as VARCHAR(10)
CREATE TABLE campaigns (
    campaign_id         VARCHAR(10) PRIMARY KEY,
    campaign_code       TEXT GENERATED ALWAYS AS ('CAMP' || LPAD(campaign_id, 5, '0')) STORED UNIQUE,
    campaign_name       VARCHAR(50) NOT NULL CHECK (campaign_name <> ''),
    start_date          DATE NOT NULL,
    end_date           DATE NOT NULL CHECK (end_date >= start_date),
    budget_allocated    NUMERIC(15,2) CHECK (budget_allocated >= 0)    
);

COMMIT;

-- ==============================================
-- Restore foreign key constraints
-- ==============================================
BEGIN;

ALTER TABLE campaign_mapping
ADD CONSTRAINT campaign_mapping_campaign_id_fkey 
FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id);

ALTER TABLE campaign_projects
ADD CONSTRAINT campaign_projects_campaign_id_fkey 
FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id);

ALTER TABLE pmo
ADD CONSTRAINT pmo_campaign_id_fkey 
FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id);

COMMIT;
