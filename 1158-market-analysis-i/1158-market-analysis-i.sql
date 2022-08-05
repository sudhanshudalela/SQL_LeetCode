# Write your MySQL query statement below

WITH user_summary AS (
    SELECT user_id, join_date, order_date
    FROM Users AS U
    LEFT JOIN Orders AS O
    ON U.user_id = O.buyer_id
    )

SELECT user_id AS buyer_id, join_date, SUM(IF(DATE_FORMAT(order_date, "%Y") = 2019, 1, 0)) AS orders_in_2019
FROM user_summary 
GROUP BY buyer_id
