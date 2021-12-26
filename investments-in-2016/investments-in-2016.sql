# Write your MySQL query statement below

SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM (
        SELECT tiv_2015, COUNT(*) AS c
        FROM Insurance
        GROUP BY tiv_2015
        HAVING c > 1
        ) dup_tiv_2015
    ) AND lat IN (
    SELECT lat
    FROM (
        SELECT lat, lon, COUNT(*) AS c
        FROM Insurance
        GROUP BY lat, lon
        HAVING c = 1
        ) lat1
    ) AND lon IN (
    SELECT lon
    FROM (
        SELECT lat, lon, COUNT(*) AS c
        FROM Insurance
        GROUP BY lat, lon
        HAVING c = 1
        ) lon1
    )