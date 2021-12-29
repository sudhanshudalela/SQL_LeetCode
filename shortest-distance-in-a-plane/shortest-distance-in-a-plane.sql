# Write your MySQL query statement below

SELECT MIN(ROUND(SQRT(POWER(P1.x-P2.x,2) + POWER(P1.y-P2.y,2)),2)) AS shortest
FROM Point2D P1
CROSS JOIN Point2D P2
ON P1.x != P2.x OR P1.y != P2.y