# Write your MySQL query statement below
-- 보너스 < 1000 이거나 보너스를 못받은 employee 의 name, bonus_amount
select name, bonus
from employee e left join bonus b on e.empId = b.empId
where bonus is null OR bonus < 1000