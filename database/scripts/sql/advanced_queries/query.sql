-- ==============================================
-- ADVANCED QUERYING: GROUP BY & HAVING
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-26
-- Purpose: Demonstrate query writing fluency
-- ==============================================

-- ================================================
-- Beginner-level
-- 1.) Find the total budget allocated per campaign.
-- Return campaign_id, campaign_name, and total_budget_allocated.
-- GROUP BY campaign_id and campaign_name.
-- ORDER BY total_budget_allocated in descending order.

-- ==============================================
-- SCRATCH PAD
-- ==============================================

-- Understand
-- A.) What's required?
-- Columns: campaign_id, campaign_name
-- Aggregation: SUM (budget_allocated)
-- B.) Filters to apply?
-- None
-- C.) Results sorted how?
-- GROUP BY campaign
-- ORDER BY total_budget_allocated DESC

-- Main query
SELECT  campaign_id, campaign_name,
        SUM (budget_allocated) AS total_budget_allocated
FROM campaigns
GROUP BY  campaign_id, campaign_name
ORDER BY total_budget_allocated DESC;

-- ================================================
-- Intermediate level
-- 2.) Retrieve the number of projects per cost center
-- Return cost_center_id, budget_account, and total_projects.
-- GROUP BY cost_center_id and budget_account
-- ORDER BY total_projects in descending order

SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(p.project_no) AS total_projects
FROM cost_centers cc
JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
ORDER BY total_projects DESC;

-- Alternatively, if I cannot verify projects are unique. Then:
SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(DISTINCT(p.project_no)) AS total_projects
FROM cost_centers cc
JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
ORDER BY total_projects DESC;

-- ==============================================
-- SCRATCH PAD
-- ==============================================

-- What's required?
-- Columns: cost_center_id, budget_account
-- Calculations: None.
-- Aggregations: SUM(project_no) AS total_projects

-- Filters Applied?
-- Date range: None.
-- Exclude NULL: None.
-- Specific values: Clarify what this means.

-- Sorting Applied?
-- ORDER BY: total_projects DESC;
-- GROUP BY: cost_center_id and budget_account.

-- Joins
-- cost_centers > projects
-- cost_centers cc = cc.cost_center_id, cc.budget_account
-- projects p = p.cost_center_id, p.project_no

-- ================================================
-- Advanced level
-- 3.) Find cost centers where the total allocated budget exceeds 10,000,000.
-- Return: cost_center_id, budget_account, and total_budget_allocated.
-- GROUP BY: cost_center_id and budget_account
-- HAVING: Filter only cost centers that exceed the budget threshold
-- ORDER BY: total_budget_allocated descending order.

-- Correct Answer:
SELECT cc.cost_center_id, cc.budget_account,
       SUM(c.budget_allocated) AS total_budget_allocated
FROM cost_centers cc
JOIN projects p ON cc.cost_center_id = p.cost_center_id
JOIN campaign_projects cp ON p.project_no = cp.project_no
JOIN campaign_mapping cm ON cp.campaign_id = cm.campaign_id
JOIN campaigns c ON cm.campaign_id = c.campaign_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING SUM(c.budget_allocated) > 10000000
ORDER BY total_budget_allocated DESC;

-- 1st Attempt (was very close):
(SELECT SUM(budget_allocated) AS total_budget_allocated FROM campaigns)

SELECT      cc.cost_center_id, cc.budget_account,
            c.budget_allocated,
            (SELECT SUM(budget_allocated) AS total_budget_allocated
             FROM campaigns c)
FROM cost_centers cc
JOIN projects p ON cc.cost_center_id = p.cost_center_id
JOIN campaign_projects cp ON p.project_no = cp.project_no
JOIN campaign_mapping cm ON cp.campaign_id = cm.campaign_id
JOIN campaigns c ON cm.campaign_id = c.campaign_id
GROUP BY cc.cost_center_id, cc.budget_account, c.budget_allocated
HAVING total_budget_allocated > 10000000;



-- ==============================================
-- SCRATCH PAD
-- ==============================================

-- What's required?
-- Columns: cost_center_id, budget_account
-- Calculations: NONE
-- Aggregations: SUM(budget_allocated)

-- Filters Applied?
-- Date range: NONE
-- Exclude NULL values: None.
-- Specific values: ??

-- Sorting Applied?
-- ORDER BY: total_budget_allocated DESC
-- GROUP BY: cost_center_id, budget_account
-- LIMIT: NONE

-- Joins
-- cost_centers > campaigns
-- cost_centers cc = cc.cost_center_id, cc.budget_account
-- projects p = p.cost_center_id, p.project_no
-- campaign_projects cp = cp.campaign_id, cp.project_no
-- campaign_mapping cm = cm.campaign_id
-- campaigns c = c.campaign_id, c.budget_allocated

-- Subqueries
-- SELECT Clause:
(SELECT SUM(budget_allocated) AS total_budget_allocated FROM campaigns)

SELECT      cc.cost_center_id, cc.budget_account,
            c.budget_allocated,
            (SELECT SUM(budget_allocated) AS total_budget_allocated
             FROM campaigns c)
FROM cost_centers cc
JOIN projects p ON cc.cost_center_id = p.cost_center_id
JOIN campaign_projects cp ON p.project_no = cp.project_no
JOIN campaign_mapping cm ON cp.campaign_id = cm.campaign_id
JOIN campaigns c ON cm.campaign_id = c.campaign_id
GROUP BY cc.cost_center_id, cc.budget_account, c.budget_allocated
HAVING total_budget_allocated > 10000000;



-- ==============================================
-- ADVANCED QUERYING: SUBQUERIES
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-26
-- Purpose: Demonstrate query writing fluency
-- ==============================================

-- ================================================
-- 1.) Find all campaigns that have a total allocated budget above the average budget_allocated
-- budget of all campaigns.
-- Return campaign_id, campaign_name, and budget_allocated
-- Order by budget_allocated in descending order

SELECT
    campaign_id, campaign_name, budget_allocated
FROM campaigns
WHERE
    budget_allocated > (SELECT ROUND(AVG(budget_allocated),2) AS avg_allocated_budget FROM campaigns)
ORDER BY budget_allocated DESC;

-- ==============================================
-- SCRATCH PAD
-- ==============================================

-- Main query
SELECT
    campaign_id, campaign_name, budget_allocated
FROM campaigns
WHERE budget_allocated
ORDER BY budget_allocated DESC;

-- Subqery
SELECT ROUND(AVG(budget_allocated),2) AS avg_allocated_budget FROM campaigns;


-- ================================================
-- 2.) Retrieve all employees from org_structure who are assigned to a project with a budget
-- higher than 1,000,000.
-- Return emp_id, emp_name, project_no, and budget_allocated.
-- Order by budget_allocated in descending order.

-- CORRECT ANSWER:
SELECT  os.emp_id, os.emp_name,
        cm.project_no,
        (SELECT c.budget_allocated
         FROM campaigns c
         WHERE c.campaign_id = cm.campaign_id) AS budget_allocated
FROM org_structure os
JOIN campaign_mapping cm ON os.emp_id = cm.emp_id
WHERE   (SELECT c.budget_allocated
         FROM campaigns c 
         WHERE c.campaign_id = cm.campaign_id) > 1000000
ORDER BY budget_allocated DESC;


-- ==============================================
-- SCRATCH PAD
-- ==============================================

-- Main query
SELECT  os.emp_id, os.emp_name,
        cm.project_no,
        c.budget_allocated       
FROM org_structure os 
LEFT JOIN campaign_mapping cm ON os.emp_id = cm.emp_id
LEFT JOIN campaigns c ON cm.campaign_id = c.campaign_id
WHERE (SELECT budget_allocated FROM campaigns) > 1000000
ORDER BY budget_allocated DESC;

-- Subquery

(SELECT budget_allocated FROM campaigns WHERE budget_allocated > 1000000)

-- Joins
org_structure > campaigns

org_structure os = os.emp_id, os.emp_name
campaign_mapping cm = cm.emp_id, cm.campaign_id, cm.project_no
campaigns c = c.campaign_id, c.budget_allocated

-- 3.) Identify cost cetners that receive higher allocated budgets from linked campaigns
-- compared to the overall budget distribution across all cost centers
-- Return cost_center_id, budget_account, total_budget_allocated.
-- Ensure only relevant cost centers are included based on budget comparisons.
-- Sort the results in descending order of total_budget_allocated.



-- ==============================================
-- SCRATCH PAD
-- ==============================================

-- Main query
SELECT  cc.cost_center_id, c.budget_allocated,
        (SELECT SUM(budget_allocated) AS total_budget_allocated
         FROM campaigns c
         JOIN campaign_mapping cm ON c.campaign_id = cm.campaign_id)
FROM cost_centers cc
JOIN projects p ON cc.cost_center_id = p.cost_center_id;
WHERE
    (SELECT SUM(budget_allocated) AS total_budget_allocated
     FROM campaigns c
     JOIN campaign_mapping cm ON c.campaign_id = cm.campaign_id) > 441550000    
ORDER BY total_budget_allocated DESC;



-- Subqueries
-- Overall budget distribution
(SELECT SUM(budget_allocated) AS total_budget_allocated
FROM campaigns c
JOIN campaign_mapping cm ON c.campaign_id =cm.campaign_id);

-- Higher allocated budgets (linked campaigns)
SELECT  p.cost_center_id, c.campaign_id,
        SUM(c.budget_allocated) AS total_by_cc 
FROM campaigns c
JOIN campaign_mapping cm ON c.campaign_id = cm.campaign_id
JOIN projects p ON cm.project_no = p.project_no
GROUP BY p.cost_center_id, c.campaign_id
ORDER BY p.cost_center_id;


-- Joins
cost_centers > campaigns

cost_centers cc = cc.cost_center_id
projects p = p.cost_center_id, p.project_no
campaign_mapping cm = cm.campaign_id, cm.project_no
campaigns c = c.campaign_id, c.budget_allocated


-- 3.) Find all cost centers where the total allocated budget across all linked campaigns is
-- higher than the total average budget allocated per cost center.
-- Return cost_center_id, budget_account, and total_budget_allocated.
-- Order by total_budget_allocated in descending order.

-- ==============================================
-- SCRATCH PAD
-- ==============================================

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

-- ==============================================
-- SCRATCH PAD
-- ==============================================

-- campaigns c          c.budget_allocated, c.campaign_id
-- campaign_mapping cm  cm.campaign_id, cm.project_no
-- projects p           p.project_no, p.cost_center_id
-- cost_centers cc      cc.cost_center_id, cc.budget_account

-- ==============================================
-- ADVANCED QUERYING: DATABASE CONNECTION SETUP
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-25
-- Purpose: PostgreSQL VS Code extension database connection
-- ==============================================

-- Adding/Reconnectiong PostgreSQL extension (Chris Kolkam)
-- Testing public.budget database connection to VS Code
SELECT current_database(), current_user;
SELECT * FROM campaigns LIMIT 5;

SELECT * FROM markets;