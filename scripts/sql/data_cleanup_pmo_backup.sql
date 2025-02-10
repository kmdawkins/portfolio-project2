-- Data cleanup to resolve duplicate project numbers in pmo_backup table

UPDATE pmo_backup
SET project_no = CASE
	WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20223000' THEN 'PJ20223500'
	WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20224000' THEN 'PJ20224500'
	WHEN budget_account = 'Trust and Safety' AND project_no = 'PJ20225000' THEN 'PJ20225500'
	ELSE project_no
END
WHERE budget_account = 'Trust and Safety';

--Verify query update

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