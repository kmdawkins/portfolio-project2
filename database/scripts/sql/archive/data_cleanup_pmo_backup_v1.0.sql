-- Data cleanup to resolve duplicate project numbers in pmo_backup table

UPDATE pmo_backup
SET project_no = CASE
	WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20223000' THEN 'PJ20223500'
	WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20224000' THEN 'PJ20224500'
	WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20225000' THEN 'PJ20225500'
	ELSE project_no
END
WHERE budget_account = 'Trust and Safety';

-- Verification query for duplicate project number update

SELECT
	budget_account,
	project_no,
	COUNT(*)
FROM
	pmo_backup
GROUP BY
	budget_account, project_no
ORDER BY
	budget_account;


-- Data cleanup to resolve region name reassignment to new region North America in pmo_backup table
UPDATE public.pmo_backup
SET region_name =
	CASE
		WHEN market IN ('Canada', 'United States') THEN 'North America'
		ELSE region_name
	END
WHERE market IN ('Canada','United States');


-- Data cleanup to resolve region name reassignment to new Corporate in pmo_backup table
UPDATE public.pmo_backup
SET region_name =
	CASE
		WHEN market IN ('Tik Tok', 'ByteDance Corporate') THEN 'Corporate'
		ELSE region_name
	END
WHERE market IN ('Tik Tok', 'ByteDance Corporate');

--Verification query for data cleanup update
SELECT
	region_name,
	market
FROM pmo_backup
GROUP BY region_name
ORDER BY region_name ASC;

-- Data cleanup to resolve company name correction from 42Weeks to 42West in pmo_backup table
UPDATE public.pmo_backup
SET company_name = '42West'
WHERE company_name ILIKE '42Weeks';

--Verification query for data cleanup update
SELECT
	project_no,
	company_name,
	COUNT(*)
FROM pmo_backup
GROUP BY project_no, company_name
ORDER BY company_name ASC;

