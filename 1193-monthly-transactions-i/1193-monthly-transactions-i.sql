# Write your MySQL query statement below
-- 각 달, 국가마다 업무 수, amount 총합, approve된 업무수 와 그 전체 amount
select date_format(trans_date,'%Y-%m') as month, 
country,
count(id) as trans_count,
sum(case when state = 'approved' then 1 else 0 end) as approved_count,
sum(amount) as trans_total_amount,
sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from transactions
group by date_format(trans_date,'%Y-%m'), country