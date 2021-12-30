# Write your MySQL query statement below

SELECT id, month, next_salary AS salary
FROM (
    SELECT id, month, salary, SUM(salary) OVER(PARTITION BY id ORDER BY month RANGE BETWEEN 2 PRECEDING AND CURRENT ROW) AS next_salary, DENSE_RANK() OVER(PARTITION BY id ORDER BY month DESC) AS rk
    FROM Employee
    ) q
WHERE rk != 1
ORDER BY id, month DESC