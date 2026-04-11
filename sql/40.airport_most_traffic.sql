/*
    https://leetcode.com/problems/the-airport-with-the-most-traffic/description/
*/

WITH TEMP_TABLE AS (
    SELECT departure_airport AS airport_id, flights_count FROM Flights
    UNION ALL
    SELECT arrival_airport AS airport, flights_count FROM Flights
), TEMP_2 AS (
    SELECT
        airport_id,
        SUM(flights_count) AS total_flights
    FROM
        TEMP_TABLE
    GROUP BY
        airport_id
)
SELECT
    airport_id
FROM
    TEMP_2
WHERE
    total_flights = (SELECT MAX(total_flights) FROM TEMP_2)