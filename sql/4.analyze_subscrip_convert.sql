/*
    https://leetcode.com/problems/analyze-subscription-conversion
*/

-- NOT OPTIMIZE
-- WITH TEMP_TABLE AS (
--     SELECT
--         user_id,
--         ROUND(AVG(activity_duration) FILTER (WHERE activity_type = 'free_trial'), 2) AS trial_avg_duration,
--         ROUND(AVG(activity_duration) FILTER (WHERE activity_type = 'paid'), 2) AS paid_avg_duration
--     FROM
--         UserActivity
--     WHERE
--         activity_type IN ('free_trial', 'paid')
--     GROUP BY
--         user_id
-- )
-- SELECT
--     *
-- FROM
--     TEMP_TABLE
-- WHERE 
--     paid_avg_duration > 0
-- ORDER BY
--     user_id;


-- OPTIMIZE
SELECT
    user_id,
    ROUND(AVG(activity_duration) FILTER (WHERE activity_type = 'free_trial')::DECIMAL, 2) AS trial_avg_duration,
    ROUND(AVG(activity_duration) FILTER (WHERE activity_type = 'paid')::DECIMAL, 2) AS paid_avg_duration
FROM UserActivity
WHERE activity_type IN ('free_trial', 'paid')
GROUP BY user_id
HAVING COUNT(DISTINCT activity_type) = 2
ORDER BY user_id;
