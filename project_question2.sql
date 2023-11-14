--Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?--

SELECT 
*
FROM czechia_price;

SELECT 
*
FROM czechia_price_category;

SELECT 	
	cp.category_code,
	cpc.name,
	cp.value,
	cpc.price_value,
	cpc.price_unit,
	date(cp.date_from), 
	date(cp.date_to),
	cp.region_code 
FROM czechia_price cp
JOIN czechia_price_category cpc
	ON cp.category_code = cpc.code
WHERE cp.category_code = 111301; -- vyvoj cen chleba --

SELECT 	
	cp.category_code,
	cpc.name,
	cp.value,
	cpc.price_value,
	cpc.price_unit,
	date(cp.date_from), 
	date(cp.date_to),
	cp.region_code 
FROM czechia_price cp
JOIN czechia_price_category cpc
	ON cp.category_code = cpc.code
WHERE cp.category_code = 114201
	; -- vyvoj cen mleka --

SELECT 	
	cp.category_code,
	cpc.name,
	round(avg(cp.value),2),
	cpc.price_value,
	cpc.price_unit,
	year(cp.date_from)	
FROM czechia_price cp
JOIN czechia_price_category cpc
	ON cp.category_code = cpc.code
WHERE cp.category_code = 111301
GROUP BY year(cp.date_from)
UNION ALL 
SELECT 	
	cp.category_code,
	cpc.name,
	round(avg(cp.value),2),
	cpc.price_value,
	cpc.price_unit,
	year(cp.date_from)	
FROM czechia_price cp
JOIN czechia_price_category cpc
	ON cp.category_code = cpc.code
WHERE cp.category_code = 114201
GROUP BY year(cp.date_from); -- prumerna cena mleka a chleba za rok 2006 -  2018 --


SELECT 
	payroll_year,
	concat(round(avg(value),0),' kč') AS average_payroll_per_year
FROM czechia_payroll
WHERE value_type_code = 5958 AND calculation_code = 100
GROUP BY payroll_year; -- prumerna hruba fyzicka mzda, vo vsetkych odvetciach za jednotlive roky -- 

SELECT 
	payroll_year,
	avg(value)		
FROM czechia_payroll
WHERE value_type_code = 5958 AND calculation_code = 100 AND payroll_year = 2001;
;


