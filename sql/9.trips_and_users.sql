/*
    https://leetcode.com/problems/trips-and-users/
*/

-- SOLUTION 1
SELECT
    request_at AS "Day",
    ROUND(
        (COUNT(*) FILTER (WHERE status IN('cancelled_by_driver','cancelled_by_client')) * 1.0 
        / 
        COUNT(*)),2) AS "Cancellation Rate"
FROM
    Trips T
    INNER JOIN Users U1
        ON T.client_id = U1.users_id
    INNER JOIN Users U2
        ON T.driver_id = U2.users_id
WHERE
    U1.banned = 'No' 
    AND U2.banned = 'No' 
    AND request_at BETWEEN'2013-10-01' AND '2013-10-03'
GROUP BY
    request_at


-- SOLUTION 2: FILTER BEFORE JOIN
SELECT
    request_at as Day,
    ROUND(
        (SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END)*1.0/
        COUNT(*)), 2
    ) "Cancellation Rate"
FROM Trips
WHERE 
    client_id IN (
        SELECT users_id 
        FROM Users 
        WHERE role = 'client' AND banned = 'No')
    AND driver_id IN (
        SELECT users_id 
        FROM Users 
        WHERE role = 'driver' AND banned = 'No')
    AND request_at::DATE > '2013-09-30'
    AND request_at::DATE < '2013-10-04'
GROUP BY Day