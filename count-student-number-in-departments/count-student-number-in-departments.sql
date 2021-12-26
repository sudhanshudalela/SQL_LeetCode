# Write your MySQL query statement below

SELECT dept_name, IFNULL(c,0) AS student_number
FROM Department AS D
LEFT JOIN (
    SELECT dept_id, COUNT(student_id) AS c
    FROM Student
    GROUP BY dept_id
    ) S
ON S.dept_id = D.dept_id
ORDER BY student_number DESC, dept_name