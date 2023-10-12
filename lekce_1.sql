SELECt * 
FROM healthcare_provider;

SELECT 
  name,
  provider_type
FROM healthcare_provider
LIMIT 20;

SELECT 
	name,
	provider_type,
	region_code 
FROM healthcare_provider 
ORDER BY region_code ASC;


SELECT 
	name,
	region_code,
	district_code 	
FROM healthcare_provider
ORDER BY district_code DESC 
LIMIT 500;

SELECT * 
FROM czechia_region;

SELECT *
FROM healthcare_provider
WHERE region_code = 'CZ010';


SELECT 
	name,
	region_code,
	residence_region_code 
FROM healthcare_provider
WHERE region_code = residence_region_code;

SELECT 
	name,
	phone
FROM healthcare_provider
WHERE phone IS NOT NULL;

SELECT *
FROM czechia_district 
WHERE name = 'Benešov' OR name = 'Beroun';


SELECT *
FROM healthcare_provider 
WHERE 
	district_code = 'CZ0201'
	OR district_code = 'CZ0202';


CREATE TABLE t_zuzka_nedvedova_providers_south_moravia AS
SELECT *
FROM healthcare_provider 
WHERE region_code = 'CZ064';

SELECT * 
FROM t_zuzka_nedvedova_providers_south_moravia;












