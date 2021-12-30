# Write your MySQL query statement below

SELECT actor_id, director_id
FROM (
    SELECT actor_id, director_id, count(*) AS c
    FROM ActorDirector
    GROUP BY actor_id, director_id
    HAVING c >= 3
    ) q