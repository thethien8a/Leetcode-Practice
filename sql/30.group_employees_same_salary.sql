/*
    https://leetcode.com/problems/group-employees-of-the-same-salary/
*/

-- Not optimize
WITH TEMP_TABLE AS (
    SELECT
        employee_id,
        name,
        salary
    FROM
        Employees
    WHERE
        salary IN (SELECT salary FROM Employees GROUP BY salary HAVING COUNT(*) > 1)
)
SELECT
    t.employee_id,
    t.name,
    t.salary,
    DENSE_RANK() OVER(ORDER BY t.salary ASC) AS team_id
FROM
    TEMP_TABLE t
ORDER BY
    t.salary ASC, t.employee_id ASC


-- Optimize
SELECT 
    employee_id,
    name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary ASC) AS team_id
FROM Employees e1
WHERE EXISTS (
    SELECT 1 
    FROM Employees e2
    WHERE e1.salary = e2.salary 
      AND e1.employee_id != e2.employee_id
)
ORDER BY team_id ASC, employee_id ASC;