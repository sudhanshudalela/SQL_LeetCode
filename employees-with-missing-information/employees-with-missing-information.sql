# Write your MySQL query statement below

SELECT employee_id
FROM (
    SELECT E.employee_id, E.name, S.salary
    FROM Employees AS E
    LEFT JOIN Salaries AS S
    ON E.employee_id = S.employee_id
    UNION
    SELECT S.employee_id, E.name, S.salary
    FROM Employees AS E
    RIGHT JOIN Salaries AS S
    ON E.employee_id = S.employee_id
    ) Q
WHERE name IS NULL OR salary IS NULL
ORDER BY employee_id