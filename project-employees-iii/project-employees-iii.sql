# Write your MySQL query statement below

WITH cte AS (
    SELECT project_id, P.employee_id, experience_years
    FROM Project AS P
    INNER JOIN Employee AS E
    ON P.employee_id = E.employee_id
    )
    
SELECT project_id, employee_id
FROM (
    SELECT *, DENSE_RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) as rk
    FROM cte
    ) Q
WHERE rk = 1
