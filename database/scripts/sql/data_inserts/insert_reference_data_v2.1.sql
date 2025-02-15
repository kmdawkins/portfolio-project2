-- ==============================================
-- INSERT REFERENCE DATA
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-15
-- Purpose: Inserts reference data into respective tables in an ordered and dependency-aware manner.
-- ==============================================

-- ==============================================
-- 1.) INSERT DATA INTO MARKETS TABLE
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
    ('Sri Lanka', 'South Asia');   
ON CONFLICT (market_name) DO NOTHING;

COMMIT;