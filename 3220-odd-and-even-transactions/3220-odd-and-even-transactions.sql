# Write your MySQL query statement below
-- 각 날짜별로 홀수 및 짝수 거래 금액의 합계. 홀수 또는 짝수 거래가 없는 경우 0
-- order by transaction_date asc
select transaction_date,
SUM(case when amount%2=1 then amount else 0 END) as odd_sum,
SUM(case when amount%2=0 then amount else 0 END) as even_sum
from transactions
group by transaction_date
order by transaction_date asc
