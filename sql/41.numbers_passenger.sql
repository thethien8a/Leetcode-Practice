/*
    https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/description/
*/

WITH TEMP_TABLE AS (
    SELECT
        bus_id,
        LAG(arrival_time, 1, -1) OVER (ORDER BY arrival_time) AS prev_arrival_time,
        arrival_time
    FROM
        Buses
)
SELECT
    t.bus_id,
    COUNT(p.passenger_id) AS passengers_cnt
FROM
    TEMP_TABLE t
    LEFT JOIN Passengers p
        ON p.arrival_time > t.prev_arrival_time  
        AND p.arrival_time <= t.arrival_time   
GROUP BY
    t.bus_id
ORDER BY
    t.bus_id ASC;