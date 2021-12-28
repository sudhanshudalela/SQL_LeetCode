# Write your MySQL query statement below

SELECT problem_id
FROM Problems
WHERE 100*likes/(likes+dislikes) < 60
ORDER BY problem_id