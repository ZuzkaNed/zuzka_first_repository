
	

CREATE TABLE t_average_payroll_per_industry_and_year AS 
	(SELECT 
    	cp.payroll_year AS reference_period,
		cpib.name,
		round(avg(value),0) AS average_payroll_per_year
	FROM czechia_payroll cp
		JOIN czechia_payroll_industry_branch cpib 
		ON cp.industry_branch_code = cpib.code 
	WHERE value_type_code = 5958 AND calculation_code = 100
	GROUP BY  cp.industry_branch_code, cp.payroll_year )
;

SELECT 
*
FROM t_average_payroll_per_industry_and_year;

WITH average_food_price as
 	(SELECT 
		year(date_from) AS reference_period,
		cpc.name,
		round(avg(value),2) AS average_price,
		cpc.price_value AS price_value,
		cpc.price_unit AS price_unit
	FROM czechia_price cp
	JOIN czechia_price_category cpc
	ON cp.category_code = cpc.code
	GROUP BY cpc.name, reference_period) 
SELECT 
	payroll.reference_period,
	payroll.name AS industry_name,
	payroll.average_payroll_per_year,
	food.name AS product_name,
	food.average_price,
	food.price_value,
	food.price_unit,
	round(payroll.average_payroll_per_year/food.average_price,2) AS availability_of_product
FROM average_food_price food		
JOIN t_average_payroll_per_industry_and_year payroll
ON food.reference_period = payroll.reference_period ;



