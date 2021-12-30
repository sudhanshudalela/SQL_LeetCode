# Write your MySQL query statement below

SELECT COUNT(*) AS rich_count
FROM (
    SELECT *, SUM(IF(amount > 500, 1, 0)) AS cnt
    FROM Store
    GROUP BY customer_id
    ) q
WHERE cnt > 0