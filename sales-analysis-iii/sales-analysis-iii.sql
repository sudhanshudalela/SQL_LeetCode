# Write your MySQL query statement below

SELECT DISTINCT p.product_id, p.product_name
FROM Sales AS s
LEFT JOIN Product AS p
ON s.product_id = p.product_id
WHERE sale_date >= '2019-01-01' AND sale_date <= '2019-03-31' AND p.product_id NOT IN (
SELECT product_id
FROM Sales
WHERE sale_date > '2019-03-31' OR sale_date < '2018-12-31')
ORDER BY p.product_id