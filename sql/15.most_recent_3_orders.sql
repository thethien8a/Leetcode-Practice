/*
    https://leetcode.com/problems/the-most-recent-three-orders
*/

WITH TEMP_TABLE AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM
        Orders
)
SELECT
    C.name,
    C.customer_id,
    T.order_id,
    T.order_date,
FROM
    TEMP_TABLE T
    INNER JOIN Customers C
        ON T.customer_id = C.customer_id
WHERE
    rn <= 3
ORDER BY
    C.name ASC,
    C.customer_id ASC,
    T.order_date DESC