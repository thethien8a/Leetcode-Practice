/*
    https://leetcode.com/problems/compute-the-rank-as-a-percentage/
*/

WITH TEMP_TABLE AS (
    SELECT
        student_id,
        department_id,
        RANK() OVER(PARTITION BY department_id ORDER BY mark DESC) AS rnk,
        COUNT(student_id) OVER(PARTITION BY department_id) AS total_student
    FROM
        Students        
)
SELECT
    student_id,
    department_id,
    ROUND(
        COALESCE((rnk - 1) * 100 / (total_student - 1), 0), 
        2
    ) AS percentage
FROM
    TEMP_TABLE;