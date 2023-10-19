SELECT count(*)
FROM 
czechia_payroll;

SELECT 
count(id)
FROM 
czechia_payroll;

SELECT 
count(id)
FROM czechia_payroll
WHERE value_type_code = '316' AND value IS NOT NULL;


SELECT 
* 
FROM czechia_payroll_value_type;

SELECT 
	category_code,
	year(date_from) AS year_of_entry,
	count(category_code)
FROM czechia_price
GROUP BY category_code, year_of_entry
ORDER BY year_of_entry;

SELECT
    category_code, YEAR(date_from) AS year_of_entry,
    COUNT(id) AS rows_in_category
FROM czechia_price
GROUP BY category_code, year_of_entry
ORDER BY year_of_entry, category_code;


SELECT 
*
FROM czechia_price;

SELECT 
	sum(value) AS value_sum
FROM czechia_payroll
WHERE value_type_code = '316';

SELECT 
	czechia_price.category_code,
	sum(value) AS sum_value
FROM czechia_price
WHERE region_code = 'CZ064'
GROUP BY category_code; 

SELECT 
*
FROM czechia_price_category;


SELECT 
*
FROM czechia_region;

SELECT
		sum(value) AS sum_value
FROM czechia_price
WHERE date_from = '2018-01-15';

SELECT
    SUM(value) AS sum_of_average_prices
FROM czechia_price
WHERE date_from = CAST('2018-01-15' AS date);

SELECT 
	category_code,
	count(*) AS row_count,
	sum(value) AS sum_value
FROM czechia_price
WHERE YEAR(date_from) = '2018'
GROUP BY category_code;








