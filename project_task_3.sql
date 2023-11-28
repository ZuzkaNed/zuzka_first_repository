

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
-- percentuálni meziroční nárust/pokles cen za jednotlivé potraviny -- 
SELECT 
	t1.name,
	t1.`year`,
	t1.average_price,
	t1.`year` + 1 AS following_year,
	t2.average_price,
	t1.price_value,
	t1.price_unit,
	round((t2.average_price-t1.average_price)/t1.average_price * 100,2) AS annual_growth_percentage
FROM t_average_price_of_each_price_category t1
	JOIN t_average_price_of_each_price_category t2
	 ON t1.`year` + 1  = t2.`year` AND t1.name = t2.name;
	
-- nárust/pokles cen jednotlivých potravin v % od roku 2006 do roku 2018, celkový rozdíl mezi roky 2006 a 2018 - najpomalsie zdrazuje biele víno, ceny cukru a jablek klesli -- 
SELECT 
	t1.name,
	sum(round((t2.average_price-t1.average_price)/t1.average_price * 100,2)) AS annual_growth
FROM t_average_price_of_each_price_category t1
	JOIN t_average_price_of_each_price_category t2
	 ON t1.`year` + 1  = t2.`year` AND t1.name = t2.name
GROUP BY t1.name
ORDER BY annual_growth;



