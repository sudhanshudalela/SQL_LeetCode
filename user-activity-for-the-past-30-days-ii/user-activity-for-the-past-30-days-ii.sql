# Write your MySQL query statement below

SELECT IFNULL(ROUND(AVG(count_sessions_per_user),2),0.00) AS average_sessions_per_user
FROM (
SELECT COUNT(DISTINCT session_id) AS count_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY user_id
    ) q