# Write your MySQL query statement below

SELECT student_id, course_id, grade
FROM (
    SELECT *, DENSE_RANK() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id) AS rk
    FROM Enrollments
    ) E
WHERE rk = 1
ORDER BY student_id
