# Write your MySQL query statement below
-- 적어도 100개 유닛을 가진 상품 이름 2020년 2월에 / 그 amount
select p.product_name, sum(unit) as unit
from orders o 
JOIN products p on o.product_id = p.product_id 
where order_date LIKE '2020-02%' 
group by o.product_id
having sum(unit) >= 100
