/*
    https://leetcode.com/problems/bank-account-summary/
*/

WITH TEMP_TABLE AS (
    SELECT user_id, credit
    FROM Users
    UNION ALL
    SELECT paid_by AS user_id, -amount AS credit
    FROM Transactions
    UNION ALL
    SELECT paid_to AS user_id, amount AS credit
    FROM Transactions
)
SELECT
    t.user_id,
    u.user_name,
    SUM(credit) AS credit,
    CASE WHEN SUM(credit) < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
FROM TEMP_TABLE t
INNER JOIN Users u ON t.user_id = u.user_id
GROUP BY t.user_id, u.user_name;
