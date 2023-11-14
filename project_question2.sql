--Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?--
-- první srovnatelné období - 2016 --
-- poslední srovnatelné období - 2018 --

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

CREATE TABLE t_average_prices_milk_bread AS -- vytvoreni nove tabulky -> prumerna cena mleka a chleba za rok 2006 -  2018 --
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
	GROUP BY year(cp.date_from); 
	
CREATE TABLE t_average_payroll_per_year AS  -- vytvoerni tabulky -> prumerna hruba fyzicka mzda, vo vsetkych odvetciach za jednotlive roky -- 
	SELECT 
		payroll_year,
		round(avg(value),0) AS average_payroll_per_year
	FROM czechia_payroll
	WHERE value_type_code = 5958 AND calculation_code = 100
	GROUP BY payroll_year; 


SELECT 
	payroll_year,
	avg(value)		
FROM czechia_payroll
WHERE value_type_code = 5958 AND calculation_code = 100 AND payroll_year = 2001;

select 
	ap.payroll_year,
	apmp.`year(cp.date_from)` ,
	ap.average_payroll_per_year,
	apmp.name,
	apmp.`round(avg(cp.value),2)` AS average_price,
	apmp.price_value,
	apmp.price_unit,
	round(ap.average_payroll_per_year / apmp.`round(avg(cp.value),2)`,2) AS how_many_I_can_buy
FROM t_average_payroll_per_year ap
JOIN t_average_prices_milk_bread apmp
	ON ap.payroll_year = apmp.`year(cp.date_from)` ;


SELECT 
*
FROM t_average_prices_milk_bread ;

SELECT 
*
FROM t_average_payroll_per_year;



