# Write your MySQL query statement below

SELECT product_name, sale_date, COUNT(product_name) AS total 
FROM (
    SELECT LOWER(TRIM(product_name)) AS product_name, DATE_FORMAT(sale_date,'%Y-%m') AS sale_date
    FROM Sales) q
GROUP BY product_name, sale_date
ORDER BY product_name, sale_date