/*
    https://leetcode.com/problems/grand-slam-titles/
*/
WITH TEMP_TABLE AS (
    SELECT Wimbledon AS player_id FROM Championships
    UNION ALL
    SELECT Fr_open   AS player_id FROM Championships
    UNION ALL
    SELECT US_open   AS player_id FROM Championships  
    UNION ALL
    SELECT Au_open   AS player_id FROM Championships  -- ✅ Championships
)
SELECT
    p.player_id,
    p.player_name,
    COUNT(t.player_id) AS grand_slams_count
FROM Players p
INNER JOIN TEMP_TABLE t ON p.player_id = t.player_id
GROUP BY p.player_id, p.player_name;
