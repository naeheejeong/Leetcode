# Write your MySQL query statement below
-- 가장 주문을 많이한 고객의 수 
select customer_number
from orders
group by customer_number
order by count(customer_number) desc
limit 1 