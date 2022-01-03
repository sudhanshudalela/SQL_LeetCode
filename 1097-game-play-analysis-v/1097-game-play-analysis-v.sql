# Write your MySQL query statement below

# Write your MySQL query statement below

SELECT L1.install_dt, installs, ROUND(IFNULL(retention,0)/installs,2) AS Day1_retention
FROM (
    SELECT install_dt, COUNT(*) AS installs
    FROM (
        SELECT event_date AS install_dt, DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS rk
        FROM Activity
        ) Q1
    WHERE rk = 1
    GROUP BY install_dt
    ) L1
LEFT JOIN (
    SELECT install_dt, COUNT(*) AS retention
    FROM (
        SELECT player_id, event_date AS install_dt, DATEDIFF(LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date), event_date) AS d,
        DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS rk
        FROM Activity
        ) Q2
    WHERE d = 1 AND rk = 1
    GROUP BY install_dt
    ) L2
ON L1.install_dt = L2.install_dt
ORDER BY install_dt