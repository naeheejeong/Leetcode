# Write your MySQL query statement below
-- 5명 학생을 가진 수업 
select class
from courses
group by class
having count(student)>=5