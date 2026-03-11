/*
    https://leetcode.com/problems/evaluate-boolean-expression/
*/

WITH TEMP_TABLE AS (
    SELECT
        e.left_operand,
        e.operator,
        e.right_operand,
        v1.value AS left_value,   -- đặt alias rõ ràng
        v2.value AS right_value
    FROM
        Expressions e
        LEFT JOIN Variables v1 ON e.left_operand  = v1.name
        LEFT JOIN Variables v2 ON e.right_operand = v2.name
)
SELECT
    left_operand,
    operator,
    right_operand,
    CASE
        WHEN operator = '>' AND left_value >  right_value THEN 'true'
        WHEN operator = '<' AND left_value <  right_value THEN 'true'
        WHEN operator = '=' AND left_value =  right_value THEN 'true'
        ELSE 'false'
    END AS value
FROM TEMP_TABLE