/*
    https://leetcode.com/problems/count-the-number-of-experiments/
*/

WITH TEMP_TABLE AS (
    SELECT *
    FROM (
        VALUES 
            ('IOS'),
            ('Android'),
            ('Web')
    ) AS t1(platform)
    CROSS JOIN (
        VALUES 
            ('Reading'),
            ('Sports'),
            ('Programming')
    ) AS t2(experiment_name)   
)
SELECT
    t.platform,
    t.experiment_name,
    COUNT(e.experiment_id) AS num_experiments
FROM
    TEMP_TABLE t
    LEFT JOIN Experiments e
        ON t.platform = e.platform
        AND t.experiment_name = e.experiment_name
GROUP BY
    t.platform, t.experiment_name;



-- SUITABLE WITH ALL OTHERS PLATFORM:
SELECT 
    p.platform, 
    n.experiment_name, 
    COUNT(e.platform) AS num_experiments
FROM (
    SELECT 'Android' AS platform
    UNION ALL
    SELECT 'IOS' AS platform
    UNION ALL
    SELECT 'Web' AS platform
) AS p
CROSS JOIN (
    SELECT 'Reading' AS experiment_name
    UNION ALL
    SELECT 'Sports' AS experiment_name
    UNION ALL
    SELECT 'Programming' AS experiment_name
) AS n
LEFT JOIN Experiments e
    USING (platform, experiment_name)
GROUP BY 
    p.platform, 
    n.experiment_name;