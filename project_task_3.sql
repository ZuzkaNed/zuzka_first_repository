

CREATE TABLE t_average_price_of_each_price_category AS ( -- prumerna cena za jednotlivé kategorie potravin za dany rok --
	SELECT 
		cpc.name,
		round(avg(cp.value),2) AS average_price,
		cpc.price_value,
		cpc.price_unit,
		YEAR(cp.date_from) AS year
	FROM czechia_price cp
	JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code
	GROUP BY cpc.name, YEAR(cp.date_from)
);

	SELECT 
		cpc.name,
		round(avg(cp.value),2) AS average_price,
		cpc.price_value,
		cpc.price_unit,
		YEAR(cp.date_from) AS year
	FROM czechia_price cp
	JOIN czechia_price_category cpc
		ON cp.category_code = cpc.code
	GROUP BY cpc.name, YEAR(cp.date_from);
	
-- percentuálni meziroční nárust/pokles cen za jednotlivé potraviny -- 
SELECT 
	ap1.name,
	ap1.`year`,
	ap1.average_price,
	ap2.`year` + 1 AS following_year,
	ap2.average_price,
	ap1.price_value,
	ap1.price_unit,
	round((ap2.average_price-ap1.average_price)/ap1.average_price * 100,2) AS annual_growth_percentage
FROM t_average_price_of_each_price_category ap1
	JOIN t_average_price_of_each_price_category ap2
	 ON ap1.`year` + 1  = ap2.`year` AND ap2.name = ap2.name;
	
-- nárust/pokles cen jednotlivých potravin v % od roku 2006 do roku 2018, celkový rozdíl mezi roky 2006 a 2018 - najpomalsie zdrazuje biele víno, ceny cukru a jablek klesli -- 
SELECT 
	ap1.name,
	sum(round((ap2.average_price-ap1.average_price)/ap1.average_price * 100,2)) AS annual_growth
FROM t_average_price_of_each_price_category ap1
	JOIN t_average_price_of_each_price_category ap2
	 ON ap1.`year` + 1  = ap2.`year` AND ap1.name = ap2.name
GROUP BY ap1.name
ORDER BY annual_growth;



