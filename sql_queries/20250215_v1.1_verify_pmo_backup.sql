-- ==============================================
-- VERIFICATION QUERIES FOR PMO_BACKUP TABLE (v1.1)
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-15
-- Purpose: Validates updates made in data_cleanup_pmo_backup_v1.1.sql
-- ==============================================

-- Verify duplicate project numbers were updated correctly
SELECT budget_account, project_no, COUNT(*)
FROM pmo_backup
GROUP BY budget_account, project_no
ORDER BY budget_account;

-- Verify region name reassignment for North America (Canada & U.S.)
SELECT DISTINCT market, region_name
FROM pmo_backup
WHERE market IN ('Canada', 'United States')
ORDER BY region_name, market;

-- Verify region name reassignment for Corporate (Tik Tok & ByteDance Corporate)
SELECT DISTINCT market, region_name
FROM pmo_backup
WHERE market IN ('Tik Tok', 'ByteDance Corporate')
ORDER BY region_name, market;

-- Verify company name correction from 42Weeks to 42West
SELECT DISTINCT company_name
FROM pmo_backup
WHERE company_name ILIKE '42West';

-- Verify Ireland’s region change from U.K. to Europe
SELECT DISTINCT market, region_name
FROM pmo_backup
WHERE market = 'Ireland';

-- Verify London’s update to 'Regional Great Britain' in 'U.K.' region
SELECT DISTINCT market, region_name
FROM pmo_backup
WHERE market = 'Regional Great Britain';