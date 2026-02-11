# Write your MySQL query statement below
-- 키로수 초과하기전의 마지막 사람 이름을 구하세요 : 1000kg 이상이면 x 
-- 누적합 구하고 -> 필터링 1000

with bus as (select *,
sum(weight) over(order by turn) as total_weight
from queue
)
select person_name
from bus
where total_weight<=1000
order by total_weight desc
limit 1