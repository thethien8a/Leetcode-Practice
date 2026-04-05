/*
    https://leetcode.com/problems/find-cutoff-score-for-each-school/
*/

SELECT
    school_id,
    COALESCE(MIN(score), -1) AS score
FROM
    Schools s
    LEFT JOIN Exam e
        ON s.capacity >= e.student_count
GROUP BY
    school_id