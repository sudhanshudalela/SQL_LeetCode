# Write your MySQL query statement below

with cte AS (
    SELECT departure_airport AS airport_id, flights_count
    FROM Flights
    UNION ALL
    SELECT arrival_airport AS airport_id, flights_count
    FROM Flights
    )

SELECT airport_id
FROM (
    SELECT airport_id, SUM(flights_count) AS counts
    FROM cte
    GROUP BY airport_id
    ORDER BY counts DESC
    ) q
WHERE counts = (
    SELECT SUM(flights_count) AS counts
    FROM cte
    GROUP BY airport_id
    ORDER BY counts DESC
    LIMIT 1
    )