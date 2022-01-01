# Write your MySQL query statement below

SELECT person_name
FROM (
    SELECT *, SUM(weight) OVER(ORDER BY turn) AS current_weight
    FROM Queue
    ORDER BY turn DESC
    ) Q
WHERE current_weight <= 1000
LIMIT 1