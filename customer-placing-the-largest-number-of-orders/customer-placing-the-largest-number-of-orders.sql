# Write your MySQL query statement below

SELECT customer_number
FROM (
    SELECT customer_number, COUNT(*) AS no_orders
    FROM Orders
    GROUP BY customer_number
    ) s
ORDER BY no_orders DESC
LIMIT 1