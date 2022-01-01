# Write your MySQL query statement below

SELECT business_id
FROM (
    SELECT business_id, COUNT(*) AS c
    FROM (
        SELECT *, AVG(occurences) OVER(PARTITION BY event_type) AS avg_occ
        FROM Events
        ) Q
    WHERE occurences > avg_occ
    GROUP BY business_id
    HAVING c > 1
    ) Q1