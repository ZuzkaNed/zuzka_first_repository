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

SELECT 
	country, religion 
FROM countries
WHERE religion = 'Buddhism';

SELECT 
	country, independence_date 
FROM countries
WHERE independence_date < 1500;

SELECT 
	country, elevation 
FROM countries
WHERE elevation > 2000;

SELECT 
	country, national_symbol 
FROM countries
WHERE national_symbol IS NULL OR national_symbol != 'animal';

SELECT 
	country, religion 
FROM countries
WHERE religion != 'Christianity' AND religion != 'Islam';

SELECT country , capital_city , religion , population 
FROM countries c 
WHERE religion NOT IN ('Christianity', 'Islam')
ORDER BY population DESC
;

SELECT
	country, currency_code, religion 
FROM countries
WHERE currency_code = 'EUR' AND religion != 'Christianity';

SELECT 
	country,yearly_average_temperature  
FROM countries
WHERE yearly_average_temperature <= 0 OR yearly_average_temperature >= 30;

SELECT 
	country, independence_date 
FROM countries
WHERE independence_date >= 1800 AND independence_date < 1900;

SELECT 
	population, surface_area, 
	round(population/surface_area, 2) AS pop_density, 
	round(population_density, 2), 
	round(population/surface_area, 2) -  round(population_density, 2) AS difference
FROM countries;

SELECT 
	country, 
	yearly_average_temperature,
	9/5 * yearly_average_temperature + 32 AS temp_in_fahrenheit 
FROM countries
WHERE yearly_average_temperature IS NOT NULL;


SELECT 
	country, yearly_average_temperature,
	CASE WHEN yearly_average_temperature < 0 THEN 'freezing'
		 WHEN yearly_average_temperature >= 0 AND yearly_average_temperature < 10 THEN 'chilly'
		 WHEN yearly_average_temperature >= 10 AND yearly_average_temperature < 20 THEN 'mild'
		 WHEN yearly_average_temperature >= 20 AND yearly_average_temperature < 30 THEN 'warm'
		 WHEN yearly_average_temperature > 30 THEN 'scorching'
	END AS climate
FROM countries
WHERE yearly_average_temperature IS NOT null;


SELECT 
	country, 
	north,
	south,
	CASE WHEN south > 0 THEN 'north'
		 WHEN north < 0 THEN 'south'
		 ELSE 'equator'
	END AS 'N_S_hemisphere'
FROM countries;

SELECT 
	country ,
	date,
	confirmed 
FROM covid19_basic
WHERE country = 'Austria'
ORDER BY date desc;

SELECT 
	country,
	date,
	deaths 
FROM covid19_basic
WHERE country = 'Czechia'
ORDER BY date desc; 

SELECT 
	date,
	sum(confirmed) AS number_of_deaths_august
FROM covid19_basic
WHERE date = '2020-08-31'; 

SELECT 
	DISTINCT (province)
FROM covid19_detail_us
ORDER BY province;

SELECT 
	country,
	date,
	recovered,
	confirmed,
	confirmed - recovered AS ill
FROM covid19_basic
WHERE country = 'Czechia'
ORDER BY date DESC;

SELECT 
	country,
	confirmed,
	date
FROM covid19_basic
WHERE date = '2020-07-01'
ORDER BY confirmed DESC 
LIMIT 10;



	











































   
   

    