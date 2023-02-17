-- ASSIGNMENT ON GROUP BY (FRANCIS)

SELECT 
    customer_id, 
    first_name, 
    last_name, 
    COALESCE(state, 'No State') AS state,
    SUM(sales_amount) AS total_purchase
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
ORDER BY 
    total_purchase DESC, 
    first_name  ;
