# Write your MySQL query statement below

WITH cte AS (
SELECT *
FROM Friendship AS F
INNER JOIN Likes AS L
ON F.user2_id = L.user_id
WHERE user1_id = 1
UNION ALL
SELECT *
FROM Friendship AS F
INNER JOIN Likes AS L
ON F.user1_id = L.user_id
WHERE user2_id = 1
)

SELECT DISTINCT page_id AS recommended_page
FROM cte
WHERE page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1)