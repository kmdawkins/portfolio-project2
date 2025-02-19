-- ==============================================
-- COPY BULK DATA INTO AGENCY_CONTRACTS TABLE
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-19
-- Purpose: Bulk inserts agency contracts data from CSV file using COPY command
-- ==============================================

BEGIN;

COPY public.agency_contracts (contract_no, agency_id)
FROM 'C:/git/portfolio-project2/data/agency_contracts.csv'
WITH (FORMAT CSV, HEADER true);

COMMIT;