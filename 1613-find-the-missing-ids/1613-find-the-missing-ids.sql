# Write your MySQL query statement below

WITH RECURSIVE cte as (
    SELECT 1 AS n
    UNION
    SELECT n+1
    FROM cte
    WHERE n < (SELECT MAX(customer_id) FROM Customers)
)

SELECT n AS ids
FROM cte
WHERE n NOT IN (SELECT customer_id FROM Customers)
ORDER BY n