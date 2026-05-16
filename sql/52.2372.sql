/*
    https://leetcode.com/problems/calculate-the-influence-of-each-salesperson/
*/

SELECT
    s.salesperson_id,
    s.name,
    COALESCE(SUM(s2.price), 0) AS total
FROM
    Salesperson s
    LEFT JOIN Customer c
        ON s.salesperson_id = c.salesperson_id
    LEFT JOIN Sales s2
        ON c.customer_id = s2.customer_id
GROUP BY
    s.salesperson_id, s.name