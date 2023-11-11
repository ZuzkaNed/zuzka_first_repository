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

SELECT 
*
FROM czechia_payroll;

-- 1. rostou v prubehu let mzdy ve všech odvetvích, nebo v nekterych klesaji? --

SELECT 
	industry_branch_code,
	value,
	payroll_year,
	payroll_quarter 
FROM czechia_payroll
WHERE value_type_code = 5958 AND calculation_code = 200-- prumerna mzda (prepoctena na plny uvazek) za kazde odvetvi od roku 2000 do 2021 --
;  


-- prumerna mzda (prepoctena na plny uvazek) za roky 2000 az 2021 v odvetvi A --
SELECT 
	industry_branch_code,
	avg(value) AS average_payroll_per_year, 
	payroll_year
FROM czechia_payroll
WHERE value_type_code = 5958 AND calculation_code = 200 AND industry_branch_code = 'A' 
GROUP BY payroll_year
ORDER BY average_payroll_per_year;  

SELECT 
	industry_branch_code,
	avg(value) AS average_payroll_per_year, 
	payroll_year
FROM czechia_payroll
WHERE value_type_code = 5958 AND calculation_code = 200 AND industry_branch_code = 'S' 
GROUP BY payroll_year
ORDER BY payroll_year ;











