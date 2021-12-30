# Write your MySQL query statement below

SELECT product_id, SUM(quantity) AS total_quantity
FROM (
    SELECT p.product_id, quantity
    FROM Sales AS s
    LEFT JOIN Product AS p
    ON s.product_id = p.product_id
    ) q
GROUP BY product_id