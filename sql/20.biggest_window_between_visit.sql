/*
    https://leetcode.com/problems/biggest-window-between-visits
*/

WITH cte AS (
    SELECT
        user_id,
        visit_date,
        COALESCE(
            LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date ASC),
            '2021-01-01'::DATE
        ) AS next_visit
    FROM UserVisits
)
SELECT
    user_id,
    MAX(next_visit - visit_date) AS biggest_window
FROM cte
GROUP BY user_id
ORDER BY user_id;