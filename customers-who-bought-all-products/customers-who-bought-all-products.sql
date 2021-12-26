# Write your MySQL query statement below

SELECT customer_id
FROM (
    SELECT customer_id, COUNT(*) AS c
    FROM (
        SELECT DISTINCT customer_id, product_key
        FROM Customer
        ) r
    GROUP BY customer_id
    HAVING c = (SELECT COUNT(*) FROM Product)
    ) q