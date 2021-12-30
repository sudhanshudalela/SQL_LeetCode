# Write your MySQL query statement below

SELECT customer_id
FROM (
    SELECT customer_id, SUM(revenue) AS rev
    FROM (
        SELECT *
        FROM Customers
        WHERE year = 2021
        ) q
    GROUP BY customer_id
    HAVING rev > 0
    ) q1