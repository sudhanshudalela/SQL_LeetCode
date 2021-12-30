# Write your MySQL query statement below

SELECT  product_id, ROUND(SUM(total_price)/SUM(units),2) AS average_price
FROM (
SELECT P.product_id, price*units AS total_price, units
FROM Prices AS P
LEFT JOIN UnitsSold AS U
ON P.product_id = U.product_id
WHERE U.purchase_date BETWEEN start_date AND end_date
    ) q
GROUP BY product_id