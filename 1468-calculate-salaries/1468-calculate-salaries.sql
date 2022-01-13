# Write your MySQL query statement below

WITH cte AS (
    SELECT S2.company_id, employee_id, employee_name, salary, MS
    FROM (
        SELECT company_id, MAX(salary) AS MS
        FROM Salaries
        GROUP BY company_id
        ) S1
    INNER JOIN (
        SELECT *
        FROM Salaries
    ) S2
    ON S1.company_id = S2.company_id
)

SELECT company_id, employee_id, employee_name, ROUND(salary*(1-tax)) AS salary
FROM (
    SELECT *,
    CASE
        WHEN MS < 1000 THEN 0
        WHEN MS > 1000 AND MS < 10000 THEN 0.24
        WHEN MS > 10000 THEN 0.49
        END AS tax
    FROM cte
    ) q
