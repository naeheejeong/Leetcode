# Write your MySQL query statement below
-- 각 프로젝트별 노동자들의 평균 경력연도, 2자리수 반올림
select p.project_id,
round(sum(e.experience_years) / count(p.employee_id) ,2) as average_years
from project p 
JOIN employee e on p.employee_id = e.employee_id
group by p.project_id 