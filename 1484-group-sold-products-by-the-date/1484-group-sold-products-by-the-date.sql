# Write your MySQL query statement below
-- 팔린 각자 다른 물건의 수와 이름 날짜마다
-- 알파벳순 + sell_date 정렬
select sell_date, 
count(distinct product) as num_sold, 
group_concat(distinct product order by product asc separator ',') as products
from activities
group by sell_date
order by sell_date