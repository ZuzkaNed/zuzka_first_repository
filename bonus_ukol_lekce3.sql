SELECT
	continent,
	sum(population) AS sum_population
FROM countries
WHERE continent IS NOT null
GROUP BY continent
ORDER BY sum_population;

SELECT 
	continent,
	AVG(surface_area) AS avg_surface_of_countries 
FROM  countries
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY avg_surface_of_countries;

SELECT 
	religion,
	count(*)
FROM countries
WHERE religion IS NOT null
GROUP BY religion
ORDER BY COUNT(*); 

SELECT 
	continent,
	sum(population),
	avg(population),
	count(country)
FROM countries
WHERE continent IS NOT null
GROUP BY continent;

SELECT 
	continent,
	sum(surface_area),
	avg(surface_area)
FROM countries
WHERE continent IS NOT null
GROUP BY continent;

SELECT 
	religion,
	sum(population),
	count(country)
FROM countries
WHERE religion IS NOT null
GROUP BY religion
ORDER BY count(country) DESC ;

select continent , 
    round( sum( landlocked ) / count(*), 2) as landlocked_cnt_share,
    round( sum( landlocked * surface_area ) / sum( surface_area ), 2 ) as landlocked_area_share,
    round( sum( landlocked * population ) / sum( population ), 2 ) as landlocked_population_share
from countries
where continent is not null and landlocked is not null
group by continent 
;


SELECT 
	continent,
	region_in_world,
	sum(population)
FROM countries
WHERE continent IS NOT NULL AND region_in_world IS NOT null
GROUP BY continent, region_in_world
ORDER BY continent, sum(population) desc;

SELECT
	continent,
	religion,
	sum(population),
	count(*)	
FROM countries
WHERE continent IS NOT NULL AND religion IS NOT NULL 
GROUP BY continent, religion
ORDER BY continent,sum(population) desc ;


select region_in_world , 
    round( sum( surface_area * yearly_average_temperature ) / sum( surface_area ), 2 ) as average_regional_temperature
from countries
where continent = 'Africa'
    and yearly_average_temperature is not null
group by region_in_world ;

SELECT 
	*,
	confirmed - (recovered/2) AS novy_sloupec
FROM covid19_basic
ORDER BY date desc;

SELECT 
	sum(recovered)
FROM covid19_basic
WHERE date = '2020-08-30';

SELECT 
	sum(recovered),
	sum(confirmed)
FROM covid19_basic
WHERE date = '2020-08-30';

SELECT 
	sum(confirmed) - sum(recovered)
FROM covid19_basic
WHERE date = '2020-08-30';

SELECT 
 	date,
 	country,
 	sum(confirmed) 
FROM covid19_basic_differences
WHERE country = 'czechia' AND date = '2020-08-30';

SELECT 
*
FROM covid19_basic_differences
WHERE confirmed IS NOT NULL AND country = 'czechia'
ORDER BY date;

SELECT 
*
FROM covid19_basic
WHERE confirmed IS NOT NULL AND country = 'czechia'
ORDER BY date;

SELECT 
	country,
	sum(confirmed)
FROM covid19_basic_differences
WHERE date BETWEEN '2020-08-01' AND '2020-08-31'
GROUP BY country;

SELECT 
	country,
	sum(confirmed)
FROM covid19_basic_differences
WHERE date BETWEEN '2020-08-20' AND '2020-08-30' 
	AND country IN ('czechia', 'slovakia', 'austria')
GROUP BY country;

SELECT 
	country,
	max(confirmed)
FROM covid19_basic_differences
GROUP BY country;

SELECT 
	country,
	max(confirmed)
FROM covid19_basic_differences
WHERE country LIKE 'c%'
GROUP BY country;

SELECT 
	date,
	country,
	sum(confirmed)
FROM covid19_basic_differences
WHERE country IN (
	SELECT country
	FROM countries
	WHERE population > 50000000 
)	
	AND date >='2020-08-01'
GROUP BY date,country;

SELECT 
	province,
	sum(confirmed)
FROM covid19_detail_us_differences
WHERE province = 'arkansas'
GROUP BY province;

SELECT 
	province,
 	max(population)
FROM lookup_table;
       
SELECT 
	province,
    max(population) 
FROM lookup_table lt 
WHERE   country='Brazil' 
             AND province is not NULL;
            
select DISTINCT province, population 
from lookup_table lt 
where country = 'Brazil' and province is not null
order by population DESC;

--Zjistěte celkový a průměrný počet nakažených denně po dnech a seřaďte podle data sestupně--

SELECT 
	date,
	sum(confirmed),
	round(avg(confirmed),2)
FROM covid19_basic_differences
WHERE confirmed IS NOT null
GROUP BY date
ORDER BY date desc;

-- Zjistěte celkový počet nakažených lidí v jednotlivých provinciích USA dne 30.08.2020 (použijte tabulku covid19_detail_us)--

SELECT 
	province,
	date,
	sum(confirmed)
FROM covid19_detail_us
WHERE date = '2020-08-10' 
GROUP BY province
ORDER BY sum(confirmed) desc;

SELECT 
*
FROM covid19_detail_us;

--Zjistěte celkový přírůstek podle datumu a země--

SELECT 
	date,
	country,
	sum(confirmed)
FROM covid19_basic_differences
WHERE confirmed IS NOT NULL 
GROUP BY date, country
ORDER BY date DESC,sum(confirmed) desc ;



--Zjistěte průměrnou populaci ve státech ležících severně od 60 rovnoběžky.--


SELECT avg(population)
FROM lookup_table lt 
WHERE lat >= 60
    AND province IS NULL;
   
   
SELECT 
	avg(population),
	MAX(population),
	min(population),
	count(DISTINCT country),
	MAX(population) / min(population) AS max_min_ratio
FROM lookup_table lt 
WHERE lat >= 60 ;

SELECT 
	religion,
	avg(population),
	avg(surface_area),
	count(DISTINCT country)
FROM countries
WHERE religion  IS NOT null
GROUP BY religion;

SELECT 
	count(DISTINCT country),
	max(population),
	min(population)
FROM countries
WHERE currency_name LIKE '%dollar%';

SELECT 
	count(country)
FROM countries
WHERE currency_code = 'EUR' AND continent = 'Europe';

SELECT 
	count(*)
FROM countries
WHERE avg_height IS NOT null;

SELECT 
 	continent,
 	avg(avg_height)
FROM countries
WHERE avg_height IS NOT NULL 
GROUP BY continent ;

SELECT continent , round( sum(population*avg_height)/sum(population) , 2) AS weighted_average
FROM countries c 
WHERE avg_height IS NOT NULL
GROUP BY continent
ORDER BY round( sum(population*avg_height)/sum(population) , 2) DESC
;

SELECT
	region_in_world,
	round( sum(surface_area*population_density) / sum(surface_area), 2 ) AS weighted_avg_density
FROM countries
WHERE population_density IS NOT NULL AND region_in_world IS NOT NULL
GROUP BY region_in_world;

SELECT region_in_world ,
    round( avg(population_density), 2 ) AS simple_avg_density,
    round( sum(surface_area*population_density) / sum(surface_area), 2 ) AS weighted_avg_density,
    abs( round( avg(population_density), 2 ) - round( sum(surface_area*population_density) / sum(surface_area), 2)) AS difference
FROM countries c 
WHERE population_density IS NOT NULL AND region_in_world IS NOT NULL
GROUP BY region_in_world
ORDER BY difference desc
;








    
   
 
































