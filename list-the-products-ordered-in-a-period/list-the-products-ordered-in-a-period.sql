# Write your MySQL query statement below

SELECT product_name, unit
FROM Products AS P
INNER JOIN (
    SELECT product_id, SUM(IF(order_date LIKE '%-02-%',unit,0)) AS unit
    FROM Orders
    GROUP BY product_id
    ) AS O
ON P.product_id = O.product_id
WHERE unit >= 100