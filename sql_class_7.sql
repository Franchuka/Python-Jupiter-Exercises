SELECT * FROM sales

SELECT COUNT(sales_amount) FROM sales

--Question 3
SELECT 
   COALESCE (state, 'No State') AS state, 
   SUM(sales_amount) 
FROM customers INNER JOIN sales USING (customer_id)
GROUP BY state;

--Question 4
SELECT * FROM dealerships;

SELECT 
    dealership_id, city
    ||', '||state AS dealership_locaion,
COUNT (sales_amount)  AS units_sold
FROM sales INNER JOIN dealerships
    USING (dealership_id) 
    GROUP BY dealership_id, channel, state, city
        HAVING channel != 'ínternet'
    ORDER BY units_sold DESC
    LIMIT 5
 ;

-- Question 5(i)
SELECT  
        product_id, 
        AVG(sales_amount) AS avg_sales_amount
FROM sales
GROUP BY product_id
ORDER BY product_id

-- Question 5(ii)
SELECT  channel, AVG(sales_amount) AS avg_sales_amount 
FROM sales
GROUP BY channel
ORDER BY    channel

-- Question 5(iii)
COPY(SELECT 
    channel, 
    product_id, 
    AVG(sales_amount) AS avg_sales_amount 
FROM sales
GROUP BY channel, product_id
    HAVING channel != 'internet'
ORDER BY product_id) TO 'C:\Users\Utulu\Documents\Dumpfiles\dealership_units_sold_query.csv' 
WITH CSV HEADER


---On your psql command prompt
press enter multiple times until you are asked to input your password, type your password and press enter
By typing \c then the name of the database you want to work with, you will be able to view all the data bases in your system
to enter and work on the particular database.
By pressing \dt, it lists all the tables in that database.
OTHER COMMANDS ON PSQL
\h - gives the list of all sql  statements
\? - gives the list of all postgres statements and thier function