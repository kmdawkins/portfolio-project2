## Script Execution Log

- **2025-02-20**: Successfully ran 'insert_reference_data_v2.8.sql' in psql. No errors.
BEGIN
INSERT 0 20
COMMIT

- **2025-02-20**: Successfully ran 'campaign_mapping_schema_update_v2.0.sql' in psql. No errors.
BEGIN
ALTER TABLE
COMMIT

- **2025-02-19**: Successfully ran 'copy_agency_contracts_v1.0.sql' in psql. No errors.
BEGIN
COPY 148
COMMIT

- **2025-02-19**: Successfully ran 'data_cleanup_pmo_backup_v1.2.sql' in psql. No errors
BEGIN
UPDATE 9707
COMMIT

- **2025-02-19**: Successfully ran 'insert_reference_data_v2.7.sql' in psql. No errors
BEGIN
INSERT 0 20
COMMIT

- **2025-02-19**: Successfully ran 'campaign_projects_schema_update_v1.0.sql' in psql. No errors.
BEGIN
CREATE INDEX
COMMIT

- **2025-02-19**: Successfully ran 'campaign_mapping_schema_update_v1.0.sql' in psql. No errors.
BEGIN
CREATE INDEX
COMMIT

- **2025-02-19**: Successfully ran 'campaigns_schema_update_v1.4.sql' in psql. No errors.
DROP TABLE
CREATE TABLE
COMMIT
BEGIN
ALTER TABLE
ALTER TABLE
ALTER TABLE
COMMIT

- **2025-02-18**: Successfully ran 'insert_reference_data_v2.6.sql; in psql. No errors.
BEGIN
INSERT 0 26
COMMIT

- **2025-02-18**: Successfully ran 'agencies_schema_update_v1.1.sql' in psql. No errors.
BEGIN
ALTER TABLE
COMMIT

- **2025-02-18**: Succesfully ran 'agency_contracts_schema_update_v1.2.sql' in psql. No errors.
BEGIN
CREATE INDEX
COMMIT

- **2025-02-18**: Sucessfully ran 'agency_contracts_schema_update_v1.1.sql' in psql. No errors.
BEGIN
ALTER TABLE
ALTER TABLE
COMMIT

- **2025-02-18**: Successfully ran 'campaigns_schema_update_v1.2.sql' in psql. No erorrs.
BEGIN
ALTER TABLE
COMMIT

- **2025-02-18**: Successfully ran 'agencies_schema_update_v1.0.sql' in psql. No errors.
BEGIN
CREATE TABLE
ALTER TABLE
COMMIT

- **2025-02-17**: Succesfully ran 'campaigns_schema_update_v1.1.sql' in psql. No errors.
BEGIN
ALTER TABLE
COMMIT

- **2025-02-17**: Sucessfully ran 'campaigns_schema_update_v1.0.sql' in psql. No errors.
BEGIN
ALTER TABLE
COMMIT

- **2025-02-16**: Sucessfully ran 'insert_reference_data_v2.5.sql' in psql. No errors.
BEGIN
INSERT 0 0
INSERT 0 0
INSERT 0 20
COMMIT

- **2025-02-16**: Successfully ran 'insert_reference_data_v2.4.sql' in psql. No errors.
BEGIN
INSERT 0 0
INSERT 0 5
COMMIT

- **2025-02-16**: Successfully ran 'copy_org_structure_v1.0.sql' in psql. No errors.
BEGIN
COPY 41
COMMIT

- **2025-02-16**: Successfully ran 'insert_reference_data_v2.3.sql' in psql. Inserted missed market_name, 'Singapore'. No errors.
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