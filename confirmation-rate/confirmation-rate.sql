# Write your MySQL query statement below


WITH cte AS (
    SELECT S.user_id, S.time_stamp AS signup_time, C.time_stamp AS action_time, action
    FROM Signups AS S
    LEFT JOIN Confirmations AS C
    ON S.user_id = C.user_id
    )
    
SELECT user_id, IFNULL(ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END)/(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) + SUM(CASE WHEN action = 'timeout' THEN 1 ELSE 0 END)),2),0)
AS confirmation_rate
FROM cte
GROUP BY user_id