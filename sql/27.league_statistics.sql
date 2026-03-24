/*
    https://leetcode.com/problems/league-statistics/description/
*/

SELECT
    t.team_id,
    t.team_name,
    COUNT(t.team_id) AS matches_played,
    SUM(CASE WHEN temp.home > temp.away THEN 3 WHEN temp.home = temp.away THEN 1 ELSE 0 END) AS points,
    SUM(temp.home) AS goal_for,
    SUM(temp.away) AS goal_against,
    SUM(temp.home) - SUM(temp.away) AS goal_diff
FROM
(
    SELECT
        home_team_id AS team_id,
        home_team_goals AS home,
        away_team_goals AS away
    FROM
        Matches
    UNION ALL
    SELECT
        away_team_id AS team_id,
        away_team_goals AS home,
        home_team_goals AS away
    FROM
        Matches
) AS temp
    INNER JOIN Teams t
        ON temp.team_id = t.team_id
GROUP BY
    t.team_id, t.team_name
ORDER BY
    points DESC, goal_diff DESC, team_name ASC;