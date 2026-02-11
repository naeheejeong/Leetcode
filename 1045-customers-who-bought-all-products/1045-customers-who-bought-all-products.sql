# Write your MySQL query statement below
-- 숫자가 맞는게  포인트 !! -> count()
-- 고객별 "고유한" 상품수 = product 개수
select customer_id
from customer
group by customer_id 
having count(distinct product_key) =
(select count(product_key)
from product)