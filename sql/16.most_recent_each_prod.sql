/*
    https://leetcode.com/problems/the-most-recent-orders-for-each-product/
*/

SELECT
    p.product_name,
    p.product_id,
    o.order_id,
    o.order_date
FROM
    Products p
JOIN
    (SELECT
        product_id,
        order_id,
        DENSE_RANK() OVER(PARTITION BY product_id ORDER BY order_date DESC) as ranking
     FROM Orders) ranked_orders ON p.product_id = ranked_orders.product_id
WHERE
    ranking = 1
ORDER BY
    product_name, product_id, order_id