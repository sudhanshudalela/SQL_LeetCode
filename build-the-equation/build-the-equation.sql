# Write your MySQL query statement below

WITH Sign AS (
    SELECT power,
    CASE
        WHEN factor > 0 THEN CONCAT('+',factor)
        WHEN factor = 0 THEN NULL
        ELSE factor
    END AS factor
    FROM Terms
)

SELECT CONCAT(equation,'=0') AS equation
FROM (
    SELECT GROUP_CONCAT(equation ORDER BY power DESC SEPARATOR '') AS equation
    FROM (
        SELECT power,
        CASE
            WHEN power = 1 THEN CONCAT(factor,'X')
            WHEN power = 0 THEN factor
            ELSE CONCAT(factor,'X','^',power)
        END AS equation
        FROM Sign
        ) q
    ) q1