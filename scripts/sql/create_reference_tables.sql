// Budget Schema - Creating reference tables pmo, agency contracts, campaigns, campaign projects, markets, org structure, and projects

CREATE TABLE pmo (
    payment_no                  VARCHAR(20)     PRIMARY KEY NOT NULL,
    transaction_date            DATE            NOT NULL,    
    region_name                 VARCHAR(50)     NOT NULL,
    campaign_id                 SMALLINT        NULL,
    description                 TEXT            NULL,
    contract_no                 VARCHAR(20)     NULL,
    purchase_order              VARCHAR(20)     NULL,
    purchase_requisition        VARCHAR(20)     NULL,
    project_no                  VARCHAR(20)     NULL,
    payment_entity              VARCHAR(50)     NOT NULL,
    amount_usd                  DECIMAL(15,2)   NOT NULL,
    amount_cny                  DECIMAL(15,2)   NOT NULL
);

CREATE TABLE agency_contracts (
    contract_no                 VARCHAR(20)     PRIMARY KEY NOT NULL,
    agency_name                 VARCHAR(75)     NOT NULL,
    address_1                   VARCHAR(75)     NOT NULL,
    address_2                   VARCHAR(75)     NULL,
    city                        VARCHAR(75)     NOT NULL,
    state                       VARCHAR(75)     NULL,
    country                     VARCHAR(75)     NOT NULL,
    post_code                   VARCHAR(20)     NOT NULL,
    contract_start              DATE            NOT NULL,
    contract_end                DATE            NULL,
    contract_value              DECIMAL(15,2)   NOT NULL,
    contact_person              VARCHAR(75)     NOT NULL,
    contact_email               VARCHAR(75)     NOT NULL,
    contact_phone               VARCHAR(50)     NULL                 
);

CREATE TABLE campaigns (
    campaign_id                 VARCHAR(10)     PRIMARY KEY,
    region_name                 VARCHAR(50)     NOT NULL,
    campaign_name               VARCHAR(50)     NOT NULL,
    start_date                  DATE            NOT NULL,                    
    end_date                    DATE            NULL,
    budget_allocated            DECIMAL(15,2)   NOT NULL,   
    company_name                VARCHAR(75)     NOT NULL,  
    company_legal_entity        VARCHAR(75)     NOT NULL
);

CREATE TABLE campaign_projects (
    campaign_id                 VARCHAR(10)     NOT NULL,
    project_no                  VARCHAR(20)     NOT NULL,
    PRIMARY KEY (campaign_id, project_no) 
);

CREATE TABLE markets (
    market_id                   SERIAL          PRIMARY KEY NOT NULL,
    market_prefix               VARCHAR(5)      NOT NULL DEFAULT 'MID00-',
    market_name                 VARCHAR(50)     NOT NULL,
    region_name                 VARCHAR(50)     NOT NULL,
);
CREATE TABLE org_structure (
    emp_id                      SERIAL          PRIMARY KEY NOT NULL,
    emp_prefix                  VARCHAR(5)      NOT NULL DEFAULT 'EMP-',
    emp_name                    VARCHAR(75)     NOT NULL,
    title                       VARCHAR(50)     NOT NULL,
    region_name                 VARCHAR(50)     NOT NULL,   
    department                  VARCHAR(50)     NOT NULL,
    manager                     VARCHAR(75)     NULL
);

CREATE TABLE projects (
    project_no                  VARCHAR(20)     PRIMARY KEY NOT NULL,
    project_name                VARCHAR(50)     NOT NULL,
    project_owner               VARCHAR(50)     NOT NULL,
    cost_center                 SMALLINT        NOT NULL,
    budget_account              VARCHAR(50)     NOT NULL
);
