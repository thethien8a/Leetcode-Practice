/*
    https://leetcode.com/problems/all-the-pairs-with-the-maximum-number-of-common-followers/
*/

-- Not optimize
WITH TEMP_TABLE AS (
    SELECT
        r1.user_id AS user1_id,
        r2.user_id AS user2_id,
        COUNT(r1.follower_id) AS common_follower_count
    FROM
        Relations r1
        INNER JOIN Relations r2
            ON r1.follower_id = r2.follower_id
            AND r1.user_id < r2.user_id
    GROUP BY
        r1.user_id, r2.user_id
)
SELECT
    user1_id,
    user2_id
FROM
    TEMP_TABLE
WHERE
    common_follower_count = (SELECT MAX(common_follower_count) FROM TEMP_TABLE)



-- Optimize solution
WITH CTE AS (
    SELECT
        r1.user_id AS user1_id,
        r2.user_id AS user2_id,
        COUNT(*) AS cnt,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM Relations r1
    JOIN Relations r2
        USING (follower_id)              
    WHERE r1.user_id < r2.user_id
    GROUP BY r1.user_id, r2.user_id
)
SELECT user1_id, user2_id
FROM CTE
WHERE rnk = 1;