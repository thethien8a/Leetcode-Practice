/*
    https://leetcode.com/problems/the-category-of-each-member-in-the-store/
*/

WITH TEMP_TABLE AS (
    SELECT
        M.member_id,
        M.name,
        COUNT(V.visit_id) AS total_visits,
        100.0 * COUNT(P.visit_id) / NULLIF(COUNT(V.visit_id), 0) AS conversion_rate
    FROM Members M
    LEFT JOIN Visits V ON M.member_id = V.member_id
    LEFT JOIN Purchases P ON V.visit_id = P.visit_id
    GROUP BY M.member_id, M.name
)
SELECT
    member_id,
    name,
    CASE
        WHEN total_visits = 0       THEN 'Bronze'
        WHEN conversion_rate >= 80  THEN 'Diamond'
        WHEN conversion_rate >= 50  THEN 'Gold'
        ELSE 'Silver'
    END AS category
FROM TEMP_TABLE;
