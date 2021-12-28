# Write your MySQL query statement below

SELECT DISTINCT user_id
FROM (
    SELECT user_id, LEAD(time_stamp) OVER(PARTITION BY user_id ORDER BY time_stamp) - time_stamp AS d
    FROM Confirmations
    ) Q
WHERE d <= 1000000