/*
    https://leetcode.com/problems/rectangles-area
*/

SELECT
    pt1.id as p1,
    pt2.id as p2,
    ABS(pt1.x_value - pt2.x_value) * ABS(pt1.y_value - pt2.y_value) as area
FROM
    Points pt1
    JOIN Points pt2 
        ON pt1.id < pt2.id
HAVING
    area > 0
ORDER BY
    area DESC,
    p1,
    p2;