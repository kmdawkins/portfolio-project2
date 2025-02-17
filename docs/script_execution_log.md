## Script Execution Log
- **2025-02-16**: Successfully ran 'insert_reference_data_v2.3.sql' in psql. Insterted missed market_name, 'Singapore'. No errors.
BEGIN
INSERT 0 1
COMMIT

- **2025-02-15**: Successfully ran `org_structure_schema_update_v1.0.sql` in psql. Removed org_structure.department. No errors.
NOTICE: drop cascades to constraint campaign_mapping_emp_id_fkey on table campaign_mapping
DROP TABLE
CREATE TABLE
COMMIT

- **2025-02-15**: Successfully ran `data_cleanup_pmo_backup_v1.1.sql` in psql. Updated market & region names. No errors.
BEGIN
UPDATE 51051
UPDATE 41689
UPDATE 41853
UPDATE 0
UPDATE 10523
UPDATE 10462
COMMIT
  
- **2025-02-14**: Inserted reference data for `markets` table.