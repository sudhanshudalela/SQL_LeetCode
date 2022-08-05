# Write your MySQL query statement below
  
SELECT request_at AS Day, ROUND(SUM(IF(status = 'completed', 0, 1))/COUNT(*),2) AS 'Cancellation Rate'
FROM Trips
WHERE client_id IN (SELECT users_id FROM users WHERE banned = 'No') 
AND driver_id IN (SELECT users_id FROM users WHERE banned = 'No')
AND request_at BETWEEN '2013-10-01' and '2013-10-03'
GROUP BY Day