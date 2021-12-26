# Write your MySQL query statement below

SELECT f AS id, COUNT(*) as num
FROM (
    SELECT requester_id AS f
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS f
    FROM RequestAccepted
    ) q
GROUP BY id
ORDER BY num DESC
LIMIT 1