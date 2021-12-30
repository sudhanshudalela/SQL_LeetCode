# Write your MySQL query statement below

SELECT employee_id, cnt AS team_size
FROM (
    SELECT *
    FROM Employee
    ) AS q1
LEFT JOIN (
    SELECT *
    FROM (
        SELECT team_id, COUNT(*) AS cnt
        FROM Employee
        GROUP BY team_id
        ) q
    ) q2
ON q1.team_id = q2.team_id