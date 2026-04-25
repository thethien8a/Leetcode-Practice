/*
    https://leetcode.com/problems/number-of-times-a-driver-was-a-passenger
*/

WITH TEMP_TABLE AS (
    SELECT DISTINCT
        driver_id 
    FROM
        Rides
)
SELECT
    tmp.driver_id,
    COUNT(tmp.passenger_id) AS cnt
FROM 
(
    SELECT
        t.driver_id,
        r.passenger_id 
    FROM
        TEMP_TABLE t
        LEFT JOIN Rides r
            ON t.driver_id = r.passenger_id
) tmp
GROUP BY
    tmp.driver_id


-- OPTIMIZE
WITH TEMP_TABLE AS (
    SELECT DISTINCT driver_id 
    FROM Rides
)
SELECT
    t.driver_id,
    COUNT(r.passenger_id) AS cnt
FROM 
    TEMP_TABLE t
LEFT JOIN 
    Rides r ON t.driver_id = r.passenger_id
GROUP BY
    t.driver_id;