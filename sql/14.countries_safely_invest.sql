/*
    https://leetcode.com/problems/countries-you-can-safely-invest-in
*/

WITH TEMP_TABLE AS (
    SELECT caller_id AS id, duration FROM Calls
    UNION ALL
    SELECT callee_id AS id, duration FROM Calls
)
SELECT
    c.name AS country
FROM
    TEMP_TABLE t
    LEFT JOIN Person p
        ON t.id = p.id
    LEFT JOIN Country c
        ON LEFT(p.phone_number, 3) = c.country_code
GROUP BY c.name       
HAVING
    AVG(t.duration) > (SELECT AVG(duration) FROM Calls)