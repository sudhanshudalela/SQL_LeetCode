# Write your MySQL query statement below

SELECT MIN(dif) AS shortest
FROM
    (
    SELECT nxt - x AS dif
    FROM (
        SELECT x, LEAD(x) OVER() AS nxt
        FROM Point 
        ORDER BY x
        ) q
    ORDER BY dif
    ) q1