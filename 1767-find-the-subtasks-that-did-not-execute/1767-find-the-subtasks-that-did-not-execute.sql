# Write your MySQL query statement below

WITH RECURSIVE cte AS (
    SELECT task_id, 1 AS subtask_id, subtasks_count
    FROM Tasks a
    UNION
    SELECT task_id, subtask_id+1, subtasks_count
    FROM cte
    WHERE subtask_id < subtasks_count)
    
SELECT c.task_id, c.subtask_id
FROM Executed AS E
RIGHT JOIN cte AS c
ON E.task_id = c.task_id AND E.subtask_id = c.subtask_id
WHERE E.subtask_id IS NULL