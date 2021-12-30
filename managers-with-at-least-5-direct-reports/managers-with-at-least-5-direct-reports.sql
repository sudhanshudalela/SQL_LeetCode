# Write your MySQL query statement below

SELECT DISTINCT name
FROM Employee
WHERE id IN (
SELECT managerId
FROM (
SELECT managerId, COUNT(*) AS c
FROM Employee
GROUP BY managerId
HAVING c >=5
    ) q
    )