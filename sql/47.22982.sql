/*
    https://leetcode.com/problems/tasks-count-in-the-weekend/description/
*/

SELECT
    COUNT(*) FILTER (WHERE TO_CHAR(submit_date, 'ID') IN ('6', '7')) AS weekend_cnt,
    COUNT(*) FILTER (WHERE TO_CHAR(submit_date, 'ID') NOT IN ('6', '7')) AS working_cnt
FROM
    Tasks;