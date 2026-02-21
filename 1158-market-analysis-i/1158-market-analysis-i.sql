# Write your MySQL query statement below
-- 각 유저마다 join 날짜, 2019년에 주문자로써 만든 주문수
select 
u.user_id as buyer_id, 
min(join_date) as join_date,
-- ifnull(count(o.order_date),0) as orders_in_2019
sum(case when year(o.order_date) = 2019 then 1 else 0 end) as orders_in_2019
from users u  
LEFT JOIN orders o
ON o.buyer_id = u.user_id 
group by u.user_id