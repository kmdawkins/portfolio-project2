-- ==============================================
-- DATA CLEANUP FOR PMO_BACKUP TABLE: DUPLICATE VALUES PAYMENT_NO
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-21
-- Purpose: Resolves extensive duplicate values issue in pmo_backup.payment_no 
-- by resetting payment_no with a new sequence.
-- ==============================================

BEGIN;

WITH ordered_payments AS (
    SELECT ctid, transaction_date,
           ROW_NUMBER() OVER (ORDER BY transaction_date) AS new_seq
    FROM pmo_backup
)
UPDATE pmo_backup pb
SET payment_no = 'AR' || LPAD(ordered_payments.new_seq::TEXT, 6, '0')
FROM ordered_payments
WHERE pb.ctid = ordered_payments.ctid;

COMMIT;
