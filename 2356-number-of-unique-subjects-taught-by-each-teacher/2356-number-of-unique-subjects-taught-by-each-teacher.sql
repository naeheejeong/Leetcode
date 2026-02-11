# Write your MySQL query statement below
-- 각 선생별 특이한 과목의 수 
select teacher_id, count(distinct subject_id) as cnt
from teacher
group by teacher_id