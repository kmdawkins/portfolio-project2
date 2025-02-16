-- ==============================================
-- DATA CLEANUP FOR PMO_BACKUP TABLE (v1.1)
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-15
-- Purpose: Cleans up duplicate records, updates region/market names, and corrects company names.
-- ==============================================

BEGIN;

-- Resolve duplicate project numbers for 'Trust and Safety' budget account
UPDATE pmo_backup
SET project_no = CASE
    WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20223000' THEN 'PJ20223500'
    WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20224000' THEN 'PJ20224500'
    WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20225000' THEN 'PJ20225500'
    ELSE project_no
END
WHERE budget_account = 'Trust and Safety';

-- Update region reassignment for North America (Canada & U.S.)
UPDATE pmo_backup
SET region_name = 'North America'
WHERE market_name IN ('Canada', 'United States');

-- Update region reassignment for Corporate (Tik Tok & ByteDance Corporate)
UPDATE pmo_backup
SET region_name = 'Corporate'
WHERE market_name IN ('Tik Tok', 'ByteDance Corporate');

-- Update company name correction (42Weeks → 42West)
UPDATE pmo_backup
SET company_name = '42West'
WHERE company_name ILIKE '42Weeks';

-- ==============================================
-- Update Ireland & London Market and Region Names
-- ==============================================

-- Update Ireland to Europe
UPDATE pmo_backup
SET region_name = 'Europe'
WHERE market_name = 'Ireland';

-- Update London to 'Regional Great Britain' in 'U.K.' region
UPDATE pmo_backup
SET market_name = 'Regional Great Britain',
    region_name = 'U.K.'
WHERE market_name = 'London';

COMMIT;