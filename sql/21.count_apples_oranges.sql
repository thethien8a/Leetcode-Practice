/*
    https://leetcode.com/problems/count-apples-and-oranges/
*/


SELECT
    SUM(COALESCE(B.apple_count) + COALESCE(C.apple_count, 0)) AS apple_count,
    SUM(COALESCE(B.orange_count) + COALESCE(C.orange_count, 0)) AS orange_count
FROM
    Boxes B
    LEFT JOIN Chests C
        ON B.chest_id = C.chest_id
