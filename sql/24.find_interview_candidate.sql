/*
    https://leetcode.com/problems/find-interview-candidates/
*/

WITH TEMP_TABLE AS (
    SELECT gold_medal AS medal, contest_id FROM Contests
    UNION ALL
    SELECT silver_medal, contest_id FROM Contests
    UNION ALL
    SELECT bronze_medal, contest_id FROM Contests
),
TEMP_2 AS (
    SELECT
        medal,
        contest_id,
        ROW_NUMBER() OVER (PARTITION BY medal ORDER BY contest_id) AS rn
    FROM TEMP_TABLE
),
COND_1 AS (
    SELECT medal
    FROM TEMP_2
    GROUP BY medal, contest_id - rn
    HAVING COUNT(*) >= 3
),
COND_2 AS (
    SELECT
        gold_medal AS medal
    FROM
        Contests
    GROUP BY gold_medal
    HAVING COUNT(*) >= 3
), 
CANDIDATE AS (
    SELECT
        medal AS user_id
    FROM
        COND_1
    UNION
    SELECT
        medal AS user_id
    FROM
        COND_2
)
SELECT
    u.name,
    u.mail
FROM
    Users u
    INNER JOIN FINAL f
        ON u.user_id = f.user_id


-- Tối ưu

WITH MEDALS AS (
    SELECT gold_medal   u, contest_id c FROM Contests
    UNION ALL
    SELECT silver_medal, contest_id FROM Contests
    UNION ALL
    SELECT bronze_medal, contest_id FROM Contests
)
SELECT DISTINCT u.name, u.mail
FROM Users u
WHERE u.user_id IN (
    -- Điều kiện 1: 3 contest liên tiếp
    SELECT m.u
    FROM MEDALS m
    WHERE EXISTS (SELECT 1 FROM MEDALS WHERE u = m.u AND c = m.c + 1)
      AND EXISTS (SELECT 1 FROM MEDALS WHERE u = m.u AND c = m.c + 2)
)
OR u.user_id IN (
    -- Điều kiện 2: gold >= 3 lần
    SELECT gold_medal
    FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(*) >= 3
);