-- USING THE PRIMARY KEY, UNIQUE AND NOT NULL STATEMENTS

CREATE TABLE countries(
    country_key smallserial PRIMARY KEY,
    name varchar(50) UNIQUE NOT NULL,
    founding_year date,
    capital varchar(50))

SELECT * FROM countries

-- Creating new tavbles from existing tables in a database

CREATE TABLE products_2014 AS (
    SELECT * 
    FROM products 
    WHERE year = 2014)

SELECT * FROM products_2014

SELECT * FROM countries
ALTER TABLE countries
ADD COLUMN population numeric;
SELECT * FROM countries

ALTER TABLE countries
RENAME COLUMN founding_year TO independence;

SELECT * FROM teachers;
UPDATE teachers 
SET first_name = 'Janelle'
WHERE id = 1;
SELECT * FROM teachers;

ALTER TABLE countries
DROP COLUMN population;
SELECT * FROM countries

SELECT * FROM teachers;

DELETE FROM teachers
WHERE id = 7;
SELECT * FROM teachers;

DROP TABLE countries;
CREATE TABLE teach AS (SELECT * FROM teachers)
SELECT * FROM teach

SELECT * FROM countries
ALTER TABLE countries
RENAME COLUMN founding_year TO independence;

SELECT * FROM teachers;
UPDATE teachers 
SET first_name = 'Janelle'
WHERE id = 1;
SELECT * FROM teachers;

ALTER TABLE countries
DROP COLUMN population;
SELECT * FROM countries

SELECT * FROM teachers;

DELETE FROM teachers
WHERE id = 7;
SELECT * FROM teachers;

DROP TABLE countries;
