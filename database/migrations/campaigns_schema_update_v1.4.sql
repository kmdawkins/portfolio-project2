-- ==============================================
-- SCHEMA UPDATE: Rebuild campaigns table and restore fk constraints
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-19  
-- Purpose: Recreates the campaigns table and restores all dropped foreign key constraints (following CASCADE)
-- ==============================================

BEGIN;

-- Step 1: Recreate the campaigns table
CREATE TABLE public.campaigns (
    campaign_id          SERIAL PRIMARY KEY,
    campaign_code        TEXT GENERATED ALWAYS AS ('CAMP' || LPAD(campaign_id::TEXT, 5, '0')) STORED UNIQUE,
    campaign_name        VARCHAR(50) NOT NULL CHECK (campaign_name <> ''),
    start_date           DATE NOT NULL,
    end_date             DATE NOT NULL,
    budget_allocated     NUMERIC(15,2) CHECK (budget_allocated >= 0)
);

-- Step 2: Restore Foreign Key Constraints
ALTER TABLE public.campaign_mapping
ADD CONSTRAINT campaign_mapping_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES public.campaigns(campaign_id);

ALTER TABLE public.campaign_projects
ADD CONSTRAINT campaign_projects_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES public.campaigns(campaign_id);

ALTER TABLE public.pmo
ADD CONSTRAINT pmo_campaign_id_fkey FOREIGN KEY (campaign_id) REFERENCES public.campaigns(campaign_id);

COMMIT;
