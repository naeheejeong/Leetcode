# Write your MySQL query statement below
-- 아무것도 안시킨 customer 를 찾으세요
select name as Customers
from customers c
left join orders o on c.id = o.customerId
where o.id is null