-- HDP v ČR od roku 1990 do roku 2020 -- 

CREATE TABLE t_GDP_in_czech_republic AS 
	(SELECT 
		country,
		`year` ,	
		GDP 
	FROM economies
	WHERE country = 'Czech Republic' AND GDP IS NOT NULL
	ORDER BY `year` 
);

 -- mezirocni rust/pokles hdp v CR -- 

CREATE TABLE t_gdp_growth AS 
	(SELECT 
		this_year.country,
		this_year.`year` ,
		this_year.GDP AS GDP,
		this_year.`year` + 1 AS following_year,
		next_year.GDP AS GDP_in_following_year,
		round(next_year.GDP - this_year.GDP,2) AS annual_growth, 
		CASE 
			WHEN round(next_year.GDP - this_year.GDP,2) >= 10000000000 THEN 'high_increase'
		 	WHEN round(next_year.GDP - this_year.GDP,2) >= 0 AND round(next_year.GDP - this_year.GDP,2) < 10000000000 THEN 'low_increase'
			ELSE 'decrease'			
		END AS increase_or_decrease
	FROM t_gdp_in_czech_republic this_year
	JOIN t_gdp_in_czech_republic next_year
	ON next_year.`year` = this_year.`year` +1
);

DELETE TABLE t_gdp_growth_czech_reoublic;

-- porovnani mezirocniho rustu cena a mezd --
CREATE TABLE t_annual_growth_food_and_payroll AS 
	(SELECT 
		agf.following_year,
		agf.annual_growth_food,
		agp.annual_growth_percentage AS annual_growth_payroll
	FROM annual_growth_foodprice agf
	JOIN annual_growth_payroll agp
	ON agf.following_year = agp.following_year
);

SELECT 
*
FROM t_annual_growth_food_and_payroll ;

SELECT
	gdp.following_year,
	gdp.GDP_in_following_year,
	gdp.annual_growth,
	gdp.increase_or_decrease,
	fp.annual_growth_food,
	fp.annual_growth_payroll 
FROM t_gdp_growth gdp
JOIN t_annual_growth_food_and_payroll fp
ON gdp.following_year = fp.following_year ;


