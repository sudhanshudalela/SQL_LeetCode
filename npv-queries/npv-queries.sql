# Write your MySQL query statement below

SELECT Q.id, Q.year, IFNULL(npv,0) AS npv
FROM Queries AS Q
LEFT JOIN NPV AS N
ON Q.id = N.id AND Q.year = N.year