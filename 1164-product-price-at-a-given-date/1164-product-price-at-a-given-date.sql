# Write your MySQL query statement below


SELECT product_id, 10 AS price
FROM Products
WHERE change_date > '2019-08-16' AND product_id NOT IN (SELECT product_id FROM Products WHERE change_date <= '2019-08-16')
UNION
SELECT product_id, new_price
FROM (
    SELECT *, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS rk
    FROM Products
    WHERE change_date <= '2019-08-16'
    ) Q
WHERE rk = 1