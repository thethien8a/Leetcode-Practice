/*
    https://leetcode.com/problems/order-two-columns-independently/
*/

WITH TEMP_1 AS (
    SELECT
        first_col,
        ROW_NUMBER() OVER(ORDER BY first_col ASC) AS rn
    FROM
        Data
), TEMP_2 AS (
    SELECT
        second_col,
        ROW_NUMBER() OVER(ORDER BY second_col DESC) AS rn
    FROM
        Data
)
SELECT
    t1.first_col,
    t2.second_col
FROM
    TEMP_1 t1
    INNER JOIN TEMP_2 t2
        ON t1.rn = t2.rn
ORDER BY
    t1.first_col ASC