# Write your MySQL query statement below

WITH cte AS (
    SELECT quantity, I.item_category, DAYNAME(order_date) AS day
    FROM Orders AS O
    RIGHT JOIN Items AS I
    ON O.item_id = I.item_id
    )
    
#SELECT day, item_category, SUM(quantity) AS units
#FROM cte
#GROUP BY day, item_category

SELECT item_category AS category,
SUM(IF(day = 'Monday', quantity, 0)) AS Monday,
SUM(IF(day = 'Tuesday', quantity, 0)) AS Tuesday,
SUM(IF(day = 'Wednesday', quantity, 0)) AS Wednesday,
SUM(IF(day = 'Thursday', quantity, 0)) AS Thursday,
SUM(IF(day = 'Friday', quantity, 0)) AS Friday,
SUM(IF(day = 'Saturday', quantity, 0)) AS Saturday,
SUM(IF(day = 'Sunday', quantity, 0)) AS Sunday
FROM cte
GROUP BY item_category
ORDER BY item_category