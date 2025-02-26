-- ==============================================
-- ADVANCED QUERYING: COMPLEX JOINS
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-25
-- Purpose: Demonstrate query writing fluency
-- ==============================================

-- Adding/Reconnectiong PostgreSQL extension (Chris Kolkam)
-- Testing public.budget database connection to VS Code
SELECT current_database(), current_user;
SELECT * FROM campaigns LIMIT 5;

-- Intermediate-Level Join: List all agencies and their contracts, including agencies
-- without contracts.
-- include: agency_id, agency_name, contract_no

SELECT  a.agency_id, a.agency_name,
        ac.contract_no
FROM agencies a
LEFT JOIN agency_contracts ac ON a.agency_id = ac.agency_id;

-- Advanced-level Join: Find total allocated budget for each cost center,
-- including cost centers without any budget allocations.

SELECT  cc.cost_center_id, cc.budget_account,
        SUM(c.budget_allocated) AS total_budget_allocated
FROM campaigns c
LEFT JOIN campaign_mapping cm ON c.campaign_id = cm.campaign_id
LEFT JOIN projects p ON cm.project_no = p.project_no
LEFT JOIN cost_centers cc ON p.cost_center_id = cc.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
ORDER BY total_budget_allocated DESC;

-- Table Join details:
-- campaigns c          c.budget_allocated, c.campaign_id
-- campaign_mapping cm  cm.campaign_id, cm.project_no
-- projects p           p.project_no, p.cost_center_id
-- cost_centers cc      cc.cost_center_id, cc.budget_account


