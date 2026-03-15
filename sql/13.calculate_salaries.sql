/*
    https://leetcode.com/problems/calculate-salaries
*/

WITH TEMP_TABLE AS (
    SELECT
        company_id,
        employee_id,
        employee_name,
        salary,
        MAX(salary) OVER (PARTITION BY company_id) AS max_salary
    FROM Salaries
)
SELECT
    company_id,
    employee_id,
    employee_name,
    ROUND(salary - salary * CASE
        WHEN max_salary < 1000 THEN 0
        WHEN max_salary BETWEEN 1000 AND 10000 THEN 0.24
        ELSE 0.49
    END) AS salary 
FROM TEMP_TABLE