-- Insert data for the markets table
INSERT INTO public.markets (market_name, region_name)
VALUES
    -- Insert workaround information 'Region Corporate', 'Region Africa', etc.)
    ('Ethiopia', 'Africa'),
    ('Kenya','Africa'),
    ('Madagascar','Africa'),
    ('Malawi','Africa'),
    ('Morocco', 'Africa'),
    ('Somalia', 'Africa'),
    ('South Africa', 'Africa'),
    ('Tunisia', 'Africa'),
    ('Zimbabwe', 'Africa'),
    ('Australia', 'APAC'),
    ('Cambodia', 'APAC'),
    ('China', 'APAC'),
    ('Fiji', 'APAC'),
    ('Hong Kong', 'APAC'),
    ('Indonesia', 'APAC'),
    ('Laos', 'APAC'),
    ('Malaysia', 'APAC'),
    ('Myanmar', 'APAC'),
    ('New Zealand', 'APAC'),
    ('Philippines', 'APAC'),
    ('Samoa', 'APAC'),
    ('Taiwan', 'APAC'),
    ('Tasmania', 'APAC'),
    ('Thailand', 'APAC'),
    ('Tonga', 'APAC'),
    ('Vietnam', 'APAC'),
    ('ByteDance Corporate', 'Corporate'),
    ('Tik Tok', 'Corporate'),
    ('Austria', 'Europe'),
    ('Belgium', 'Europe'),
    ('Denmark', 'Europe'),
    ('France', 'Europe'),
    ('Germany', 'Europe'),
    ('Greece', 'Europe'),
    ('Italy', 'Europe'),
    ('Netherlands', 'Europe'),
    ('Norway', 'Europe'),
    ('Poland', 'Europe'),
    ('Portugal', 'Europe'),
    ('Romania', 'Europe'),
    ('Spain', 'Europe'),
    ('Sweden', 'Europe'),
    ('Japan', 'Japan'),
    ('Argentina', 'LATAM'),
    ('Brazil', 'LATAM'),
    ('Colombia', 'LATAM'),
    ('Costa Rica', 'LATAM'),
    ('Guyana', 'LATAM'),
    ('Mexico', 'LATAM'),
    ('Paraguay', 'LATAM'),
    ('Suriname', 'LATAM'),
    ('Uruguay', 'LATAM'),
    ('Venezuela', 'LATAM'),
    ('Egypt', 'Middle East'),
    ('Israel', 'Middle East'),
    ('Saudi Arabia', 'Middle East'),
    ('Turkiye', 'Middle East'),
    ('United Arab Emirates', 'Middle East'),
    ('Canada', 'North America'),
    ('United States', 'North America'),
    ('Bangladesh', 'South Asia'),
    ('India', 'South Asia'),
    ('Pakistan', 'South Asia'),
    ('Sri Lanka', 'South Asia'),
    ('Ireland', 'U.K.'),
    ('London', 'U.K.');

-- Insert data for org structure table
INSERT INTO public.org_structure (emp_name, title, department, manager, market_id)
VALUES
    ('')
-- Insert data for campaigns table
-- Insert data for campaign mapping table
-- Insert data for projects table
INSERT INTO project (project_no, project_name, cost_center_id)
VALUES
    ('PJ20221025', 'Compliance revamp','1')
    ('PJ20221035', 'Brand rollout','2')
    ('PJ20221045', 'Adherence enhancement','3')
    ('PJ20221055', 'Risk execution', '4')
    ('PJ20221065', 'Integrity enhancement','5')
    ('PJ20227720', 'Global execution','6')
    ('PJ20227730', 'Campaign strategy','7')
    ('PJ20227740', 'Marketing expansion','8')
    ('PJ20227750', 'Creative optimization', '9')
    ('PJ20227760', 'Performance rollout', '10')
    ('PJ20221000', 'Ops enhancement', '11')
    ('PJ20222000', 'Market optimization', '12')
    ('PJ20223000', 'Enterprise revamp', '13')
    ('PJ20224000', 'Operational rollout', '14')
    ('PJ20225000', 'PMO enhancement', '15')
    ('PJ20225225', 'PMO rollout', '16')
    ('PJ20225275', 'Data revamp', '17')
    ('PJ20223500', 'Trust rollout', '18')
    ('PJ20224500', 'Safety optimization', '19')
    ('PJ20225500', 'Consumer strategy', '20')

-- Insert data for cost centers table

INSERT INTO cost_centers (cost_center, budget_account)
VALUES
    ('7812','Compliance')
    ('3673', 'Marketing')
    ('2312', 'Operations')
    ('8280', 'PMO')
    ('5514', 'Trust and Safety')

-- Insert data for agency contracts table
COPY 
PATH "C:\data\portfolio\reference_table_contracts.csv"
DELIMITER ',' CSV Header

-- Insert data for campaign projects table
-- Data migration from pmo backup to new pmo table