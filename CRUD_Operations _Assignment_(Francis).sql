-- QUESTION 1
 SELECT * FROM customers
 CREATE TABLE customers_nyc AS (
     SELECT * FROM customers 
     WHERE city = 'New York City')
    
-- QUESTION 2
 SELECT * FROM customers_nyc
     DELETE FROM customers_nyc
     WHERE postal_code = '10014';

-- QUESTION 3
 ALTER TABLE customers_nyc
     ADD COLUMN event text;
     SELECT * FROM customers_nyc

-- QUESTION 4
 UPDATE customers_nyc
     SET event = 'thank-you party.';
     SELECT * FROM customers_nyc

-- QUESTION 5
 DROP TABLE customers_nyc;
