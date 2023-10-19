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
