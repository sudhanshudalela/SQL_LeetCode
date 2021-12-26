# Write your MySQL query statement below

SELECT name, BALANCE
FROM Users AS U
INNER JOIN (
    SELECT account, SUM(amount) AS BALANCE
    FROM Transactions
    GROUP BY account
    ) T
ON T.account = U.account
WHERE BALANCE > 10000