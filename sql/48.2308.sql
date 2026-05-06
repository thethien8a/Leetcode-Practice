/*
    https://leetcode.com/problems/arrange-table-by-gender
*/

WITH TEMP_TABLE AS (
    SELECT
        user_id,
        gender,
        ROW_NUMBER() OVER(PARTITION BY gender ORDER BY user_id ASC) AS rn, -- Cái này dùng để gom nhóm
        (CASE
            WHEN gender = 'female' THEN 1
            WHEN gender = 'other' THEN 2
            ELSE 3
        END) AS order_gender -- Cái này để đảm bảo thứ tự
    FROM
        Genders
)
SELECT
    user_id,
    gender
FROM
    TEMP_TABLE
ORDER BY
    rn ASC, order_gender ASC;