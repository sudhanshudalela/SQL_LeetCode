# Write your MySQL query statement below

WITH cte AS (
    SELECT id, C.name
    FROM (
        SELECT id, name, SUBSTRING(phone_number,1,3) AS country_code
        FROM Person
        ) P
    INNER JOIN Country AS C
    ON P.country_code = C.country_code
    )
    
SELECT name AS country
FROM (
    SELECT name, AVG(duration) AS d
    FROM (
        SELECT duration, name
        FROM cte
        INNER JOIN Calls AS C
        ON C.caller_id = cte.id OR C.callee_id = cte.id
        ) q
    GROUP BY name
    ) q1
WHERE d > (SELECT AVG(duration) FROM Calls)