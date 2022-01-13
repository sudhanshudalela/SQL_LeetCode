# Write your MySQL query statement below

WITH cte AS (
    SELECT *, DATE_FORMAT(trans_date, '%Y-%m') AS month
    FROM Transactions
)

SELECT DISTINCT month, country, COUNT(*) OVER(PARTITION BY month, country) AS trans_count, SUM(IF(state = 'approved', 1, 0)) OVER(PARTITION BY month, country) AS approved_count,
SUM(amount) OVER(PARTITION BY month, country) AS trans_total_amount, SUM(IF(state = 'approved', amount, 0)) OVER(PARTITION BY month, country) AS approved_total_amount
FROM cte