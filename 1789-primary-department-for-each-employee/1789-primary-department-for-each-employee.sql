# Write your MySQL query statement below
-- 오직 한 부서에만 속해있으면 - N
-- 그들의 primary department 를 찾아서 보고하셈
select employee_id, department_id
from employee
where employee_id IN
    (select employee_id
    from employee
    group by employee_id
    having count(department_id) < 2     
    )
    OR primary_flag = 'Y'