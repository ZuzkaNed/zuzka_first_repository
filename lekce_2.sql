SELECT 
	name,
	provider_type 
FROM healthcare_provider
ORDER BY TRIM(name) ASC;

SELECT 
	provider_id,
	name,
	provider_type,
	region_code,
	district_code 
FROM healthcare_provider
ORDER BY region_code, district_code;

SELECT 
*
FROM czechia_district
ORDER BY code DESC;

SELECT 
* 
FROM czechia_district 
ORDER BY name DESC
LIMIT 5;

SELECT 
*
FROM healthcare_provider
ORDER BY provider_type ASC,name DESC; 

SELECT 
name,
provider_type,
region_code,
CASE 
	WHEN region_code = 'CZ010' THEN 1
	ELSE 0
END AS is_from_Prague
FROM healthcare_provider
WHERE region_code = 'CZ010';

SELECT 
*
FROM czechia_region; 

SELECT
name,
municipality,
longitude,
	CASE 
		WHEN longitude < 14 THEN 'nejvice na zapade'
		WHEN longitude < 16 THEN 'mene na zapade'
		WHEN longitude < 18 THEN 'vice na vychode'
		WHEN longitude IS NULL THEN '---neni znamo---'
		ELSE 'nejvice na vychode'
	END
FROM healthcare_provider;

SELECT
name,
provider_type,
	CASE 
		WHEN provider_type = 'lekarna' OR provider_type = 'Vydejna zdravotnickych prostredku' THEN 1
		ELSE 0
	END AS is_desired_type
FROM healthcare_provider;

SELECT
    name, provider_type,
    CASE
        WHEN provider_type = 'Lékárna' OR provider_type = 'Výdejna zdravotnických prostředků' THEN 1
        ELSE 0
    END AS is_desired_type
FROM healthcare_provider;

SELECT 
*
FROM healthcare_provider
WHERE name LIKE '%nemocnice%';

SELECT
	name,
	CASE 
		WHEN name LIKE 'lekarna%' THEN 1
		ELSE 0
	END
FROM healthcare_provider
WHERE name LIKE '%lekarna%';

SELECT 
	name, municipality 
FROM healthcare_provider
WHERE municipality LIKE '____'; 

SELECT 
	*
FROM czechia_district 
WHERE name LIKE 'Brno%';

SELECT 
	name, municipality, district_code 
FROM healthcare_provider
WHERE 
	municipality IN ('Brno','Praha') OR 
	district_code IN ('CZ0425', 'CZ0421');

SELECT 
	name,provider_id,region_code
FROM healthcare_provider
WHERE region_code IN (
	SELECT code  
	FROM czechia_region 
	WHERE name IN ('Jihomoravský kraj','Středočeský kraj')
);

SELECT
    provider_id, name, region_code
FROM healthcare_provider
WHERE region_code IN (
    SELECT code
    FROM czechia_region
    WHERE name IN ('Jihomoravský kraj', 'Středočeský kraj')
);

SELECT 
* 
FROM czechia_district
WHERE name LIKE '____';

SELECT
    *
FROM czechia_district
WHERE code IN (
    SELECT
        district_code
    FROM healthcare_provider
    WHERE municipality LIKE '____'
);













