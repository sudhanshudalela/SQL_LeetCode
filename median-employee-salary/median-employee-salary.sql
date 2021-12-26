# Write your MySQL query statement below

SELECT id, company, salary
FROM (
    SELECT *
    FROM
    (
        SELECT id, company, salary, ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) AS nrow
        FROM Employee
    ) q1
    LEFT JOIN (
    SELECT *
    FROM (
        SELECT company AS cmp, ROUND(AVG(nrow),1) AS mean
        FROM (
            SELECT id, company, salary, ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) AS nrow
            FROM Employee
            ) sq
        GROUP BY company
        ) AS q2
    ) q3
    ON q1.company = q3.cmp
    ) q4
WHERE nrow = mean - 0.5 OR nrow = mean + 0.5 OR nrow = mean
    