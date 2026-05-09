/*
    https://leetcode.com/problems/product-sales-analysis-iv
*/

WITH TEMP_TABLE AS (
    SELECT
        s.user_id,
        s.product_id,
        DENSE_RANK() OVER(PARTITION BY s.user_id ORDER BY SUM(s.quantity * p.price) DESC) AS rnk
    FROM
        Sales s
        INNER JOIN Product p
            ON s.product_id = p.product_id
    GROUP BY
        s.user_id, s.product_id
)
SELECT
    user_id,
    product_id
FROM
    TEMP_TABLE
WHERE
    rnk = 1

