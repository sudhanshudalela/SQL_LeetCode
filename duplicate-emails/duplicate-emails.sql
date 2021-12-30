# Write your MySQL query statement below
SELECT Email FROM
(SELECT Email, COUNT(Email) AS Ct
FROM Person
GROUP BY Email) AS count_subquery
WHERE Ct > 1