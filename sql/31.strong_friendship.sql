/*
    https://leetcode.com/problems/strong-friendship/
*/

WITH TEMP_TABLE AS (
    SELECT user1_id, user2_id FROM Friendship
    UNION ALL
    SELECT user2_id, user1_id FROM Friendship
)
SELECT
    t1.user1_id,
    t2.user1_id AS user2_id,
    COUNT(*) AS common_friend
FROM
    TEMP_TABLE t1
    INNER JOIN TEMP_TABLE t2
        ON t1.user1_id <> t2.user1_id
        AND t1.user2_id = t2.user2_id
    INNER JOIN Friendship f
        ON f.user1_id = t1.user1_id
        AND f.user2_id = t2.user1_id
GROUP BY
    t1.user1_id, t2.user1_id
HAVING
    COUNT(*) >= 3