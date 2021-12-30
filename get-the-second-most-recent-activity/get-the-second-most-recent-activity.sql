# Write your MySQL query statement below

SELECT username, activity, startDate, endDate
FROM (
    SELECT  *, DENSE_RANK() OVER(PARTITION BY username ORDER BY startDate DESC) AS r
    FROM UserActivity
    ) q
WHERE r = 2 OR username IN (
    SELECT username
    FROM (
        SELECT username, COUNT(*) AS c
        FROM UserActivity
        GROUP BY username
        HAVING c = 1
        ) users_1_entry
    )
