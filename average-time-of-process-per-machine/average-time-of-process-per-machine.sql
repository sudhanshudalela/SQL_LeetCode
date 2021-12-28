# Write your MySQL query statement below

SELECT machine_id, ROUND(AVG(end_time - start_time),3) AS processing_time
FROM (
    SELECT S.machine_id, S.process_id, start_time, end_time 
    FROM (
        SELECT machine_id, process_id, timestamp AS start_time
        FROM Activity
        WHERE activity_type = 'start'
        ) S
    INNER JOIN (
        SELECT machine_id, process_id, timestamp AS end_time
        FROM Activity
        WHERE activity_type = 'end'
        ) E
    ON S.machine_id = E.machine_id AND S.process_id = E.process_id
    ) q
GROUP BY machine_id