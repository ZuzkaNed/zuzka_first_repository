SELECT * 
FROM 
covid19_basic;

SELECT * 
FROM 
covid19_basic
LIMIT 20;

SELECT * 
FROM 
covid19_basic
ORDER BY date DESC;

SELECT 
	country,
	date
FROM 
covid19_basic;

SELECT * 
FROM 
covid19_basic
WHERE country = 'Austria';

SELECT 
	country,
	date,
	confirmed 
FROM 
covid19_basic
WHERE country = 'Austria';

SELECT * 
FROM 
covid19_basic
WHERE date = '2020-08-30';


SELECT * 
FROM 
covid19_basic
WHERE date = '2020-08-30' 
	AND country = 'Czechia';

SELECT * 
FROM 
covid19_basic
WHERE country = 'Austria'
	OR country = 'Czechia';

SELECT * 
FROM 
covid19_basic
WHERE confirmed = 1000
	OR confirmed = 100000;

SELECT * 
FROM 
covid19_basic
WHERE date = '2020-08-30'
	AND confirmed BETWEEN 10 AND  20;

SELECT 
* 
FROM covid19_basic 
WHERE confirmed >= 10 
      AND confirmed <= 20 
      AND `date` = '2020-08-30';

SELECT 
* 
FROM covid19_basic 
WHERE confirmed > 1000000
     AND date = '2020-08-15';
    
SELECT 
	date,
	country,
	confirmed
FROM covid19_basic 
WHERE country = 'United Kingdom'
	OR country = 'France'
ORDER BY date DESC;

SELECT 
	date,
	country,
	confirmed
FROM covid19_basic_differences
WHERE country = 'Czechia'
	AND date BETWEEN '2020-09-01' AND '2020-09-30';

SELECT 
	country,
	population
FROM lookup_table
WHERE country = 'Austria';

SELECT 
	country,
	population
FROM lookup_table
WHERE population > 500000000;

SELECT 
*
FROM covid19_basic 
WHERE country = 'India'
	AND date = '2020-08-30';

SELECT 
*
FROM covid19_detail_us
WHERE province = 'Florida'
	AND date = '2020-08-30';

     
     
	



