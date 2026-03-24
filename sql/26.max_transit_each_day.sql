/*
    https://leetcode.com/problems/maximum-transaction-each-day/
*/


SELECT 
    transaction_id
FROM
(
    SELECT
        transaction_id,
        DENSE_RANK() OVER(PARTITION BY day::DATE ORDER BY amount DESC) AS rn
    FROM
        Transactions
) AS temp
WHERE
    rn = 1
ORDER BY 
    transaction_id ASC;