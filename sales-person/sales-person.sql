# Write your MySQL query statement below
  
SELECT DISTINCT s.name
FROM SalesPerson AS s
LEFT JOIN Orders AS o
ON s.sales_id = o.sales_id
LEFT JOIN Company AS c
ON o.com_id = c.com_id
WHERE c.name IS NULL OR c.name != 'RED' AND s.name NOT IN (SELECT s.name
FROM SalesPerson AS s
LEFT JOIN Orders AS o
ON s.sales_id = o.sales_id
LEFT JOIN Company AS c
ON o.com_id = c.com_id
WHERE c.name = 'RED')