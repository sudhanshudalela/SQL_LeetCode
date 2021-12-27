# Write your MySQL query statement below

SELECT June.customer_id, June.name
FROM (
    SELECT C.customer_id, name, SUM(price*quantity) AS S
    FROM Customers AS C
    INNER JOIN Orders AS O
    ON C.customer_id = O.customer_id
    INNER JOIN Product AS P
    ON P.product_id = O.product_id
    WHERE order_date LIKE '2020-06-%'
    GROUP BY customer_id
    HAVING S >= 100
    ) June
INNER JOIN (
    SELECT customer_id, name
    FROM (
        SELECT C.customer_id, name, SUM(price*quantity) AS S
        FROM Customers AS C
        INNER JOIN Orders AS O
        ON C.customer_id = O.customer_id
        INNER JOIN Product AS P
        ON P.product_id = O.product_id
        WHERE order_date LIKE '2020-07-%' #OR order_date LIKE '2020-07-%'
        GROUP BY customer_id
        HAVING S >= 100
        ) July
    ) July
ON June.customer_id = July.customer_id AND June.name = July.name