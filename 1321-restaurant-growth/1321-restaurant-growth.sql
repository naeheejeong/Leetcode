
-- 1. 날짜별 총 매출 만들기 
with s as (select visited_on, sum(amount) as amount
from customer
group by visited_on
),
-- 2. 날짜별 매출(s)에 대해 7일 이동평균 : 7일이 꽉찼을때 부터 출력
final as (select visited_on, 
SUM(amount) OVER (
  ORDER BY visited_on
  ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) as amount,
ROUND(AVG(amount) OVER (
  ORDER BY visited_on
  ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
)
,2) as average_amount,
row_number() over(order by visited_on) as rn
from s
)
select visited_on, amount, average_amount 
from final
where rn>=7
order by visited_on