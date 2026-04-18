/*
    https://leetcode.com/problems/the-change-in-global-rankings/
*/

WITH TEMP_TABLE AS (
    SELECT
        tp.team_id,
        tp.name,
        ROW_NUMBER() OVER(ORDER BY tp.points DESC, tp.name ASC) AS rn_be4,
        ROW_NUMBER() OVER(ORDER BY tp.points + pc.points_change DESC, tp.name ASC) AS rn_after
    FROM
        TeamPoints tp
        INNER JOIN PointsChange pc 
            ON tp.team_id = pc.team_id
)
SELECT
    team_id,
    name,
    CAST(rn_be4 AS SIGNED) - CAST(rn_after AS SIGNED) AS rank_diff
FROM
    TEMP_TABLE;