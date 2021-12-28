# Write your MySQL query statement below

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id
FROM(
    SELECT employee_id, department_id, COUNT(*) AS c
    FROM Employee
    GROUP BY employee_id
    ) Q
WHERE c = 1