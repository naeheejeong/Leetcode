# Write your MySQL query statement below
-- 가장 높은 연봉을 가진 직원 찾기
-- max() 가 아니라 '중복값' 을 가진 employee name을 찾았어야 함. -> IN ( ) subquery 사용 
select d.name as Department, e.name as Employee, e.salary as Salary
from employee e 
JOIN department d 
on e.departmentId=d.id
where (e.departmentId, e.salary) IN 
    (
    select departmentId, max(e.salary)
    from employee e 
    group by departmentId
    )