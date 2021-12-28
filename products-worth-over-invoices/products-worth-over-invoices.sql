# Write your MySQL query statement below

SELECT name, IFNULL(SUM(rest),0) AS rest, IFNULL(SUM(paid),0) AS paid, IFNULL(SUM(canceled),0) AS canceled, IFNULL(SUM(refunded),0) AS refunded
FROM Product AS P
LEFT JOIN Invoice AS I
ON P.product_id = I.product_id
GROUP BY name
ORDER BY name