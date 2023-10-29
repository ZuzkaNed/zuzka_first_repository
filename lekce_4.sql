SELECT *
FROM czechia_price cp
	JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code;
		
SELECT 
	cp.id,
	cpc.name, 
	cp.value,
	cr.name
FROM czechia_price cp
	JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code
	LEFT JOIN czechia_region cr
		ON cp.region_code = cr.code;
	
SELECT
    cp.*, cr.name
FROM czechia_region AS cr
	RIGHT JOIN czechia_price  AS cp
    	ON cp.region_code = cr.code;


SELECT 
*
FROM czechia_region;

SELECT 
*
FROM czechia_price;

SELECT 
*
FROM czechia_payroll cp
	JOIN czechia_payroll_calculation cpc
		ON cp.calculation_code = cpc.code 
	JOIN czechia_payroll_industry_branch cpib
		ON cp.industry_branch_code = cpib.code
	JOIN czechia_payroll_unit cpu
		ON cp.unit_code = cpu.code 
	JOIN czechia_payroll_value_type cpvt
		ON cp.value_type_code = cpvt.code;
	
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
  cpib.*
FROM czechia_payroll cp
	RIGHT JOIN czechia_payroll_industry_branch cpib
		ON cp.industry_branch_code = cpib.code
WHERE cp.value_type_code = 5958
ORDER BY cp.value DESC
LIMIT 1;

SELECT
    cpc.name AS food_category, cp.value AS price,
    cpib.name AS industry, cpay.value AS average_wages,
    DATE_FORMAT(cp.date_from, '%e. %M %Y') AS price_measured_from,
    DATE_FORMAT(cp.date_to, '%d.%m.%Y') AS price_measured_to,
    cpay.payroll_year
FROM czechia_price AS cp
JOIN czechia_payroll AS cpay
    ON YEAR(cp.date_from) = cpay.payroll_year AND
    cpay.value_type_code = 5958 AND
    cp.region_code IS NULL
JOIN czechia_price_category cpc
    ON cp.category_code = cpc.code
JOIN czechia_payroll_industry_branch cpib
    ON cpay.industry_branch_code = cpib.code;
   
SELECT
    hp.name,
    cr.name AS region_name,
    cr2.name AS residence_region_name,
    cd.name AS district_name,
    cd2.name AS residence_district_name
FROM healthcare_provider hp
LEFT JOIN czechia_region cr
    ON hp.region_code = cr.code
LEFT JOIN czechia_region cr2
    ON hp.residence_region_code = cr2.code
LEFT JOIN czechia_district cd
    ON hp.district_code = cd.code
LEFT JOIN czechia_district cd2
    ON hp.residence_district_code = cd2.code;


		





	