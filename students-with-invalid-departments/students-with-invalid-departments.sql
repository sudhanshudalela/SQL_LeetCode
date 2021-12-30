# Write your MySQL query statement below

SELECT S.id, S.name
FROM Students AS S
LEFT JOIN Departments AS D
ON S.department_id = D.id
WHERE D.name IS NULL