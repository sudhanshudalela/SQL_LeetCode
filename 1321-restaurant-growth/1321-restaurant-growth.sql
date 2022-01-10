# Write your MySQL query statement below

WITH cte AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
)

SELECT visited_on, amount, average_amount
FROM (
    SELECT visited_on, ROW_NUMBER() OVER(ORDER BY visited_on) AS d, SUM(amount) OVER(ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount, ROUND(AVG(amount) OVER(ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount
    FROM cte
    ) q
WHERE d > 6