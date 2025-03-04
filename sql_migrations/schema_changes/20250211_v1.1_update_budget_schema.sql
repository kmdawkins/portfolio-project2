-- Recreating my budget schema, pmo (Transactions table) and reference tables: agency contracts, campaigns, campaign projects, markets, org structure, and projects

-- Drop empty tables if they already exist to ensure a clean setup
DROP TABLE IF EXISTS pmo CASCADE;
DROP TABLE IF EXISTS agency_contracts CASCADE;
DROP TABLE IF EXISTS campaigns CASCADE;
DROP TABLE IF EXISTS campaign_projects CASCADE;
DROP TABLE IF EXISTS org_structure CASCADE;
DROP TABLE IF EXISTS projects CASCADE;
DROP TABLE IF EXISTS markets CASCADE;

-- Create markets table and index
CREATE TABLE markets (
    market_id       SERIAL PRIMARY KEY,
    market_code     TEXT GENERATED ALWAYS AS ('MID' || LPAD(market_id::TEXT, 3, '0')) STORED UNIQUE,
    market_name     VARCHAR(50) NOT NULL UNIQUE,
    region_name     VARCHAR(50) NOT NULL
);
CREATE INDEX idx_market_name ON markets (market_name);

-- Create agency contracts table and index
CREATE TABLE agency_contracts (
    contract_no     VARCHAR(20) PRIMARY KEY,
    agency_name     VARCHAR(75) NOT NULL,
    address_1       VARCHAR(75),
    address_2       VARCHAR(75),
    city            VARCHAR(75),
    state           VARCHAR(75),
    country         VARCHAR(75),
    post_code       VARCHAR(20),
    contract_start  DATE NOT NULL,
    contract_end    DATE NOT NULL,
    contract_value  DECIMAL(15,2) CHECK (contract_value >= 0),
    contact_person  VARCHAR(75) NOT NULL,
    contact_email   VARCHAR(75) UNIQUE NOT NULL,
    contact_phone   VARCHAR(50)
);
CREATE INDEX idx_agency_name ON agency_contracts (agency_name);

-- Create campaigns table, foreign key, and index
CREATE TABLE campaigns (
    campaign_id             VARCHAR(10) PRIMARY KEY,
    campaign_name           VARCHAR(50) NOT NULL,
    start_date              DATE NOT NULL,
    end_date                DATE NOT NULL,
    budget_allocated        DECIMAL(15,2) CHECK (budget_allocated >= 0),
    region_name             VARCHAR(50) NOT NULL,
    company_name            VARCHAR(75),
    company_legal_entity    VARCHAR(75),

    -- Foreign Key
    CONSTRAINT fk_campaign_market FOREIGN KEY (region_name) REFERENCES markets(market_name)                
);
CREATE INDEX idx_campaign_name ON campaigns (campaign_name);
CREATE INDEX idx_campaign_region ON campaigns (region_name);

-- Create projects table and index
CREATE TABLE projects (
    project_no      VARCHAR(20) PRIMARY KEY,
    project_name    VARCHAR(50) NOT NULL,
    project_owner   VARCHAR(50),
    cost_center     SMALLINT NOT NULL,
    budget_account  VARCHAR(50) NOT NULL
);
CREATE INDEX idx_project_name ON projects (project_name);

-- Create campaign_projects junction table (Many-to-many Relationship), composite primary key, foreign key, and index
CREATE TABLE campaign_projects (
    campaign_id     VARCHAR(10) NOT NULL,
    project_no      VARCHAR(20) NOT NULL,

    -- Composite Primary Key
    PRIMARY KEY (campaign_id, project_no),

    -- Foreign Keys
    CONSTRAINT fk_campaign_project FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id) ON DELETE CASCADE,
    CONSTRAINT fk_project_campaign FOREIGN KEY (project_no) REFERENCES projects(project_no) ON DELETE CASCADE
);
CREATE INDEX idx_campaign_project ON campaign_projects (campaign_id, project_no);

--Create org structure table, foreign key, and index
CREATE TABLE org_structure (
    emp_id      SERIAL PRIMARY KEY,
    emp_code    TEXT GENERATED ALWAYS AS ('EMP' || LPAD(emp_id::TEXT, 4, '0')) STORED UNIQUE,
    emp_name    VARCHAR(75) NOT NULL,
    title       VARCHAR(50),
    department  VARCHAR(50) NOT NULL,
    manager     VARCHAR(75),

    -- Foreign Key
    CONSTRAINT fk_org_market FOREIGN KEY (department) REFERENCES markets(market_name)
);
CREATE INDEX idx_emp_name ON org_structure (emp_name);
CREATE INDEX idx_org_department ON org_structure (department);

-- Create pmo table (Transactions table), foreign keys, and indexes
CREATE TABLE pmo (
    payment_no              VARCHAR(20) PRIMARY KEY,
    transaction_date        DATE NOT NULL,
    region_name             VARCHAR(50) NOT NULL,
    campaign_id             VARCHAR(10) NOT NULL,
    descrtiption            TEXT,
    contract_no             VARCHAR(20) NOT NULL,
    purchase_order          VARCHAR(20),
    purchase_requisition    VARCHAR(20),
    project_no              VARCHAR(20) NOT NULL,
    payment_entity          VARCHAR(50) NOT NULL,
    amount_usd              DECIMAL(15,2) CHECK (amount_usd >= 0),
    amount_cny              DECIMAL(15,2) CHECK (amount_cny >= 0),

    -- Foreign keys
    CONSTRAINT fk_pmo_campaign FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id) ON DELETE CASCADE,
    CONSTRAINT fk_pmo_contract FOREIGN KEY (contract_no) REFERENCES agency_contracts(contract_no) ON DELETE CASCADE,
    CONSTRAINT fk_pmo_project FOREIGN KEY (project_no) REFERENCES projects(project_no) ON DELETE CASCADE
);
CREATE INDEX idx_pmo_transaction_date ON pmo (transaction_date);
CREATE INDEX idx_pmo_campaign ON pmo (campaign_id);
CREATE INDEX idx_pmo_project ON pmo (project_no);
CREATE INDEX idx_pmo_region ON pmo (region_name);
CREATE INDEX idx_pmo_contract ON pmo (contract_no);