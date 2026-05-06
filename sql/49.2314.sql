/*
    https://leetcode.com/problems/the-first-day-of-the-maximum-recorded-degree-in-each-city/
*/

WITH TEMP_TABLE AS (
    city_id,
    degree,
    record_date
    ROW_NUMBER() OVER(PARTITION BY city_id ORDER BY degree DESC, record_date ASC) AS rn
)
SELECT
    city_id,
    degree,
    record_date
FROM
    TEMP_TABLE
WHERE
    rn = 1
ORDER BY
    city_id ASC;