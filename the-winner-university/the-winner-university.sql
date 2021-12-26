# Write your MySQL query statement below

SELECT
CASE
    WHEN (SELECT COUNT(*) AS count_NY FROM NewYork WHERE score >= 90) > (SELECT COUNT(*) AS count_CA FROM California WHERE score >= 90) THEN 'New York University'
    WHEN (SELECT COUNT(*) AS count_NY FROM NewYork WHERE score >= 90) < (SELECT COUNT(*) AS count_CA FROM California WHERE score >= 90) THEN 'California University'
    ELSE 'No Winner'
END AS winner