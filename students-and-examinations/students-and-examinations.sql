# Write your MySQL query statement below

with cte as
(select s.student_id ,
s.student_name ,
su.subject_name
from Students s cross join subjects su)

select c.student_id, c.student_name, c.subject_name, count(e.subject_name) attended_exams
from cte c left join examinations e on c.student_id = e.student_id and c.subject_name = e.subject_name
group by c.student_id, c.student_name, c.subject_name
order by 1,2