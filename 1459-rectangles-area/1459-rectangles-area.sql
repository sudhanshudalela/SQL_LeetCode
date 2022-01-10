# Write your MySQL query statement below

SELECT A.id AS p1, B.id AS p2, ABS((A.x_value - B.x_value) * (A.y_value - B.y_value)) AS area
FROM Points AS A
INNER JOIN Points AS B
ON (A.x_value - B.x_value) * (A.y_value - B.y_value) != 0 AND A.id < B.id
ORDER BY area DESC, p1, p2
