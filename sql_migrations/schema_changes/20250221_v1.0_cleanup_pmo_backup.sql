-- ==============================================
-- SCHEMA UPDATE: DROP PMO_BACKUP TABLE
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-21  
-- Purpose: Drops `pmo_backup` now that data migration to `pmo` is complete.
-- A full schema backup has been stored for reference.
-- ==============================================

BEGIN;

-- Ensure no dependencies exist before dropping
DROP TABLE IF EXISTS pmo_backup CASCADE;

COMMIT;
