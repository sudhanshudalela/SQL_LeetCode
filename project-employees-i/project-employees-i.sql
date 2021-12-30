# Write your MySQL query statement below

SELECT project_id, ROUND(AVG(experience_years),2) AS average_years
FROM (
    SELECT p.project_id, experience_years
    FROM Project AS p
    LEFT JOIN Employee AS e
    ON p.employee_id = e.employee_id
    ) q
GROUP BY project_id