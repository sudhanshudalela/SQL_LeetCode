# Write your MySQL query statement below
SELECT W1.Id AS Id
FROM Weather W1
JOIN Weather W2
ON DATEDIFF(W1.recordDate, W2.recordDate) = 1
WHERE W1.Temperature > W2.Temperature