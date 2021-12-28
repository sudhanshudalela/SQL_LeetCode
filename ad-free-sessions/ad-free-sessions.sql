# Write your MySQL query statement below

SELECT session_id
FROM Playback
WHERE session_id NOT IN (
SELECT DISTINCT session_id
FROM Playback AS P
INNER JOIN Ads AS A
ON P.customer_id = A.customer_id
WHERE timestamp BETWEEN start_time AND end_time
    )