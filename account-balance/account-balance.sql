# Write your MySQL query statement below

WITH cte AS (
    SELECT account_id, day,
    CASE
        WHEN type = 'Deposit' THEN amount
        ELSE amount*-1
        END AS amount
    FROM Transactions
    )
    
SELECT account_id, day, SUM(amount) OVER(PARTITION BY account_id ORDER BY account_id, day) AS balance
FROM cte
ORDER BY account_id, day