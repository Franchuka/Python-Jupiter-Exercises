SELECT *
 FROM salespeople
 INNER JOIN dealerships
     ON salespeople.dealership_id = dealerships.dealership_id;

 SELECT * 
 FROM salespeople AS s
 INNER JOIN dealerships AS d
     ON s.dealership_id = d.dealership_id
 WHERE d.state = 'CA';

 SELECT s.* 
 FROM salespeople AS s
 INNER JOIN dealerships AS d
     ON s.dealership_id = d.dealership_id
 WHERE d.state = 'CA';

 SELECT d.* 
 FROM salespeople AS s
 INNER JOIN dealerships AS d
     ON s.dealership_id = d.dealership_id
 WHERE d.state = 'CA';

 SELECT s.first_name, s.last_name, d.city, s.dealership_id
     FROM salespeople AS s
 INNER JOIN dealerships AS d
     ON s.dealership_id = d.dealership_id
 WHERE d.state = 'CA';

 SELECT * FROM customers c 
 LEFT OUTER JOIN emails e ON e.customer_id = c.customer_id
 LIMIT 100;

 SELECT * FROM customers c 
     LEFT OUTER JOIN emails e ON e.customer_id = c.customer_id
     WHERE e.customer_id IS NULL
 ORDER BY c.customer_id
 LIMIT 100;

 -- AN ALTERNATIVE FOR INNER JOIN
 SELECT * FROM customers c 
     LEFT OUTER JOIN emails e ON e.customer_id = c.customer_id
     WHERE e.customer_id IS NOT NULL
 ORDER BY c.customer_id
 LIMIT 100;

-- CROSS JOIN EXAMPLE
SELECT p1.product_id, p1.model, p2.product_id, p2.model
FROM products AS p1 CROSS JOIN products AS p2;

-- The head of sales of your company would like a list of all customers who bought a car.
-- We need to create a query that will return all customer IDs, first names, last names, and 
-- valid phone numbers from the customers who purchased a car.

 SELECT customer_id, first_name, last_name, phone
 FROM customers;

SELECT c.customer_id, c.first_name, c.last_name, phone
    FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
WHERE p.product_type = 'automobile'
    AND c.phone IS NOT NULL; 

DROP TABLE IF EXISTS top_rated_films; 
 CREATE TABLE top_rated_films(
     title VARCHAR NOT NULL,
     release_year smallint);
    
 DROP TABLE IF EXISTS most_popular_films;
 CREATE TABLE most_popular_films(
     title varchar NOT NULL,
     release_year smallint);
    
 INSERT INTO
     top_rated_films( title, release_year)
 VALUES 
     ('The Shawshank Redemption', 1994),
     ('The Godfather', 1972),
     ('12 Angry Men', 1957);
    
 INSERT INTO
     most_popular_films(title, release_year)
 VALUES 
     ('An American Pickle', 2020),
     ('The Godfather', 1972),
     ('Greyhound', 2020);
    
 SELECT * FROM top_rated_films;
 SELECT * FROM most_popular_films;

-- To pick just one of the duplicates in case there are more 
 SELECT * FROM top_rated_films
 UNION
 SELECT * FROM most_popular_films;

-- to show all duplicates in diff rows
SELECT * FROM top_rated_films
UNION ALL
SELECT * FROM most_popular_films;

