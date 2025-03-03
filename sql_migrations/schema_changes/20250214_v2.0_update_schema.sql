-- ==============================================
-- SCHEMA UPDATE: RECREATED BUDGET
-- ==============================================
-- Author: Katherina Dawkins  
-- Date: 2025-02-14
-- Purpose: Drops empty tables and constraints and creates optimized budget schema.
-- Optimized for SQL & Python automation. Included foreign key constraints, employee
-- code generation and indexes.
-- ==============================================

-- Drop existing tables to ensure a clean setup
DROP TABLE IF EXISTS pmo CASCADE;
DROP TABLE IF EXISTS agency_contracts CASCADE;
DROP TABLE IF EXISTS campaigns CASCADE;
DROP TABLE IF EXISTS campaign_projects CASCADE;
DROP TABLE IF EXISTS campaign_mapping CASCADE;
DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS org_structure CASCADE;
DROP TABLE IF EXISTS markets CASCADE;
DROP TABLE IF EXISTS cost_centers CASCADE;

-- Normalized Cost Centers Table
CREATE TABLE cost_centers (
    cost_center_id SERIAL PRIMARY KEY,
    cost_center SMALLINT UNIQUE NOT NULL CHECK (cost_center > 0),
    budget_account VARCHAR(50) NOT NULL CHECK (budget_account <> '')
);

-- Organization Structure Table (Moved up to resolve dependency issues)
CREATE TABLE org_structure (
    emp_id SERIAL PRIMARY KEY,
    emp_code TEXT GENERATED ALWAYS AS ('EMP' || LPAD(emp_id::TEXT, 4, '0')) STORED UNIQUE,
    emp_name VARCHAR(75) NOT NULL CHECK (emp_name <> ''),
    title VARCHAR(50),
    department VARCHAR(50) NOT NULL CHECK (department <> ''),
    manager VARCHAR(75),
    market_id INT NOT NULL
);

-- Markets Table (Includes Regional Market Placeholders for EVPs)
CREATE TABLE markets (
    market_id SERIAL PRIMARY KEY,
    market_code TEXT GENERATED ALWAYS AS ('MID' || LPAD(market_id::TEXT, 3, '0')) STORED UNIQUE,
    market_name VARCHAR(50) NOT NULL UNIQUE,
    region_name VARCHAR(50) NOT NULL CHECK (region_name <> '')
);
CREATE INDEX idx_market_name ON markets (market_name);

ALTER TABLE org_structure ADD CONSTRAINT fk_org_structure_market FOREIGN KEY (market_id) REFERENCES markets(market_id);

-- Agency Contracts Table
CREATE TABLE agency_contracts (
    contract_no VARCHAR(20) PRIMARY KEY,
    agency_name VARCHAR(75) NOT NULL CHECK (agency_name <> '')
);

-- Campaigns Table
CREATE TABLE campaigns (
    campaign_id VARCHAR(10) PRIMARY KEY,
    region_name VARCHAR(50) NOT NULL CHECK (region_name <> ''),
    campaign_name VARCHAR(50) NOT NULL CHECK (campaign_name <> ''),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date >= start_date),
    budget_allocated DECIMAL(15,2) CHECK (budget_allocated >= 0),
    company_name VARCHAR(75),
    company_legal_entity VARCHAR(75)
);
CREATE INDEX idx_campaigns_region ON campaigns(region_name);

-- Projects Table
CREATE TABLE projects (
    project_no VARCHAR(20) PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL CHECK (project_name <> ''),
    cost_center_id INT NOT NULL,
    FOREIGN KEY (cost_center_id) REFERENCES cost_centers(cost_center_id)
);
CREATE INDEX idx_projects_cost_center ON projects(cost_center_id);

-- Campaign Mapping Table (Moved after `org_structure` is created)
CREATE TABLE campaign_mapping (
    project_no VARCHAR(20) PRIMARY KEY,
    campaign_id VARCHAR(10) NOT NULL,
    budget_account VARCHAR(50) NOT NULL CHECK (budget_account <> ''),
    emp_id INT NOT NULL,
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id),
    FOREIGN KEY (emp_id) REFERENCES org_structure(emp_id)
);

-- Campaign Projects Bridge Table
CREATE TABLE campaign_projects (
    campaign_id VARCHAR(10) NOT NULL,
    project_no VARCHAR(20) NOT NULL,
    PRIMARY KEY (campaign_id, project_no),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id),
    FOREIGN KEY (project_no) REFERENCES projects(project_no)
);

-- Transactions Table: PMO
CREATE TABLE pmo (
    payment_no VARCHAR(20) PRIMARY KEY,
    transaction_date DATE NOT NULL,
    campaign_id VARCHAR(10) NOT NULL,
    description TEXT,
    contract_no VARCHAR(20) NOT NULL,
    purchase_order VARCHAR(20),
    purchase_requisition VARCHAR(20),
    project_no VARCHAR(20) NOT NULL,
    payment_entity VARCHAR(50) NOT NULL CHECK (payment_entity <> ''),
    amount_usd DECIMAL(15,2) CHECK (amount_usd >= 0),
    amount_cny DECIMAL(15,2) CHECK (amount_cny >= 0),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id),
    FOREIGN KEY (project_no) REFERENCES projects(project_no),
    FOREIGN KEY (contract_no) REFERENCES agency_contracts(contract_no)
);
CREATE INDEX idx_pmo_campaign ON pmo(campaign_id);
CREATE INDEX idx_pmo_project ON pmo(project_no);
