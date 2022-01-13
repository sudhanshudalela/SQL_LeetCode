# Write your MySQL query statement below

WITH cte AS (
    SELECT left_operand, operator, right_operand, V1.value AS lo, V2.value AS ro
    FROM Expressions AS E
    INNER JOIN Variables AS V1
    ON V1.name = E.left_operand
    INNER JOIN Variables AS V2
    ON V2.name = E.right_operand
    )
    
SELECT left_operand, operator, right_operand,
CASE
    WHEN operator = '=' THEN IF(lo = ro, 'true', 'false')
    WHEN operator = '>' THEN IF(lo > ro, 'true', 'false')
    WHEN operator = '<' THEN IF(lo < ro, 'true', 'false')
    END AS value
FROM cte