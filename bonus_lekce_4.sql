SELECT 
	c.country,
	c.capital_city,
	c.population,
	r.religion,
	r.population 
FROM countries c
LEFT JOIN religions r
ON c.country  = r.country 
WHERE r.`year` = 2020
 ;

SELECT c.country , c.capital_city , c.population , r.religion , r.population as adherents
FROM countries c 
JOIN religions r
    ON c.country = r.country
    AND r.year = 2020
;

SELECT 
	c.country,
	c.independence_date,
	e.`year`,
	round(e.GDP / 1000000,2) AS round_gdp,
	e.gini, 
	e.taxes
FROM countries  c
JOIN economies  e
ON c.country = e.country
WHERE e.YEAR >= c.independence_date;

SELECT c.country , c.population
FROM countries c 
LEFT JOIN economies e 
    on c.country = e.country 
 WHERE e.country is null
ORDER BY c.population desc
;

SELECT 
	le.country,
	le.life_expectancy AS le_in_2015,
	le2.life_expectancy AS le_in_1970,
	round(le.life_expectancy/le2.life_expectancy,2) AS life_exp_ratio
FROM life_expectancy le
JOIN life_expectancy le2
	ON le.country = le2.country AND le.YEAR = 2015 AND le2.YEAR = 1970;


SELECT 
	e.country,
	e.YEAR,
	e.population,
	e2.YEAR + 1,
	e2.population 
FROM economies e
JOIN economies e2
	ON e.country = e2.country 
	AND e.YEAR = e2.YEAR + 1
	AND e.YEAR < 2020;

SELECT e.country, e.year, e.population,e2.year + 1 as year_prev, e2.population,
    round( ( e.GDP - e2.GDP ) / e2.GDP * 100, 2 ) as GDP_growth,
    round( ( e.population - e2.population ) / e2.population * 100, 2) as pop_growth_percent
FROM economies e 
JOIN economies e2 
    ON e.country = e2.country 
    AND e.year = e2.year + 1
    AND e.year < 2020


 SELECT 
 	r.country,
 	r.religion,
 	round(r.population/r2.pocet_vericich * 100,2 )
 FROM religions r
 JOIN (
    SELECT 
		country,
		YEAR,
 		sum(population) AS pocet_vericich
	FROM religions
	WHERE year = 2020
	GROUP BY country) r2
ON r.country = r2.country
AND r.YEAR = r2.year
AND r.population > 0;

 SELECT 
		country,
		YEAR,
 		sum(population) AS pocet_vericich
	FROM religions
	WHERE year = 2020
	GROUP BY country
	
SELECT 
*
FROM religions;

SELECT 
*
FROM lookup_table
WHERE province IS null;

SELECT 
*
FROM covid19_basic cb
LEFT JOIN covid19_basic_differences cbd
ON cb.country = cbd.country 
AND cb.date = cbd.date;

SELECT
        base.date,
        (sum(base.confirmed)*1000000)/sum(a.population) as confirmed_per_milion
FROM (
          SELECT 
                date,
                country,
                confirmed 
          FROM covid19_basic cb
         ) base
LEFT JOIN 
         (
          SELECT
                  country,
                  population
          FROM lookup_table lt 
          WHERE province is null
         ) a
ON base.country = a.country
GROUP BY base.date
ORDER BY base.date





