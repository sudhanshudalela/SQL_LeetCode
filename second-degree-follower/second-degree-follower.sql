# Write your MySQL query statement below


SELECT followee AS follower, COUNT(*) AS num
FROM Follow
WHERE followee IN (
    SELECT F1.name
    FROM (
        SELECT DISTINCT followee AS name
        FROM Follow
        ) F1
    INNER JOIN (
        SELECT DISTINCT follower AS name
        FROM Follow
        ) F2
    ON F1.name = F2.name
    )
GROUP BY followee
ORDER BY followee
