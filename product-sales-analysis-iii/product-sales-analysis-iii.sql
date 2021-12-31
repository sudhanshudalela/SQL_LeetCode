# Write your MySQL query statement below

SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT product_id, year, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS rk, quantity, price
    FROM Sales
    ) Q
WHERE rk = 1