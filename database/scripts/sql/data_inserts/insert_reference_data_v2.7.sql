-- ==============================================
-- INSERT REFERENCE DATA: CAMPAIGNS TABLE (WITH UPDATED DATE RANGES)
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-18
-- Purpose: Inserts campaigns with varying start and end dates designed for advanced querying exercises
-- ==============================================

BEGIN;

INSERT INTO public.campaigns (campaign_id, campaign_name, start_date, end_date, budget_allocated)
VALUES
    -- 🔹 10 records **fully within** the date range
    ('CAMP1025', 'Compliance Shield', '2022-03-05', '2023-03-20', 1500000.00),
    ('CAMP1035', 'Brand Integrity Initiative', '2022-04-15', '2023-02-28', 2000000.00),
    ('CAMP1045', 'Adherence Accelerator', '2022-06-01', '2023-03-30', 1700000.00),
    ('CAMP1065', 'Integrity & Compliance Drive', '2022-05-20', '2023-03-15', 1300000.00),
    ('CAMP7730', 'Campaign Strategy 360', '2022-08-15', '2023-03-25', 2400000.00),
    ('CAMP7760', 'Performance Marketing Surge', '2022-10-10', '2023-02-15', 2600000.00),
    ('CAMP1000', 'Ops Optimization Wave', '2022-04-01', '2023-03-31', 3000000.00),
    ('CAMP3000', 'Enterprise Growth Plan', '2022-07-10', '2023-03-10', 2700000.00),
    ('CAMP3500', 'Trust & Safety Reinforce', '2022-09-05', '2023-03-15', 1750000.00),
    ('CAMP4500', 'Safety Signals Outreach', '2022-03-20', '2023-02-10', 1450000.00),

    -- 🔸 5 records **end early** (1-3 months before range ends)
    ('CAMP1055', 'Risk & Compliance Sync', '2022-07-10', '2022-12-30', 2200000.00), -- Ends 3 months before range
    ('CAMP7750', 'Creative Media Push', '2022-03-20', '2022-11-15', 900000.00), -- Ends 4 months before range
    ('CAMP5000', 'PMO Efficiency Drive', '2022-09-10', '2023-01-10', 1400000.00), -- Ends 2 months before range
    ('CAMP5275', 'Data Security Framework', '2022-05-25', '2023-02-25', 1250000.00), -- Ends 1 month before range
    ('CAMP2000', 'Market Expansion Sprint', '2022-06-10', '2023-01-31', 3200000.00), -- Ends 2 months before range

    -- 🔻 5 records **spill over** the range by 1-3 months
    ('CAMP7720', 'Global Marketing Pulse', '2022-08-01', '2023-05-01', 2800000.00), -- Spills over by 2 months
    ('CAMP7740', 'Marketing Intelligence Hub', '2022-09-01', '2023-06-01', 1800000.00), -- Spills over by 3 months
    ('CAMP2000', 'Market Expansion Sprint', '2022-06-10', '2023-04-30', 3200000.00), -- Spills over by 1 month
    ('CAMP5225', 'PMO Governance Upgrade', '2022-11-01', '2023-06-01', 2100000.00), -- Spills over by 3 months
    ('CAMP5500', 'Consumer Trust Blueprint', '2022-03-10', '2023-07-10', 2300000.00) -- Spills over by 4 months

ON CONFLICT (campaign_id) DO NOTHING;

COMMIT;
