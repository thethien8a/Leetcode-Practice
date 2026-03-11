/*
    https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/
*/

-- NOT OPTIMIZED
SELECT 
    o.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.product_name) AS count_number
FROM
    Orders o
    INNER JOIN Customers c
        ON o.customer_id = c.customer_id
    
WHERE
    product_name IN ('A','B')
    AND NOT EXISTS (
        SELECT 1
        FROM Orders o2
        WHERE o2.customer_id = o.customer_id
        AND o2.product_name = 'C'
    )
GROUP BY
    o.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.product_name) >= 2


-- OPTIMIZED
SELECT 
    c.customer_id,
    c.customer_name
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.customer_name
HAVING
    SUM(CASE WHEN o.product_name = 'A' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN o.product_name = 'B' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN o.product_name = 'C' THEN 1 ELSE 0 END) = 0;