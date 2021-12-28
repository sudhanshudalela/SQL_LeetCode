# Write your MySQL query statement below

SELECT user_id, time_stamp AS last_stamp
FROM (
    SELECT *, DENSE_RANK() OVER(PARTITION BY user_id ORDER BY time_stamp DESC) AS rk
    FROM Logins
    WHERE time_stamp LIKE '2020%'
    ) q
WHERE rk = 1