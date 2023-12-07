SELECT 
*
FROM t_average_payroll_per_year;


 -- prumerna rocni mzda za kazde odvetvi 

SELECT 
	industry_branch_code,
	round(avg(value),0) AS average_payroll_per_year, 
	payroll_year
FROM czechia_payroll
WHERE value_type_code = 5958 AND calculation_code = 100 AND industry_branch_code IS NOT null
GROUP BY payroll_year, industry_branch_code 
ORDER BY payroll_year ;


SELECT 
	payroll_year,
	round(avg(average_payroll_per_year),0) AS average_payroll
FROM 
	(
	SELECT 
		industry_branch_code AS industry_branch_code,
		round(avg(value),0) AS average_payroll_per_year, 
		payroll_year AS payroll_year
	FROM czechia_payroll
	WHERE value_type_code = 5958 AND calculation_code = 100 AND industry_branch_code IS NOT null
	GROUP BY payroll_year, industry_branch_code 
	ORDER BY payroll_year
	) average_payroll_industry
GROUP BY payroll_year
;	


SELECT 
		payroll_year,
		round(avg(value),0) AS average_payroll_per_year
	FROM czechia_payroll
	WHERE value_type_code = 5958 AND calculation_code = 100
	GROUP BY payroll_year; 

SELECT 
	cp.industry_branch_code,
	cpib.name,
	cp.payroll_year,
	round(avg(value),0) AS average_payroll_per_year
FROM czechia_payroll cp
	JOIN czechia_payroll_industry_branch cpib 
	ON cp.industry_branch_code = cpib.code 
WHERE value_type_code = 5958 AND calculation_code = 200
GROUP BY cp.industry_branch_code, cp.payroll_year ;

SELECT 
*
FROM czechia_payroll_calculation;
SELECT 
*
FROM czechia_payroll_industry_branch;


