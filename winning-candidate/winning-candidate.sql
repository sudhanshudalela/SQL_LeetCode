# Write your MySQL query statement below

SELECT name
FROM Candidate AS c
INNER JOIN (
SELECT candidateId, COUNT(*) AS cnt
FROM Vote
GROUP BY candidateId
ORDER BY cnt DESC LIMIT 1) q
ON c.id = q.candidateId