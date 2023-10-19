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

SELECT 
	max(value)
FROM czechia_payroll
WHERE value_type_code = '5958';

SELECT 
* 
FROM czechia_payroll;

SELECT 
*
FROM czechia_payroll_value_type;

SELECT 
	category_code,
	min(value) AS min_value
FROM czechia_price
WHERE year(date_from) BETWEEN 2015 AND 2017
GROUP BY category_code;

SELECT 
	industry_branch_code,
	max(value) AS max_avg_payroll
FROM czechia_payroll
WHERE value_type_code = 5958
GROUP BY industry_branch_code
ORDER BY max_avg_payroll desc ;

SELECT
    industry_branch_code
FROM czechia_payroll
WHERE value IN (
    SELECT
        MAX(value)
    FROM czechia_payroll
    WHERE value_type_code = 5958
);

SELECT
    *
FROM czechia_payroll_industry_branch
WHERE code IN (
    SELECT
        industry_branch_code
    FROM czechia_payroll
    WHERE value IN (
        SELECT
            MAX(value)
        FROM czechia_payroll
        WHERE value_type_code = 5958
    )
);



SELECT 
*
FROM czechia_payroll_industry_branch;

SELECT 
*
FROM czechia_price_category;

SELECT 
	category_code,
	min(value) AS min_value,
	max(value) AS max_value,
	CASE WHEN  max(value) - min(value) < 10 THEN 'rozdil do 10kc'
		 WHEN  max(value) - min(value) BETWEEN 10 AND 40 THEN 'rozdil do 40kc'
		 WHEN  max(value) - min(value) > 40 THEN 'rozdil nad 40kc'
	END AS difference
FROM czechia_price
GROUP BY category_code
ORDER BY difference;

SELECT
    category_code,
    MIN(value),
    MAX(value),
    CASE
        WHEN MAX(value) - MIN(value) < 10 THEN 'rozdíl do 10 Kč'
        WHEN MAX(value) - MIN(value) < 40 THEN 'rozdíl do 40 Kč'
        ELSE 'rozdíl nad 40 Kč'
    END AS difference
FROM czechia_price
GROUP BY category_code
ORDER BY difference;












