# Write your MySQL query statement below

WITH cte AS (
    SELECT C.country_id, country_name, avg_temp
    FROM (
        SELECT country_id, AVG(weather_state) AS avg_temp
        FROM (
            SELECT *
            FROM Weather
            WHERE day LIKE '2019-11%'
            ) q
        GROUP BY country_id
        ) T
    INNER JOIN Countries AS C
    ON T.country_id = C.country_id
    )

SELECT country_name,
CASE
    WHEN cte.avg_temp <= 15 THEN 'Cold'
    WHEN cte.avg_temp >= 25 THEN 'Hot'
    ELSE 'Warm'
END AS weather_type
FROM cte