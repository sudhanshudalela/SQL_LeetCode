# Write your MySQL query statement below

SELECT sale_date, apples_sold-oranges_sold AS diff
FROM (
    SELECT A.sale_date, A.sold_num AS apples_sold, O.sold_num AS oranges_sold
    FROM (
        SELECT *
        FROM Sales
        WHERE fruit = 'apples'
        ) A
    INNER JOIN (
        SELECT *
        FROM Sales
        WHERE fruit = 'oranges'
        ) O
    ON A.sale_date = O.sale_date
) F