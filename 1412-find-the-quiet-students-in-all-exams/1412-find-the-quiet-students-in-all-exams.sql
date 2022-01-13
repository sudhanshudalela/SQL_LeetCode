# Write your MySQL query statement below

WITH cte AS (
    SELECT *, MAX(score) OVER(PARTITION BY exam_id) AS ma, MIN(score) OVER(PARTITION BY exam_id) AS mi
    FROM Exam
)

SELECT q1.student_id, student_name
FROM (
    SELECT DISTINCT student_id
    FROM cte
    WHERE score != ma AND score != mi AND student_id NOT IN (SELECT student_id FROM cte WHERE score = ma OR score = mi)
    ) q1
INNER JOIN Student AS S
ON q1.student_id = S.student_id
