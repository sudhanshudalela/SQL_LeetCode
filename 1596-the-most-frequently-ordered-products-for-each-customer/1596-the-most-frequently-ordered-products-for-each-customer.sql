# Write your MySQL query statement below

WITH cte AS (
    SELECT O.customer_id, O.product_id, P.product_name
    FROM Orders AS O
    LEFT JOIN Products AS P
    ON O.product_id = P.product_id
    )

SELECT customer_id, product_id, product_name
FROM (
    SELECT *, DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY c DESC) AS rk
    FROM(
        SELECT *, COUNT(*) AS c
        FROM cte
        GROUP BY customer_id, product_id
        ) q
    ) q1
WHERE rk = 1