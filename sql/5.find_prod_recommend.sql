/*
    https://leetcode.com/problems/find-product-recommendation-pairs/
*/

-- NOT OPTIMIZE
WITH TEMP_TABLE AS (
    SELECT
        p1.product_id AS product1_id,
        p2.product_id AS product2_id,
        pi1.category AS product1_category,
        pi2.category AS product2_category
    FROM
        ProductPurchases p1
        INNER JOIN ProductPurchases p2
            ON p1.product_id <> p2.product_id AND p1.user_id = p2.user_id AND p1.product_id < p2.product_id
        INNER JOIN ProductInfo pi1
            ON p1.product_id = pi1.product_id
        INNER JOIN ProductInfo pi2
            ON p2.product_id = pi2.product_id
)
SELECT 
    product1_id,
    product2_id,
    product1_category,
    product2_category,
    COUNT(*) AS customer_count
FROM 
    TEMP_TABLE
GROUP BY
    product1_id, product2_id, product1_category, product2_category
HAVING 
    COUNT(*) >= 3
ORDER BY
    customer_count DESC, product1_id ASC, product2_id ASC


-- OPTIMIZE (JOIN LATER, GROUP BY FIRST)
WITH cte1 AS (
    SELECT p1.user_id, p1.product_id AS product1_id, p2.product_id AS product2_id
    FROM ProductPurchases p1
    CROSS JOIN ProductPurchases p2
    WHERE p1.user_id = p2.user_id AND p1.product_id <> p2.product_id AND p1.product_id < p2.product_id
), 
cte2 AS (
    SELECT product1_id, product2_id, COUNT(*) AS customer_count
    FROM cte1
    GROUP BY 1,2 
    HAVING COUNT(*) >=3
    ORDER BY product1_id,product2_id
)

SELECT a.product1_id, a.product2_id, b.category AS product1_category, c.category AS product2_category, customer_count
FROM cte2 a 
LEFT JOIN ProductInfo b
ON a.product1_id = b.product_id

LEFT JOIN ProductInfo c
ON a.product2_id = c.product_id

ORDER BY customer_count DESC, product1_id, product2_id