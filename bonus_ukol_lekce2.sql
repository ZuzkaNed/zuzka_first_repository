-- bonusova cviceni - lekce 2 --

SELECT
	country, region_in_world, national_dish 
FROM countries
WHERE region_in_world = 'Eastern Europe';

SELECT 
	country,currency_name, currency_code 
FROM countries
WHERE currency_name LIKE '%dollar%';

SELECT 
	country,currency_name, currency_code 
FROM countries
WHERE currency_code LIKE 'USD';

SELECT 
	country, abbreviation, domain_tld  
FROM countries
WHERE abbreviation != SUBSTRING(domain_tld, 2,2) ;

SELECT 
	country, capital_city 
FROM countries
WHERE capital_city LIKE '% %';

SELECT 
	country, religion, independence_date 
FROM countries
WHERE religion = 'Christianity' AND independence_date IS NOT NULL 
ORDER BY independence_date ;

SELECT country, elevation , yearly_average_temperature , population , population_density
FROM countries
WHERE elevation > 2000
    OR yearly_average_temperature < 5
    OR yearly_average_temperature > 25
    OR (population > 10000000 AND population_density > 1000);


SELECT country, elevation , yearly_average_temperature , population , population_density,
	CASE WHEN elevation > 2000 THEN 1 ELSE 0 END AS mountainous,
	CASE WHEN yearly_average_temperature < 5 THEN 1 ELSE 0 END AS cold_weather,
	CASE WHEN yearly_average_temperature > 25 THEN 1 ELSE 0 END AS hot_weather,
	CASE WHEN (population > 10000000 AND population_density > 1000) THEN 1 ELSE 0 END AS overpopulated
FROM countries
WHERE elevation > 2000
    OR yearly_average_temperature < 5
    OR yearly_average_temperature > 25
    OR (population > 10000000 AND population_density > 1000);
   
 CREATE OR REPLACE VIEW v_zuzka_nedvedova_hostile_countries AS 
   SELECT country, elevation , yearly_average_temperature , population , population_density,
	CASE WHEN elevation > 2000 THEN 1 ELSE 0 END AS mountainous,
	CASE WHEN yearly_average_temperature < 5 THEN 1 ELSE 0 END AS cold_weather,
	CASE WHEN yearly_average_temperature > 25 THEN 1 ELSE 0 END AS hot_weather,
	CASE WHEN (population > 10000000 AND population_density > 1000) THEN 1 ELSE 0 END AS overpopulated
FROM countries
WHERE elevation > 2000
    OR yearly_average_temperature < 5
    OR yearly_average_temperature > 25
    OR (population > 10000000 AND population_density > 1000);
   
   SELECT *
FROM v_zuzka_nedvedova_hostile_countries 
WHERE mountainous + cold_weather + hot_weather + overpopulated > 1
;
   
SELECT 
	country, life_expectancy 
FROM countries
WHERE life_expectancy IS NOT NULL 
ORDER BY life_expectancy ;

SELECT 
	*, life_expectancy_2019 - life_expectancy_1950 AS difference
FROM v_life_expectancy_comparison
WHERE country IN ('zambia', 'mozambique', 'malawi', 'angola')
ORDER BY difference;
   
   

    