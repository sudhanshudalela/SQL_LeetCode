# Write your MySQL query statement below

SELECT seller_id
FROM (
SELECT seller_id, SUM(price) AS price
FROM Sales
GROUP BY seller_id
HAVING price = (
SELECT SUM(price) AS price
FROM Sales
GROUP BY seller_id
ORDER BY price DESC
LIMIT 1
    )
    ) q