/*
https://leetcode.com/problems/find-students-who-improved/
*/

-- NOT OPTIMIZE

-- WITH temp_table AS (
--     SELECT
--         *,
--         ROW_NUMBER() OVER(
--             PARTITION BY student_id, subject
--             ORDER BY exam_date
--         ) AS rank_attendance
--     FROM scores
-- ),
-- TEMP_2 AS (
-- SELECT
--     student_id,
--     subject,
--     MAX(score) FILTER (WHERE rank_attendance = 1) AS first_score,
--     MAX(score) FILTER (
--         WHERE rank_attendance = (
--             SELECT MAX(rank_attendance)
--             FROM temp_table t2
--             WHERE t2.student_id = temp_table.student_id
--             AND t2.subject = temp_table.subject
--         )
--     ) AS latest_score,
--     MAX(rank_attendance) AS attendance_times
-- FROM temp_table
-- GROUP BY student_id, subject
-- )
-- SELECT 
--     student_id, subject, first_score, latest_score
-- FROM TEMP_2
-- WHERE attendance_times > 1 AND latest_score > first_score

SELECT DISTINCT
    student_id, subject, first_score, latest_score
FROM (
    SELECT
        student_id,
        subject,
        FIRST_VALUE(score) OVER w AS first_score,
        LAST_VALUE(score)  OVER w AS latest_score,
        COUNT(*)  OVER (PARTITION BY student_id, subject) AS cnt
    FROM scores
    WINDOW w AS (
        PARTITION BY student_id, subject
        ORDER BY exam_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    )
) t
WHERE cnt > 1
  AND latest_score > first_score
ORDER BY
    student_id ASC, subject ASC