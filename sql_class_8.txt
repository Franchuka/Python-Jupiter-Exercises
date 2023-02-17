
CREATE TABLE product_groups (
	group_id serial PRIMARY KEY,
	group_name VARCHAR (255) NOT NULL
);

CREATE TABLE products (
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	price DECIMAL (11, 2),
	group_id INT NOT NULL,
	FOREIGN KEY (group_id) REFERENCES product_groups (group_id)
);

INSERT INTO product_groups (group_name)
VALUES
	('Smartphone'),
	('Laptop'),
	('Tablet');

INSERT INTO products (product_name, group_id,price)
VALUES
	('Microsoft Lumia', 1, 200),
	('HTC One', 1, 400),
	('Nexus', 1, 500),
	('iPhone', 1, 900),
	('HP Elite', 2, 1200),
	('Lenovo Thinkpad', 2, 700),
	('Sony VAIO', 2, 700),
	('Dell Vostro', 2, 800),
	('iPad', 3, 700),
	('Kindle Fire', 3, 150),
	('Samsung Galaxy Tab', 3, 200);

SELECT group_name, AVG(price) :: INTEGER
FROM products
INNER JOIN product_groups USING(group_id)
GROUP BY group_name;

--using actual windows functions, 
--FIRST_VALUE reurns the lowest price
SELECT product_name, group_name, price, FIRST_VALUE(price) OVER (PARTITION BY group_name ORDER BY price) AS lowest_price_per_group
FROM products
INNER JOIN product_groups USING (group_id);


-- RANK() ranks the rows fromthe smallest to the biggest, if 2 numbers have the same the rank, it skips the next rank before inputting the rank of the new row
-- while DENSE_RANK() doesnt skip ranks
SELECT product_name, 
       group_name, 
       price, 
       RANK() OVER (PARTITION BY group_name ORDER BY price) AS lowest_price_per_group
FROM products
INNER JOIN product_groups USING (group_id);