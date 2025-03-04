-- ==============================================
-- SCHEMA UPDATE: Remove department from org_structure
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-15  
-- Purpose: Drops and recreates org_structure without the department column  
-- ==============================================

BEGIN;

-- Drop the existing org_structure table
DROP TABLE IF EXISTS org_structure CASCADE;

-- Recreate org_structure without the department column
CREATE TABLE org_structure (
    emp_id SERIAL PRIMARY KEY,
    emp_code TEXT GENERATED ALWAYS AS ('EMP' || LPAD(emp_id::TEXT, 4, '0')) STORED UNIQUE,
    emp_name VARCHAR(75) NOT NULL CHECK (emp_name <> ''),
    title VARCHAR(50),
    manager VARCHAR(75),
    market_id INT NOT NULL,
    FOREIGN KEY (market_id) REFERENCES markets(market_id)
);

COMMIT;
