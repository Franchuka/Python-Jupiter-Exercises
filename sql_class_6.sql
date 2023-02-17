-- Using the CASE WHEN statement, (it acts like an if elif statement in python)
SELECT *,
    CASE 
        WHEN postal_code = '33111' THEN 'Elite Customer'
        WHEN postal_code = '33124' THEN 'Premium Customer'
        ELSE 'Standard Customer'
    END
AS customer_type 
FROM customers 
 
-- Using the COALESCE statement to transform null cells to a stardard value
SELECT first_name, last_name,
COALESCE(phone, 'NO PHONE') AS phone
FROM customers
ORDER BY 1;

--Using the nullif statement turns a cell value to null 
--if it satisfies a particular condition
SELECT customer_id, NULLIF(title, 'Honarable') as title,
    first_name, last_name
FROM customers
LIMIT 600;

-- The greatest and least statements are used to convert data to a minimum and maximum  respectively
-- the greatest converts all values below a particular limit to that limit value and 
--the least converts all values greater than a particular limit value to that limit value

SELECT 
    product_id,
    model,
    year,
    product_type,
    LEAST(600.00, base_msrp) as base_msrp,
    production_start_date,
    production_end_date
FROM products
WHERE product_type = 'scooter';




--AGGREGATE FUNCTIONS
--COUNT
--Used to count all the cells in a row that are not null
-- count(*) for all cros in a table
-- count(column_name) for a particular column
--ex_1
SELECT COUNT(customer_id) FROM customers
-- ex_2
SELECT COUNT(*) FROM customers 
WHERE state = 'CA'

SELECT * FROM products;
-- SELECT SUM(base_msrp) :: FLOAT/COUNT (*) AS avg_base_msrp FROM products;


SELECT MIN(base_msrp), MAX(base_msrp), AVG(base_msrp), STDDEV(base_msrp)
FROM products;

--using group by
SELECT school, COUNT(*)
FROM teachers
GROUP BY school;

SELECT school, COUNT(*) AS NO_OF_TEACHERS, AVG(salary) as avg_salary
FROM teachers
GROUP BY school;

SELECT state, COUNT(*) AS no_people 
FROM customers 
GROUP BY state;

-- having is used in place of where, cause where doesnt work on groupbys and aggregate functions
SELECT state, COUNT(*) AS no_people 
FROM customers 
GROUP BY state
HAVING COUNT(*) >= 1000
ORDER BY state;



SELECT 
    customer_id, 
    first_name, 
    last_name, 
    COALESCE(state, 'No State') 
        AS state,
    SUM(sales_amount)
FROM 
    customers INNER JOIN sales
        using (customer_id)
GROUP BY 
    customer_id, 
    first_name, 
    last_name, 
    state
HAVING 
    sum(sales_amount) >= 100000
ORDER BY customer_id;


Using the CASE WHEN Function to Get Regional Lists
-- The aim is to create a query that will map various values in a column to other values.
-- The head of sales has an idea to try and create specialized regional sales teams that will be
-- able to sell scooters to customers in specific regions, as opposed to generic sales teams. To
-- make his idea a reality, he would like a list of all customers mapped to regions. For customers
-- from the states of MA, NH, VT, ME CT, or RI, he would like them labeled as New England. For
-- customers from the states of GA, FL, MS, AL, LA, KY, VA, NC, SC, TN, VI, WV, or AR, he
-- would like the customers labeled as Southeast. Customers
-- from any other state should be labeled as Other