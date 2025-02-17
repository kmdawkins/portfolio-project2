-- ==============================================
-- COPY BULK DATA INTO ORG_STRUCTURE TABLE
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-16
-- Purpose: Bulk inserts employee data from CSV file using COPY command
-- ==============================================

BEGIN;

COPY public.org_structure (emp_name, title, manager, market_id)
FROM 'C:/git/portfolio-project2/data/org_structure.csv'
WITH (FORMAT csv, HEADER true);

COMMIT;