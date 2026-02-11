-- 적어도 5개 다이렉트 리포트 매니저 찾기
select e1.name
from employee e1
join employee e2 on e1.id = e2.managerId
group by e2.managerId
having count(*)>=5