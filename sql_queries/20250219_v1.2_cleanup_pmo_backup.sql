-- ==============================================
-- DATA CLEANUP FOR PMO_BACKUP TABLE: DUPLICATE VALUE
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-19
-- Purpose: Resolves duplicate contract_no record (CT874695) by assigning a new contract_no
-- ==============================================

BEGIN;

-- Update duplicate contract_no to a new unique value
UPDATE public.pmo_backup
SET contract_no = 'CT198412'
WHERE contract_no = 'CT874695' AND company_name ILIKE 'SPRG';

COMMIT;
