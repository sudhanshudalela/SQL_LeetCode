# Write your MySQL query statement below

WITH cte AS (
    SELECT *, SUM(frequency) OVER(ORDER BY num) as cumsum
    FROM Numbers
    )

SELECT ROUND(AVG(num),1) AS median
FROM cte
WHERE num = (SELECT MIN(num) FROM cte WHERE cumsum = (SELECT SUM(frequency)/2 FROM cte)) OR num = (SELECT MIN(num) FROM cte WHERE cumsum > (SELECT SUM(frequency)/2 FROM cte))