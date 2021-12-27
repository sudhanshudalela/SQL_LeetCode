# Write your MySQL query statement below

SELECT name AS warehouse_name, SUM(units*Width*Length*Height) AS volume
FROM Warehouse AS W
INNER JOIN Products AS P
ON W.product_id = P.product_id
GROUP BY name
