# Write your MySQL query statement below

SELECT player_id, device_id
FROM (
    SELECT *, RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS r
    FROM Activity
    ) q
WHERE r = 1