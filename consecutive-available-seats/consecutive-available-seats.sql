# Write your MySQL query statement below

SELECT seat_id
FROM (
    SELECT seat_id, free, LAG(free) OVER() AS prev, LEAD(free) OVER() AS next
    FROM Cinema
    ) s
WHERE (free = 1 AND next = 1) OR (free = 1 AND prev = 1)
ORDER BY seat_id