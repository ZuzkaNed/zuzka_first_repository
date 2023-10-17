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

SELECT
	*,
	CASE WHEN confirmed > 10000 THEN 1
	ELSE 0
	END AS more_than_10000
FROM covid19_basic_differences 
WHERE date = '2020-08-30'
ORDER BY confirmed DESC; 

SELECT
	*,
	CASE WHEN confirmed > 10000 THEN 1
	ELSE 0
	END AS more_than_10000
FROM covid19_basic 
WHERE date = '2020-08-30'
ORDER BY confirmed DESC; 

SELECT 
*
FROM covid19_detail_us
ORDER BY date desc;

SELECT 
* 
FROM covid19_basic
ORDER BY country, date desc;

SELECT 
	*,
	CASE WHEN confirmed > 10000 THEN 1
	ELSE 0
	END AS confirmed_more_than_10000
FROM covid19_basic_differences
WHERE date = '2020-08-30'
ORDER BY confirmed DESC;


SELECT 
	*,
	CASE WHEN country IN ('Germany','France','Spain') THEN 'Evropa'
	ELSE 'ostatni'
	END AS flag_evropa
FROM covid19_basic_differences
WHERE country = 'France';

SELECT 
	*,
	CASE WHEN country LIKE 'Ge%' THEN 'GE Zeme'
	ELSE 'ostatni'
	END AS flag_ge
FROM covid19_basic_differences
WHERE country = 'germany';

SELECT 
	*,
	CASE WHEN confirmed <= 1000 THEN 'less than 1000'
		 WHEN confirmed BETWEEN 1000 AND 10000 THEN '1000 - 10000'
		 WHEN confirmed > 10000 THEN 'more than 10000'
	END AS category
FROM covid19_basic_differences
WHERE confirmed IS NOT NULL
ORDER BY date desc;

SELECT 
	*,
	CASE WHEN country IN ('china', 'usa', 'india')  AND confirmed > 10000 THEN 1
		 ELSE 0
	END AS china_india_usa
FROM covid19_basic_differences
WHERE country = 'india'
ORDER BY date DESC;

SELECT 
	*,
	CASE WHEN country LIKE '%a' THEN 'A zeme'
	ELSE 'ne A zeme'
	END AS flag_end_a
FROM covid19_basic_differences
;
CREATE VIEW v_zuzka_nedvedova_usa_china_inda AS 
	SELECT 
		*
	FROM covid19_basic
	WHERE country IN ('india', 'china', 'usa') ;

SELECT 
*
FROM v_zuzka_nedvedova_usa_china_inda;

SELECT 
	*
FROM covid19_basic
WHERE country IN (
	SELECT 
		country
	FROM lookup_table 
		WHERE population > 100000000);
	
SELECT 
*
FROM covid19_basic 
	WHERE country IN (
		SELECT 
			DISTINCT(country)
		FROM covid19_detail_us);
	
SELECT 
*
FROM covid19_basic
WHERE country IN (
	SELECT 
		country 
	FROM covid19_basic_differences
	WHERE confirmed > 10000);

SELECT 
*
FROM covid19_basic
WHERE country NOT IN (
	SELECT 
		country 
	FROM covid19_basic_differences
	WHERE confirmed > 1000);

SELECT 
*
FROM covid19_basic
WHERE country NOT LIKE 'a%';








	











































   
   

    