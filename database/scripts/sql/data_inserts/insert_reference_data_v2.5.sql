-- ==============================================
-- INSERT REFERENCE DATA
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-16
-- Purpose: Inserts reference data into respective tables in an ordered and dependency-aware manner.
-- ==============================================

-- ==============================================
-- 1.) Insert data into markets table
-- ==============================================
BEGIN;
    INSERT INTO public.markets (market_name, region_name)
    VALUES
    ('Regional Corporate','Corporate'),
    ('Regional Africa','Africa'),
    ('Regional APAC','APAC'),
    ('Regional Europe','Europe'),
    ('Regional Japan','Japan'),
    ('Regional LATAM','LATAM'),
    ('Regional Middle East','Middle East'),
    ('Regional North America','North America'),
    ('Regional South Asia','South Asia'),
    ('Regional Great Britain','U.K'),
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
    ('Singapore', 'APAC'), -- Added missing market_name, 'Singapore'   
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
    ('Ireland','Europe'),
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
    ('Sri Lanka', 'South Asia')   
ON CONFLICT (market_name) DO NOTHING;

-- ==============================================
-- 2.) Insert data into cost centers table
-- ==============================================

INSERT INTO public.cost_centers (cost_center, budget_account) -- Removed single quotes ' ' (cost_center)
VALUES
    (7812,'Compliance'),
    (3673, 'Marketing'),
    (2312, 'Operations'),
    (8280, 'PMO'),
    (5514, 'Trust and Safety')
ON CONFLICT (cost_center) DO NOTHING;

-- ==============================================
-- 3.) Insert data into projects table
-- ==============================================

INSERT INTO public.projects (project_no, project_name, cost_center_id)
VALUES
    ('PJ20221025', 'Compliance revamp', 1),
    ('PJ20221035', 'Brand rollout', 1),
    ('PJ20221045', 'Adherence enhancement', 1),
    ('PJ20221055', 'Risk execution', 1),
    ('PJ20221065', 'Integrity enhancement', 1),
    ('PJ20227720', 'Global expansion', 2),
    ('PJ20227730', 'Campaign strategy', 2),
    ('PJ20227740', 'Marketing expansion', 2),
    ('PJ20227750', 'Creative optimization', 2),
    ('PJ20227760', 'Performance rollout', 2),
    ('PJ20221000', 'Ops enhancement', 3),
    ('PJ20222000', 'Market optimization', 3),
    ('PJ20223000', 'Enterprise revamp', 3),
    ('PJ20224000', 'Operational rollout', 3),
    ('PJ20225000', 'PMO enhancement', 3),
    ('PJ20225225', 'PMO rollout', 4),
    ('PJ20225275', 'Data revamp', 4),
    ('PJ20223500', 'Trust rollout', 5),
    ('PJ20224500', 'Safety optimization', 5),
    ('PJ20225500', 'Consumer strategy', 5)
ON CONFLICT (project_no) DO NOTHING;

COMMIT;



