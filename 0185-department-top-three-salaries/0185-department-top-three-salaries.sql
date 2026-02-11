# Write your MySQL query statement below
-- 부서에서 가장 많이 버는 사람 = top 3 unique salaries 를 가진 사람
-- 각 부서의 high earners, any order
with f as (select d.name as Department, 
e.name as Employee, 
e.salary as Salary,
dense_rank() over(partition by d.name order by e.salary desc) rn
from employee e 
LEFT JOIN department d on d.id = e.departmentId 
)
select department, employee, salary
from f
where rn<=3
