# Write your MySQL query statement below

SELECT name, IFNULL(distance,0) AS travelled_distance
FROM Users AS U
LEFT JOIN (
    SELECT user_id, SUM(distance) AS distance
    FROM Rides
    GROUP BY user_id
    ) R
ON U.id = R.user_id
ORDER BY travelled_distance DESC, name
