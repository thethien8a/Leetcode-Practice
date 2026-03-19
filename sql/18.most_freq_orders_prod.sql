/*
    https://leetcode.com/problems/the-most-frequently-ordered-products-for-each-customer/
*/

-- Not optimized
WITH TEMP_TABLE AS (
    SELECT
        o.customer_id,
        o.product_id,
        p.product_name,
        COUNT(*) AS order_count
    FROM
        Orders o
        INNER JOIN Products p
            ON o.product_id = p.product_id
    GROUP BY o.customer_id, o.product_id, p.product_name
)
SELECT
    customer_id,
    product_id,
    product_name
FROM
    (SELECT
        customer_id,
        product_id,
        product_name,
        order_count,
        DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_count DESC) AS rn
    FROM
        TEMP_TABLE
    )
WHERE rn = 1

-- Optimized
SELECT customer_id, product_id, product_name
FROM (
    SELECT
        o.customer_id,
        o.product_id,
        p.product_name,
        DENSE_RANK() OVER (
            PARTITION BY o.customer_id
            ORDER BY COUNT(o.product_id) DESC
        ) AS rnk
    FROM Orders o
    JOIN Products p ON o.product_id = p.product_id
    GROUP BY o.customer_id, o.product_id, p.product_name  -- ← bắt buộc
) AS TEMP_TABLE
WHERE rnk = 1;