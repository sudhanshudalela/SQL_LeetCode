# Write your MySQL query statement below

SELECT E2.employee_id, E2.name, COUNT(*) AS reports_count, ROUND(AVG(E1.age),0) AS average_age
FROM Employees AS E1
INNER JOIN Employees AS E2
ON E1.reports_to = E2.employee_id
GROUP BY E2.employee_id
ORDER BY E2.employee_id