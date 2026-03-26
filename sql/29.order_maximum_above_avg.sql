WITH TEMP_TABLE AS (
    SELECT
        order_id,
        AVG(quantity) AS avg_quantity
    FROM
        Orders
    GROUP BY
        order_id
)
SELECT
    order_id
FROM
    OrdersDetails
GROUP BY
    order_id
HAVING
    MAX(quantity) > (SELECT MAX(avg_quantity) FROM TEMP_TABLE)