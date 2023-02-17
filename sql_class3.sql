-- -- using LIKE statement
-- SELECT *
-- FROM teachers
-- Using LIKE and ILIKE
WHERE first_name LIKE 'sam%'
-- using ILIKE (IT IS NOT CASE SENSITIVE)
SELECT *
FROM teachers
WHERE first_name ILIKE 'Sam%'

-- Using AND operator
SELECT *
FROM teachers
WHERE last_name = 'Cole'
AND salary < 50000

-- Using OR operator
SELECT *
FROM teachers
WHERE last_name = 'Cole'
OR last_name = 'Bush'

SELECT *
FROM teachers
WHERE school = 'F.D Roosevelt HS'
AND (salary < 40000 OR salary > 60000);
-- NOTE: YOU CAN ALSO USE A BETWEEN STATEMENT IN THE ABOVE QUERY

Using ORDER BY 
SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary;

SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;

SELECT first_name, last_name, salary
FROM teachers
ORDER BY first_name ASC
LIMIT(3);

-- IS NULL and IS NOT NULL

INSERT INTO teachers (first_name, last_name)
VALUES ('Owen', 'Bill'),
       ('William', 'Jose');

SELECT * FROM teachers
WHERE school IS NOT NULL;

SELECT * FROM teachers
WHERE school IS NULL;

-- Working with Data Types 

CREATE TABLE date_time_types (
-- (generc sql format) timestamp_column timestamp with time zone
-- for postgres format we use tz
     timestamp_column timestamptz,
     interval_column interval);
    
INSERT INTO date_time_types
VALUES
         ('2022-12-31 01:00 EST', '2 days'),
         ('2022-12-31 01:00 EST', '1 month'),
         ('2022-12-31 01:00 Australia/Melbourne', '1 century'),
         ('now()', '1 week');

SELECT * FROM date_time_types

SELECT  timestamp_column,
        interval_column,
        timestamp_column - interval_column AS new_date
FROM date_time_types;