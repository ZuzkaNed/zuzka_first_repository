SELECT country, elevation , yearly_average_temperature , population , population_density ,
    IF ( elevation > 2000, 1, 0 ) AS mountainous,
    IF ( yearly_average_temperature < 5, 1, 0 ) AS cold_weather,
    IF ( yearly_average_temperature > 25, 1, 0 ) AS hot_weather,
    IF ( population > 10000000 AND population_density > 1000 , 1 , 0 ) AS overpopulated
FROM countries c
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
   
   
   

    