# Write your MySQL query statement below

WITH cte AS (
    SELECT name, C.customer_id, order_id, order_date
    FROM Customers AS C
    INNER JOIN Orders AS O
    ON C.customer_id = O.customer_id
    )

SELECT name AS customer_name, customer_id, order_id, order_date
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS r
    FROM cte
    ) q
WHERE r <= 3
ORDER BY customer_name, customer_id, order_date DESC