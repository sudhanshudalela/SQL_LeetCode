SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num, LEAD(num,1) OVER() AS next, LAG(num,1) OVER() AS prev
    FROM Logs
    ) sq
WHERE sq.num = sq.next AND sq.num = sq.prev