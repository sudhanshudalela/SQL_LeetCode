# Write your MySQL query statement below
SELECT class
FROM (
    SELECT class, COUNT(class) AS count
    FROM Courses
    GROUP BY class
    HAVING count >= 5
) S