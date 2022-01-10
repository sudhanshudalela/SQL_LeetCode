# Write your MySQL query statement below

WITH cte AS (
    SELECT slam, COUNT(*) AS c
    FROM (
        SELECT Wimbledon AS slam
        FROM Championships
        UNION ALL
        SELECT Fr_open AS slam
        FROM Championships
        UNION ALL
        SELECT US_open AS slam
        FROM Championships
        UNION ALL
        SELECT Au_open AS slam
        FROM Championships
        ) q
    GROUP BY slam
    )

SELECT player_id, player_name, c AS grand_slams_count
FROM Players AS P
INNER JOIN cte AS c
ON P.player_id = c.slam
