# Write your MySQL query statement below

SELECT q1.employee_id AS employee_id, IFNULL(q2.salary,0) AS bonus
FROM (
    SELECT *
    FROM Employees
    ) q1
LEFT JOIN (
    SELECT *
    FROM (
        SELECT *
        FROM Employees
        WHERE MOD(employee_id,2) != 0 AND name NOT LIKE 'M%'
        ) q
    ) q2
ON q1.employee_id = q2.employee_id