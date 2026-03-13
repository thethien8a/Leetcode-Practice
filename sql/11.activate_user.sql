/*
    https://leetcode.com/problems/active-users/
*/

WITH ranked AS (
    SELECT DISTINCT 
        id, 
        login_date,
        DENSE_RANK() OVER (PARTITION BY id ORDER BY login_date) AS rk
    FROM
        Logins
), subtract AS (
    SELECT
        id,
        login_date - rk AS groupp
    FROM
        Logins
)
SELECT
    sp.id,
    a.name
FROM
    subtract s
    INNER JOIN Accounts a
        ON s.id = a.id
GROUP BY
    s.id, a.groupp -- Khá hay, giờ tôi mới biết là ta có thể group by với having mà không cần toán tử ở trên chỗ select (count, sum, ...)
HAVING COUNT(*) >= 5
ORDER BY s.id

