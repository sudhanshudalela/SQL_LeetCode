# Write your MySQL query statement below

WITH cte AS (
    SELECT stock_name, operation_day,
    CASE
        WHEN operation = 'buy' THEN price*-1
        ELSE price
        END AS price
    FROM Stocks
    )
    
SELECT stock_name, capital_gain_loss
FROM (
    SELECT stock_name, SUM(price) OVER(PARTITION BY stock_name ORDER BY operation_day) AS capital_gain_loss, DENSE_RANK() OVER(PARTITION BY stock_name ORDER BY operation_day DESC) AS rk
    FROM cte
    ) Q
WHERE rk = 1