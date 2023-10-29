SELECT 
	*	
FROM czechia_payroll
WHERE value_type_code = 5958 AND industry_branch_code = 'a' AND payroll_year = 2000 ;


SELECT 
	payroll_year,
	industry_branch_code,
	avg(value) AS avg_payroll_per_year
FROM czechia_payroll
WHERE value_type_code = 5958 AND industry_branch_code = 'a'
GROUP BY payroll_year;

SELECT 
*
FROM czechia_payroll_value_type ;

SELECT 
*
FROM czechia_payroll_unit;

SELECT
*
FROM czechia_payroll_industry_branch;

SELECT 
*
FROM czechia_payroll_calculation;




