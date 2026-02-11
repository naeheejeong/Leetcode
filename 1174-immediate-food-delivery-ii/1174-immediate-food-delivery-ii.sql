# Write your MySQL query statement below
-- If the customer's preferred delivery date = order date -> immediate; otherwise -> scheduled.
-- 고객의 첫 주문 
-- first오더 중에 immediate 오더의 percentage, round( ,2)
with first_order as (select *,
row_number() over(partition by customer_id order by order_date) as rn,
case when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' end as status
from delivery
)
select 
round(sum(case when status = 'immediate' then 1 else 0 end ) / count(status) * 100,2) as immediate_percentage
from first_order
where rn = 1