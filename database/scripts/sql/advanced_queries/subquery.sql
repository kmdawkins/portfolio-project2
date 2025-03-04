-- ====================================================
-- QUERYING: BEGINNER LEVEL DEBUGGING & QUERY CORRECTIONS
-- ====================================================
-- Author: Katherina Dawkins
-- Date: 2025-03-01
-- Purpose: Demonstrate query writing proficiency
-- ==============================================

--1.) The finance team needs to retrieve cost center details along with the
-- total number of projects assigned to each cost center.
-- Retrieve cost_center_id, budget_account, COUNT(projects per cost center) AS total_projects.
-- Sort results by total_projects in descending order.

-- SOLUTION:

SELECT  cc.cost_center_id, cc.budget_account,
        COUNT (p.project_no) AS total_projects
FROM cost_centers cc
JOIN projects p ON cc.cost_center_id = p.cost_center_id
WHERE cc.cost_center_id IS NOT NULL AND cc.cost_center_id <> ''
GROUP BY cc.cost_center_id, cc.budget_account
ORDER BY total_projects DESC;

-- JOINS


-- DEBUG QUERY:

SELECT cost_center_id, budget_account, COUNT (p.project_no) AS total_projects -- Inconsistent & ambiguous table aliase syntax
FROM cost_centers cc
JOIN projects p ON cost_center_id = p.cost_center_id -- inconsistent and ambiguous JOIN syntax
WHERE cost_center_id IS NOT NULL
GROUP BY cost_center_id -- missing budget_account; Inconsistent & ambiguous table aliase syntax
ORDER BY total_projects; -- missing DESC sorting requirement


-- ISSUES:
-- 1.) Inconsistent and ambiguous table alias syntax error near SELECT clause. Corrected to cc.cost_center_id, cc.budget_account
-- 2.) Inconsistent and ambiguous table alias syntax error near JOIN keyword. Corrected to cc.cost_center_id
-- 3.) Added table alias near WHERE clause. Corrected to cc.cost_center_id.
-- 4.) Added code: AND cc.cost_center_id <> '' -- IS NOT EMPTY STRING
-- 5.) Incomplete GROUP BY clause. Corrected to include budget_account
-- 6.) Inconsistent and ambiguous table alias syntax error near GROUP BY clause. Corrected to cc.cost_center_id, cc.budget_account (matches SELECT)
-- 7.) Sorting requirement DESC missing near ORDER BY clause. Corrected to total_projects DESC;


--2.)The finance department wants to identify cost centers that have been assigned more than 3 projects.
-- Retrieve cost_center_id, budget_account, and the total number of projects assigned to each cost center.
-- Only include cost centers with more than 3 projects.
-- Sort results by total_projects in descending order.

-- SOLUTION:

SELECT  cc.cost_center_id, cc. budget_account,
        COUNT(p.project_no) AS total_projects 
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc. budget_account
HAVING COUNT(p.project_no) > 3
ORDER BY total_projects DESC;

-- DEBUG QUERY

SELECT  cc.cost_center_id, cc. budget_account,
        COUNT(p.project_no) AS total_projects 
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc. budget_account
HAVING COUNT(p.project_no) > 3
ORDER BY total_projects DESC;

-- 3.) The operations team needs a report showing cost centers with at least two projects.
-- They want to see the cost_center_id, budget_account, and the total number of projects in each cost center.

-- DEBUGGED QUERY SOLUTION:

SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(p.project_no) AS total_projects
FROM cost_centers cc
LEFT JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT(p.project_no) >= 2
ORDER BY total_projects DESC;


-- BUGGED QUERY:

SELECT cost_center_id, budget_account, COUNT(p.project_no) total_projects
FROM cost_centers cc
LEFT JOIN projects p WHERE cc.cost_center_id = p.cost_center_id
HAVING COUNT(p.project_no) >= 2
GROUP BY budget_account, cost_center_id
ORDER total_projects;


-- ERROR LIST
-- SELECT clause: Inconsistent & ambiguous alias syntax. Missing AS (alias) before total_projects
-- FROM clause: Incorrect join syntax (e.g., WHERE. ON)
-- Invalid clause order: GROUP BY then HAVING
-- GROUP BY clause: Inconsistent & ambiguous alias syntax. Re-ordered columns for readability
-- ORDER BY clause: Added DESC sorting requirement for readability and best practice.








-- ====================================================
-- QUERYING: BEGINNER LEVEL HAVING CLAUSE
-- ====================================================
-- Author: Katherina Dawkins
-- Date: 2025-03-01
-- Purpose: Demonstrate query writing proficiency
-- ==============================================

-- 1.) The finance team wants to identify cost centers that have more than 5 associated projects.
-- Retrieve cost_center_id, budget_account, AS total_projects (count of projects per cost center).
-- Filter results to include only cost centers with more than 2 projects using the HAVING clause.
-- Sort results by total_projects in descending order.

-- SOLUTION

SELECT  cc.cost_center_id, cc.budget_account,
        COUNT (p.project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT (p.project_no) > 2
ORDER BY total_projects DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:
-- Execute the query before HAVING
SELECT  cc.cost_center_id, cc.budget_account,
        COUNT (p.project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account

-- Then, execute the query with HAVING
SELECT  cc.cost_center_id, cc.budget_account,
        COUNT (p.project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT (p.project_no) > 2 -- Included the HAVING clause here.


-- Main query
SELECT  cc.cost_center_id, cc.budget_account,
        COUNT (p.project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT (p.project_no) > 2
ORDER BY total_projects DESC;

-- Subquery

-- 3.) The finance team wants to identify markets that have more than 3 employees assigned in the
-- org_structure table.
-- Retrieve market_id, market_name, COUNT(employees per market) AS total_employees.
-- Filter results to include only markets with more than 3 employees assigned.
-- Sort results by total_employees in descending order.

-- SOLUTION

SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM org_structure os
INNER JOIN markets m ON os.market_id = m.market_id
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 3
ORDER BY total_employees DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query
-- First execute the query before HAVING
SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM org_structure os
INNER JOIN markets m ON os.market_id = m.market_id
GROUP BY m.market_id, m.market_name

-- Then, execute the query with HAVING
SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM org_structure os
INNER JOIN markets m ON os.market_id = m.market_id
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 3
ORDER BY total_employees;

-- Subquery

-- 3.) The finance team wants to identify PR agencies that have signed more than 2 contracts.
-- Retrieve agency_id, agency_name, COUNT(contracts per agency) AS total_contracts.
-- Filter results to include only agencies with more than 2 contracts.
-- Sort results by total_contracts in descending order.

-- SOLUTION

SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > 2
ORDER BY total_contracts DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:
-- Execute the query without HAVING
SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name

-- Then, execute the query with HAVING
SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > 2
ORDER BY total_contracts DESC;


-- Main query
SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name


-- 4.) The finance team wants to identify markets where more than 3 employees are assigned.
-- Retrieve market_id, market_name, and COUNT(employees per market) AS total_employee
-- Filter results to include only markets where more than 3 employees are assigned.
-- Sort results by total_employees in descending order.

-- SOLUTION:

SELECT  m.market_id, m.market_name,
        COUNT(emp_id) AS total_employees
FROM markets m
INNER JOIN org_structure os ON m.market_id = os.market_id
GROUP BY m.market_id, m.market_name
HAVING  COUNT(emp_id) > 3
ORDER BY total_employees;


-- MAIN QUERY
SELECT  m.market_id, m.market_name,
        COUNT(emp_id) AS total_employees
FROM markets m
INNER JOIN org_structure os ON m.market_id = os.market_id
GROUP BY m.market_id, m.market_name
HAVING  COUNT(emp_id) > 3
ORDER BY total_employees;


-- 5.) The finance team wants to review all cost centers that have been allocated to
-- more than 1 project to ensure proper resource distribution.
-- Retrieve cost_center_id, budget_account, COUNT(projects per cost center) AS total_projects
-- Filter results to include only cost centers assigned to more than 1 project.
-- Sort results by total_projects in descending order.

-- SOLUTION

SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT(project_no) > 1
ORDER BY total_projects DESC;


-- JOINS
-- cost_centers cc > projects p

-- cost_centers cc - cc.cost_center_id, cc.budget_account
-- projects p - p.cost_center_id, p.project_no


-- MAIN QUERY
-- Execute without HAVING
SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account;

-- Execute with HAVING
SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT(project_no) > 1
ORDER BY total_projects DESC;


-- 6.) The finance team wants to review the number of contracts assigned
-- to each agency. They are particularly interested in agencies that have
-- at least 2 contracts assigned.
-- Retrieve agency_id, agency_name, COUNT(contracts per agency) AS total_contracts
-- Sort results by total_contracts in descending order.

-- SOLUTION

SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > 2
ORDER BY total_contracts DESC;

-- JOINS
-- agencies a > agency_contracts ac

-- agencies a - a.agency_id, a.agency_name
-- agency_contracts ac - ac.agency_id, ac.contract_no

-- MAIN QUERY
SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > 2
ORDER BY total_contracts DESC;

-- 7.) The compliance team needs a report on markets that have more than
-- 2 employees assigned to them.
-- Retrieve market_id, market_name, COUNT(employees per market) AS total_employees
-- Filter results to include only markets with more than 2 employees assigned.
-- Sort results by total_employees in descending order.


-- SOLUTION

SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM markets m
INNER JOIN org_structure os ON m.market_id = os.market_id
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 2
ORDER BY total_employees DESC;

-- JOINS
-- market m > org_structure os

-- market m - m.market_id, m.market_name
-- org_structure os - os.market_id, os.emp_id

-- MAIN QUERY
SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM markets m
INNER JOIN org_structure os ON m.market_id = os.market_id
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 2
ORDER BY total_employees DESC;


--8.) The HR department wants to identify markets that have more than 2 employees assigned
-- but only count employees with a defined job title.
-- Retrieve market_id, market_name, COUNT(employees per market with a job title) AS total_employees
-- Sort results by total_employees in descending order.

-- OPTIMIZED SOLUTION
-- Leverages the existing HAVING filter and removed the WHERE filter

SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM markets m
LEFT JOIN org_structure os ON m.market_id = os.market_id
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 2 
       AND COUNT(os.title) > 0
ORDER BY total_employees DESC;

-- SOLUTION

SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM markets m
LEFT JOIN org_structure os ON m.market_id = os.market_id
WHERE os.title IS NOT NULL
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 2
ORDER BY total_employees DESC;


-- JOINS
-- markets m > org_structure os

-- markets m - m.market_id, m.market_name
-- org_structure os - os.market_id, os.emp_id, os.title

-- MAIN QUERY
EXPLAIN ANALYZE SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM markets m
LEFT JOIN org_structure os ON m.market_id = os.market_id
WHERE os.title IS NOT NULL
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 2
ORDER BY total_employees DESC;

EXPLAIN ANALYZE SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM markets m
LEFT JOIN org_structure os ON m.market_id = os.market_id
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > 2 
       AND COUNT(os.title) > 0
ORDER BY total_employees DESC;


--9.) The HR department wants to identify cost centers that have more than 2 projects assigned
-- but only if those projects have been linked to a valid budget account.
-- Retrieve cost_center_id, budget_account, COUNT(projects assigned per cost center) AS total_projects
-- Exclude projects where the budget_account is missing (NULL) -- FILTER
-- Only return cost centers with more than 2 projects assigned. -- FILTER; SPECIFIC VALUE = > 2
-- Sort results by total_projces in descending order.

-- SOLUTION:

SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(p.project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p  ON cc.cost_center_id = p.cost_center_id
WHERE cc.budget_account IS NOT NULL
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT(p.project_no) > 2
ORDER BY total_projects DESC;

-- JOINS
-- cost_centers cc > projects p

-- cost_centers cc - cc.cost_center_id, cc.budget_account
-- projects p - p.cost_center_id, p.project_no

-- MAIN QUERY
SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(p.project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p  ON cc.cost_center_id = p.cost_center_id
WHERE cc.budget_account IS NOT NULL
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT(p.project_no) > 2
ORDER BY total_projects DESC;


--10.) The finance team wants to analyze the distribution of agency contracts. They
-- need to identify agencies that have been assigned more than 2 contracts
-- and at least 1 contract that includes a non-empty contract number.
-- Retrieve agency_id, agency_name, COUNT(contracts per agency) AS total_contracts.
-- Filter out contracts where contract_no is NULL or an empty string. -- WHERE FILTER (EXCLUDE NULL VALUES)
-- Keep only agencies with more than 2 contracts. -- HAVING FILTER SPECIFIC VALUE > 2
-- Sort results by total_contracts in descending order.


-- OPTIMIZED SOLUTION

SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
WHERE ac.contract_no IS NOT NULL AND ac.contract_no <> '' -- Checks for both NULL values and empty strings
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > 2
ORDER BY total_contracts DESC;



-- SOLUTION

SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
WHERE ac.contract_no IS NOT NULL
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > 2
ORDER BY total_contracts DESC;

-- JOINS
-- agencies a > agency_contracts ac

-- agencies a - a.agency_id, a.agency_name
-- agency_contracts ac - ac.agency_id, ac.contract_no

-- MAIN QUERY
SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
WHERE ac.contract_no IS NOT NULL
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > 2
ORDER BY total_contracts DESC;


















-- ====================================================
-- QUERYING: BEGINNER-INTERMEDIATE LEVEL SUBQUERIES (WHERE)
-- ====================================================
-- Author: Katherina Dawkins
-- Date: 2025-02-28
-- Purpose: Demonstrate query writing proficiency
-- ==============================================

-- 1.) The HR team needs a list of employees whose emp_id is greater than
-- the average employee ID currently stored in the org_structure table.
-- Retrieve emp_id, emp_name, title
-- Filter the results to include only employees with an emp_id higher than
-- the average employee ID.
-- Sort results by emp_id in ascending order

-- SOLUTION

SELECT emp_id, emp_name, title
FROM org_structure
WHERE   emp_id >
        (
        SELECT ROUND(AVG(emp_id),0) AS avg_emp_id
        FROM org_structure
        )
ORDER BY emp_id ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:
SELECT emp_id, emp_name, title
FROM org_structure
WHERE   emp_id >
        (
        SELECT ROUND(AVG(emp_id),0) AS avg_emp_id
        FROM org_structure
        )
ORDER BY emp_id ASC;

-- Main query
SELECT emp_id, emp_name, title FROM org_structure WHERE emp_id > (*Subq: AVG(emp_id) AS avg_emp_id FROM org_structure) ORDER BY emp_id ASC;

-- Subquery
SELECT ROUND(AVG(emp_id),0) AS avg_emp_id FROM org_structure;


-- 2.) The finance department wants to identify agencies that have been assigned
-- more than the average number of contracts across all agencies.
-- Retrieve agency_id, agency_name, COUNT(contract_no) AS total_contracts
-- Filter the results to include only agencies with more contracts than the average
-- numbder of contracts across all agencies.
-- Sort results by total_contracts in descending order.

-- CORRECT SOLUTION

SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name
HAVING COUNT(ac.contract_no) > (
        SELECT AVG(contract_count)
        FROM (
            SELECT agency_id, COUNT(contract_no) AS contract_count
            FROM agency_contracts
            GROUP BY agency_id
        ) subquery
    )
ORDER BY total_contracts DESC;




-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:
-- agencies > agency_contracts

-- agencies a - a.agency_id, a.agency_name
-- agency_contracts ac - ac.contract_no

SELECT  a.agency_id, a.agency_name,
        COUNT(ac.contract_no) AS total_contracts
FROM agencies a
INNER JOIN agency_contracts ac ON a.agency_id = ac.agency_id
GROUP BY a.agency_id, a.agency_name
ORDER BY total_contracts DESC;


-- Main query
SELECT agency_id, agency_name, COUNT(contract_no) AS total_contracts FROM agencies;

-- Subquery




-- 3.) The marketing team wants to analyze cost centers that have been linked to more
-- projects than the average number of projects per cost center.
-- Retrieve cost_center_id, budget_account, total_projects (count of projects per cost center).
-- Filter results to include only cost centers with more projects than the average across all
-- cost centers.
-- Sort results by total_projects in descending order.

-- CORRECT SOLUTION:

SELECT  cc.cost_center_id, cc.budget_account,
        COUNT(p.project_no) AS total_projects
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
GROUP BY cc.cost_center_id, cc.budget_account
HAVING COUNT(p.project_no) > (
        SELECT AVG(total_projects)
        FROM (
            SELECT COUNT(project_no) AS total_projects
            FROM projects
            GROUP BY cost_center_id
        ) AS subquery
    )
ORDER BY total_projects DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query
SELECT cost_center_id, budget_account, total_projects (count of projects per cost center) FROM ORDER BY total_projects DESC;

-- Subquery
-- Count projects by cost_center_id
SELECT  cost_center_id,
        COUNT(project_no) AS total_projects   
FROM projects
GROUP BY cost_center_id;

-- Average cost center
SELECT  AVG(COUNT(project_no) AS project_by_cost_center        
FROM projects
GROUP BY cost_center_id;

-- 4.) The HR department wants to identify markets that have more assigned employees than the average
-- number of employees across all markets.
-- Retrieve market_id, market_name, AS total_employees (COUNT of employees per market).
-- Filter results to include only markets with more employees than the average number of employees
-- across all markets.
-- Sort results by total_employees in descending order.


-- CORRECT SOLUTION:

SELECT  m.market_id, m.market_name,
        COUNT(os.emp_id) AS total_employees
FROM markets m
INNER JOIN org_structure os ON m.market_id = os.market_id
GROUP BY m.market_id, m.market_name
HAVING COUNT(os.emp_id) > (
        SELECT AVG(subquery.total_employees)
        FROM (
            SELECT market_id, COUNT(emp_id) AS total_employees
            FROM org_structure
            GROUP BY market_id
        ) AS subquery
    )
ORDER BY total_employees DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query

SELECT  market_id, market_name,
        COUNT (employees per market) AS total_employees
FROM
GROUP BY
HAVING
        (
        SELECT  m.market_id, m.market_name,
        COUNT (emp_id) AS total_employees
        FROM org_structure os
        INNER JOIN markets m ON os.market_id = m.market_id
        GROUP BY  m.market_id, m.market_name
ORDER BY total_employees DESC) AS subquery

-- Subquery
-- Find total employees per market
SELECT  m.market_id, m.market_name,
        COUNT (emp_id) AS total_employees
FROM org_structure os
INNER JOIN markets m ON os.market_id = m.market_id
GROUP BY  m.market_id, m.market_name;

-- Find the average number of employees across all markets
SELECT AVG(total_employees) FROM org_structure

-- X.)

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query


-- Subquery

-- X.)

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query


-- Subquery

-- X.)

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query


-- Subquery

-- X.)

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query


-- Subquery

-- X.)

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query


-- Subquery

-- X.)

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query


-- Subquery

-- X.)

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Joins

-- TEST SOLUTION:


-- Main query


-- Subquery


-- ==============================================
-- QUERYING: BEGINNER LEVEL SUBQUERIES (SELECT)
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-28
-- Purpose: Demonstrate query writing proficiency
-- ==============================================

-- 1.) The finance team needs a report on all campaigns, including how their allocated budget
-- compares to the average campaign budget.
-- Retrieve campaign_id, campaign_name, budget_allocated, AVG(campaign_budget)
-- Sort the results by budget_allocatedfrom highest to lowest

-- SOLUTION
SELECT  campaign_id, campaign_name, budget_allocated,
        (SELECT ROUND(AVG(budget_allocated),2) FROM campaigns)
FROM campaigns
ORDER BY budget_allocated DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT  campaign_id, campaign_name, budget_allocated,
        (SELECT ROUND(AVG(budget_allocated),2) FROM campaigns)
FROM campaigns
ORDER BY budget_allocated DESC;

-- Joins
NONE

-- Main query
SELECT  campaign_id, campaign_name, budget_allocated,
        (SELECT ROUND(AVG(budget_allocated),2) FROM campaigns)
FROM campaigns
ORDER BY budget_allocated DESC;

-- Subquery
   (SELECT ROUND(AVG(budget_allocated),2) FROM campaigns)



-- 2.) The HR team wants to generate a report showing all employees and the total number
-- of employees in the organization for reference.
-- Retrieve emp_id, emp_name, COUNT(emp_id)
-- Sort the results by emp_id in ascending order

-- SOLUTION

SELECT  emp_id, emp_name,
        (SELECT COUNT(emp_id) AS total_num_employees
         FROM org_structure)
FROM org_structure
ORDER BY emp_id ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:

SELECT  emp_id, emp_name,
        (SELECT COUNT(emp_id) AS total_num_employees
         FROM org_structure)
FROM org_structure
ORDER BY emp_id ASC;

-- Joins

-- Main query
SELECT emp_id, emp_name, (SELECT COUNT(emp_id) FROM org_structure) FROM org_structure ORDER BY emp_id ASC;

-- Subquery
(SELECT COUNT(emp_id) FROM org_structure)




-- 3.) The compliance team needs a report showing all agency contracts along with the
-- total number of contracts in the system for reference.
-- Retrieve contract_no, agency_id, Subq: total_num_contracts in the agency_contracts table.
-- Sort the results by contract_no in ascending order.

-- SOLUTION

SELECT  contract_no, agency_id,(
        SELECT COUNT(contract_no) AS total_num_contracts
        FROM agency_contracts)
FROM agency_contracts
ORDER BY contract_no ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:

SELECT  contract_no, agency_id,(
        SELECT COUNT(contract_no) AS total_num_contracts
        FROM agency_contracts)
FROM agency_contracts
ORDER BY contract_no ASC;

-- Joins

-- Main query
SELECT contract_no, agency_id, (SELECT COUNT(contract_no) AS total_num_contracts FROM agency_contracts) FROM agency_contracts ORDER BY contract_no ASC;

-- Subquery
(SELECT COUNT(contract_no) AS total_num_contracts FROM agency_contracts)



-- 4.) The finance team wants to generate a report showing all cost centers along with
-- the highed budget allocation from any campaign for reference.
-- Retrieve cost_center_id, budget_account.
-- Include a new column displaying the highest allocated budget across all campaigns.
-- Sort the results by cost_center_id in ascending order.

-- CORRECT SOLUTION:
-- Removed unnecessary joins

SELECT  cc.cost_center_id, cc.budget_account,
        (
        SELECT MAX(budget_allocated) AS highest_allocated_budget
        FROM campaigns
        )
FROM cost_centers cc
ORDER BY cost_center_id ASC;


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT  cc.cost_center_id, cc.budget_account,
        (
        SELECT MAX(budget_allocated) AS highest_allocated_budget
        FROM campaigns
        )
FROM cost_centers cc
INNER JOIN projects p ON cc.cost_center_id = p.cost_center_id
INNER JOIN campaign_mapping cm ON p.project_no = cm.project_no
INNER JOIN campaigns c ON cm.campaign_id = c.campaign_id
ORDER BY cost_center_id ASC;

-- Joins
-- cost_centers > projects > campaign_mapping > campaigns

-- cost_centers cc - cc.cost_center_id, cc.budget_account
-- projects p - p.cost_center_id, p.project_no
-- campaign_mapping cm - cm.project_no, cm.campaign_id
-- campaigns c - c.budget_allocated, c.campaign_id


-- Main query

SELECT cost_center_id, budget_account, (SELECT MAX(budget_allocated) FROM campaigns) FROM cost_centers ORDER BY cost_center_id ASC;

-- Subquery
(SELECT MAX(budget_allocated) AS highest_allocated_budget FROM campaigns)

-- 5.) The analytics team wants to generate a report showing all markets along with
-- the total numbder of distinct regions for reference.
-- Retrieve market_id, market_name.
-- Include a new column displaying the total number of distinct regions in the markets table.
-- Sort the result by market_id in ascending order.

-- CORRECT SOLUTION:
-- Syntax issue corrected to 'COUNT(DISTINCT)' from 'DISTINCT(COUNT)'
-- "First find DISTINCT values, then COUNT them."

SELECT  market_id, market_name,
        (
        SELECT COUNT (DISTINCT (region_name)) AS total_num_distinct_regions
        FROM markets
        )
FROM markets
ORDER BY market_id ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT  market_id, market_name,
        (
        SELECT
        DISTINCT COUNT (region_name) AS total_num_distinct_regions
        FROM markets
        )
FROM markets
ORDER BY market_id ASC;

-- Joins
-- NONE

-- Main query
SELECT market_id, market_name, SELECT DISTINCT COUNT (region_name) FROM markets FROM markets ORDER BY market_id ASC;

-- Subquery
SELECT DISTINCT COUNT (region_name) AS total_num_distinct_regions FROM markets FROM markets

-- 6.) The HR department wants to generate a report showing all employees along with the total
-- number of distinct job titles in the company.
-- Retrieve emp_id, emp_name.
-- Include a new column displaying the total numbder of distinct job titles from org_structure.
-- Sort the results by emp_id in ascending order.

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT  emp_id, emp_name,
        (
        SELECT COUNT (DISTINCT title) AS total_num_distinct_job_titles
        FROM org_structure
        )
FROM org_structure
ORDER BY emp_id ASC;

-- Joins


-- Main query
SELECT emp_id, emp_name, (*Subq: total_num_distinct_job_titles) FROM org_structure ORDER BY emp_id ASC;


-- Subquery
(SELECT COUNT (DISTINCT title) AS total_num_distinct_job_titles  FROM org_structure)


-- 7.) The legal department wants a report showing all active contracts along with the total numbder of
-- contracts managed by agencies.
-- Retrieve contract_no, agency_id.
-- Include a new column displaying the total number of contracts in the agency_contracts table.
-- Sort the results by contract_no in ascending order.

-- SOLUTION


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT  contract_no, agency_id,
        (
        SELECT COUNT(DISTINCT (contract_no)) AS total_num_contracts
        FROM agency_contracts
        )
FROM agency_contracts
ORDER BY contract_no ASC;

-- Joins

-- Main query
SELECT contract_no, agency_id, (SELECT COUNT(DISTINCT (contract_no)) AS total_num_contracts FROM agency_contracts) FROM agency_contracts ORDER BY contract_no ASC;

-- Subquery
(SELECT COUNT(DISTINCT (contract_no)) AS total_num_contracts FROM agency_contracts)



-- 8.) The executive team wants a report displaying all markets along with the
-- total numbder of employees assigned to each market for workforce analysis.
-- Retrieve market_id, market_name
-- Include a new column displaying the total number of employees assigned to any market.
-- Sort the results by market_id in ascending order.

-- CORRECT SOLUTION

SELECT  market_id, market_name,
        (
        SELECT COUNT(DISTINCT emp_id) AS total_emp_assigned
        FROM org_structure
        )
FROM markets
ORDER BY market_id ASC;


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:

SELECT  market_id, market_name,
        (
        SELECT COUNT(DISTINCT market_id) AS total_emp_assigned
        FROM org_structure
        )
FROM markets
ORDER BY market_id ASC;

-- Joins

-- Main query
SELECT market_id, market_name, (SELECT COUNT(DISTINCT market_id) FROM org_structure) FROM markets;

-- Subquery
SELECT COUNT(DISTINCT market_id) FROM org_structure;


-- 9.) The finance team wants a report showing all agencies along with the total number of unique
-- agency legal entities for compliance tracking.
-- Retrieve agency_id, agency_name
-- Include a new column displaying the total number of distinct agency legal entities in the
-- agencies table.
-- Sort the results by agency_id in ascending order

-- SOLUTION

SELECT  agency_id, agency_name,
        (
        SELECT COUNT(DISTINCT agency_legal_entity) AS total_num_distinct_agency_legal_entity
        FROM agencies
        )
FROM agencies
ORDER BY agency_id;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT  agency_id, agency_name,
        (
        SELECT COUNT(DISTINCT agency_legal_entity) AS total_num_distinct_agency_legal_entity
        FROM agencies
        )
FROM agencies
ORDER BY agency_id;

-- Joins


-- Main query
SELECT agency_id, agency_name, (*Subq: COUNT(DISTINCT total_num_distinct_agency_legal_entities)) FROM agencies ORDER BY agency_id;

-- Subquery
SELECT COUNT(DISTINCT agency_legal_entity) AS total_num_distinct_agency_legal_entity FROM agencies



-- 10.) The procurement team wants a report displaying all agency contracts along with the total number of
-- contracts managed across all agencies for performance tracking.
-- Retrieve contract_no, agency_id.
-- Include a new column displaying the total number of contracts in the agency_contracts table.
-- Sort the results by contract_no in ascending order.

-- SOLUTION

SELECT  contract_no, agency_id,
        (
        SELECT COUNT(DISTINCT (contract_no)) AS total_num_contracts
        FROM agency_contracts
        )
FROM agency_contracts
ORDER BY contract_no ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT  contract_no, agency_id,
        (
        SELECT COUNT(DISTINCT (contract_no)) AS total_num_contracts
        FROM agency_contracts
        )
FROM agency_contracts
ORDER BY contract_no ASC;

-- Joins


-- Main query
SELECT contract_no, agency_id, (*Subq: AS total number of contracts in the agency_contracts table) FROM agency_contracts ORDER BY contract_no ASC;

-- Subquery
-- First, find the DISTINCT values
-- Then, COUNT them.
SELECT COUNT(DISTINCT (contract_no)) AS total_num_contracts FROM agency_contracts 


-- ==============================================
-- QUERYING: BEGINNER LEVEL SUBQUERIES (WHERE)
-- ==============================================
-- Author: Katherina Dawkins
-- Date: 2025-02-27
-- Purpose: Demonstrate query writing proficiency
-- ==============================================

-- 1.) The Finance team wants to see all campaigns that started
-- after the earliest recorded campaign start date.
-- Retrieve campaign_id, campaign_name, and start_date.
-- Use a subquery inside WHERE to find campaigns where start_date
-- is after the earliest recorded campaign start date.
-- Order by start_date in ascending order.

-- SOLUTION

SELECT campaign_id, campaign_name, start_date
FROM campaigns
WHERE start_date > (SELECT MIN(start_date) FROM campaigns)
ORDER BY start_date ASC;


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Subquery
-- Used aggregation function MIN to identify earliest start date, 2022-03-05.
SELECT MIN(start_date) FROM campaigns;


-- 2.) The budgeting team wants a report showing each campaign's budget alongside
-- the average campaign budget for comparison.
-- Retrieve campaign_id, campaign_name, budget_allocated, and average campaign budget.
-- Use a subquery inside SELECT to display the average budget for all campaigns.
-- Order by budget_allocated in descending order.

-- SOLUTION
SELECT  campaign_id, campaign_name, budget_allocated,
        (SELECT ROUND(AVG(budget_allocated),2) AS average_campaign_budget FROM campaigns)
FROM campaigns
ORDER BY budget_allocated DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Main query
SELECT  campaign_id, campaign_name, budget_allocated,
        (SELECT ROUND(AVG(budget_allocated),2) AS average_campaign_budget FROM campaigns)
FROM campaigns
ORDER BY budget_allocated DESC;

-- Subquery
SELECT ROUND(AVG(budget_allocated),2) AS average_campaign_budget FROM campaigns;


-- 4.) The finance team wants to identify campaigns with the highest budget
-- compared to all other campaigns.
-- Retrieve campaign_id, campaign_name, and budget_allocated.
-- Use a subquery inside WHERE to filter only campaigns where budget_allocated equals the higheset campaign budget.
-- Order by campaign_id in ascending order.

-- SOLUTION

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Main query
SELECT campaign_id, campaign_name, budget_allocated
FROM campaigns
WHERE budget_allocated =
    (SELECT MAX(budget_allocated)
    FROM campaigns)
ORDER BY campaign_id ASC;

-- Subquery
-- Identify the highest budget (MAXIMUM) for all campaigns
SELECT MAX(budget_allocated) FROM campaigns;


-- 5.) The finance team wants to see all campaigns with budgets lower than
-- the highest allocated budget in the database.
-- Retrieve campaign_id, campaign_name, and budget_allocated
-- Order by budget_allocated in descending order.


-- SOLUTION

SELECT campaign_id, campaign_name, budget_allocated
FROM campaigns
WHERE budget_allocated < (SELECT MAX(budget_allocated) AS highest_budget_allocated FROM campaigns)
ORDER BY budget_allocated DESC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- Main query
SELECT campaign_id, campaign_name, budget_allocated FROM campaigns ORDER BY budget_allocated DESC;

-- TEST
SELECT campaign_id, campaign_name, budget_allocated
FROM campaigns
WHERE budget_allocated < (SELECT MAX(budget_allocated) AS highest_budget_allocated FROM campaigns)
ORDER BY budget_allocated DESC;

-- Subquery
-- Highest budget_allocated
SELECT MAX(budget_allocated) AS highest_budget_allocated FROM campaigns;

-- 6.) The HR team wants to identify employees who were assigned to a market with the highest recorded
-- market_id in the system.
-- Retrieve emp_id, emp_name, and market_id.

-- SOLUTION:

SELECT emp_id, emp_name, market_id
FROM org_structure
WHERE market_id = (
    SELECT MAX(market_id)
    FROM org_structure)
ORDER BY emp_id ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:
SELECT emp_id, emp_name, market_id
FROM org_structure
WHERE market_id = (
    SELECT MAX(market_id)
    FROM org_structure)
ORDER BY emp_id ASC;

-- Main query
SELECT emp_id, emp_name, market_id FROM org_structure WHERE market_id = ORDER BY emp_id ASC;

-- Subquery
-- Highest (MAX) market_id.org_structure

SELECT MAX(market_id) FROM org_structure;

-- Joins


-- 7.) The finance department wants to identify agencies that have at least one active contract.
-- Retrieve agency_id and agency_name
-- Use a subquery inside WHERE to filter only agencies that appear in agency_contracts (i.e., have at
-- least one contract).
-- Order by agency_id in ascending_order.

-- SOLUTION
-- Presented to Chiron, Joins generally preferred over subqueries when pulling related data across tables.

SELECT a.agency_id, a.agency_name
FROM agencies a
LEFT JOIN agency_contracts ac ON a.agency_id = ac.agency_id
WHERE ac.contract_no IS NOT NULL
ORDER BY agency_id ASC;


-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:

SELECT a.agency_id, a.agency_name
FROM agencies a
LEFT JOIN agency_contracts ac ON a.agency_id = ac.agency_id
WHERE ac.contract_no IS NOT NULL
ORDER BY agency_id ASC;

-- Main query

SELECT a.agency_id, a.agency_name FROM agencies a LEFT JOIN agency_contracts ac ON a.agency_id = ac.agency_id ORDER BY agency_id ASC;

-- Subquery
SELECT agency_name FROM agencies;

-- Joins
-- agencies > agency_contracts
-- agencies a - a.agency_id, a.agency_name
-- agency_contracts ac - ac.agency_id, ac.contract_no



-- 8.) The HR team wants to see all employees who belong to markets that exist in the
-- markets table (i.e., only employees assigned to a valid market)
-- Retrieve emp_id, emp_name, market_id
-- Use a subquery inside WHERE to filter only employees whose market_id exists in
-- markets table.
-- Order by emp_id in ascending order

-- CORRECT SOLUTION
-- Removed redudndant filtering (IN, WHERE conditions that don't add value).
-- Fully relies on the JOIN to ensure valid market_id's (e.g., (INNER) JOIN excludes NULLS only displays matches)
-- More efficient and readable without unnecessary conditions

SELECT os.emp_id, os.emp_name, os.market_id
FROM org_structure os
JOIN markets m ON os.market_id = m.market_id
ORDER BY emp_id ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTIONS:
-- Redundant, JOIN already retrieves all market_id's from markets (excludes NULL values)
SELECT os.emp_id, os.emp_name, os.market_id
FROM org_structure os
JOIN markets m ON os.market_id = m.market_id
WHERE m.market_id IN (
    SELECT DISTINCT (market_id)
    FROM markets)
ORDER BY emp_id ASC;


-- WHERE clause is unnecessary because JOIN removes NULL market_id's
SELECT os.emp_id, os.emp_name, os.market_id
FROM org_structure os
JOIN markets m ON os.market_id = m.market_id
WHERE m.market_id IS NOT NULL
ORDER BY emp_id ASC;

-- Main query
SELECT emp_id, emp_name, market_id FROM org_structure ORDER BY emp_id ASC;

-- Subquery
SELECT market_id FROM markets;

-- Joins
-- org_structure > markets
-- org_structure os - os.emp_id, os.emp_name, os.market_id
-- markets m - m.market_id, m.market_name


-- 9.) The finance team wants to identify the agencies with the smallest
-- agency_id values in the system.
-- Retrieve agency_id, agency_name
-- Use a subquery inside WHERE to filter only agencies where agency_id equals
-- the smallest recorded agency_id.
-- Order by agency_id in ascending order.

-- SOLUTION

SELECT agency_id, agency_name
FROM agencies
WHERE agency_id = (SELECT MIN(agency_id) FROM agencies);

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:

SELECT agency_id, agency_name
FROM agencies
WHERE agency_id = (SELECT MIN(agency_id) FROM agencies);

-- Main query
SELECT agency_id, agency_name FROM agencies;

-- Subquery
-- Smallest (MIN) agency_id
SELECT MIN(agency_id) FROM agencies;

-- Joins
-- None


-- 10.) The finance team wants to identify the payment with the highest amount_usd
-- in the pmo table.
-- Retrieve payment_no, transaction_date, amount_usd
-- Use subquery inside WHERE to filter only the payment where amount_usd equals the
-- highest recorded amount in the table.
-- Order by payment_no in ascending order.

-- SOLUTION

SELECT payment_no, transaction_date, amount_usd
FROM pmo
WHERE amount_usd = (SELECT MAX(amount_usd) FROM pmo)
ORDER BY payment_no ASC;

-- ---------------------------------------------
-- SCRATCH PAPER AREA
-- ---------------------------------------------

-- TEST SOLUTION:

SELECT payment_no, transaction_date, amount_usd
FROM pmo
WHERE amount_usd = (SELECT MAX(amount_usd) FROM pmo)
ORDER BY payment_no ASC;

-- Main query
SELECT payment_no, transaction_date, amount_usd FROM pmo ORDER BY payment_no ASC LIMIT 10;

-- Subquery
-- Highest (MAX) payment amount?
SELECT MAX(amount_usd) FROM pmo;


-- Joins


