# Write your MySQL query statement below
-- 적어도 1명의 직원을 가진 직원을 매니저로 
-- 매니저 id, 이름, 직속부하 수, 평균나이 /최대한 정수로 반올림
-- order by employee_id
select e1.employee_id, e1.name,
count(e2.name) as reports_count,
round(avg(e2.age)) as average_age
from employees e1 -- 매니저 정보
join employees e2 -- 부하 정보
on e1.employee_id = e2.reports_to
group by e1.employee_id
order by e1.employee_id