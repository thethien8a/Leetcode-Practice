/*
    https://leetcode.com/problems/users-with-two-purchases-within-seven-days
*/

WITH TEMP_TABLE AS (
    SELECT
        user_id,
        purchase_date,
        LEAD(purchase_date) OVER (
            PARTITION BY user_id
            ORDER BY purchase_date
        ) AS next_time
    FROM Purchases
)
SELECT
    user_id
FROM TEMP_TABLE
WHERE DATEDIFF(next_time, purchase_date) <= 7
GROUP BY user_id
ORDER BY user_id; 