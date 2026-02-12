# Write your MySQL query statement below
-- 매니저보다 더 많이 버는 직원 구하기
select e.name as Employee
from employee m 
JOIN employee e 
on m.id = e.managerId
where m.salary < e.salary