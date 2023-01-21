-- Active: 1668393078736@@localhost@5432@postgres@public
CREATE TABLE school_data(  
    name VARCHAR(255)
);

DROP TABLE school_data;

COPY school_data(name)
FROM '/Users/thvuvi/Documents/Development/SOL_Test_Data/school_data.csv';


CREATE TABLE not_county(
    name VARCHAR(255)
);
INSERT INTO not_county
SELECT 
    DISTINCT name
FROM school_data
WHERE name NOT SIMILAR TO ('%Cou%');

SELECT DISTINCT name FROM not_county
WHERE name NOT SIMILAR TO ('%Cit%');

SELECT DISTINCT name FROM not_county
WHERE name NOT SIMILAR TO ('%Cit%');

CREATE TABLE fips(
    name VARCHAR(255)
);

COPY fips(name)
FROM '/Users/thvuvi/Documents/Development/SOL_Test_Data/name.csv';

SELECT *
FROM fips
WHERE name NOT SIMILAR TO ('%County');

SELECT name
FROM fips
ORDER BY 1;

SELECT DISTINCT name
FROM school_data
ORDER BY 1;

SELECT DISTINCT school_data.name FROM school_data CROSS JOIN fips;
SELECT
	DISTINCT name
FROM
	fips
FULL OUTER JOIN fip USING (name)
WHERE
	fip.name IS NOT NULL;



CREATE TABLE fips_num(
    name VARCHAR(255),
    number INT
);

COPY fips_num(name,number)
FROM '/Users/thvuvi/Documents/Development/SOL_Test_Data/county.csv'
CSV HEADER;

DROP TABLE fip;
CREATE TABLE fip(name VARCHAR(255),number INT);
COPY fip(name,number)
FROM '/Users/thvuvi/Documents/Development/SOL_Test_Data/fipsnum.csv'
CSV HEADER;

INSERT INTO fip
(name,number)
VALUES
('Accomack',51001);


SELECT * FROM fip ORDER BY 1;


SELECT *
FROM fip
WHERE name NOT SIMILAR TO ('%City%');

UPDATE fip
SET name = CONCAT(name, ' County')
WHERE name NOT SIMILAR TO ('%City%');



UPDATE school_data
SET name = 
TRIM (TRAILING FROM name);

SELECT*
FROM school_data
ORDER BY 1;

UPDATE fip
SET name = 
TRIM (TRAILING FROM name);
SELECT*
FROM fip
ORDER BY 1;

UPDATE fip
SET name = CONCAT(name, ' ');

SELECT COUNT(name) FROM school_data;