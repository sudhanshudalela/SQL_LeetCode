# Write your MySQL query statement below

SELECT order_id, customer_id, order_type
FROM (
    SELECT *, DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_type) AS dr
    FROM Orders
    ) q
WHERE dr = 1