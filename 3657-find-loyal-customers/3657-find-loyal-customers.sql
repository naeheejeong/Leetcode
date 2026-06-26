-- loyal customer 찾기
-- 3개 이상 구매 이력, 30일 이상 active , 환급율 20% 이하
-- 환급율 = refund 거래 수/전체 거래수 (구매+환급)
-- order by customer_id asc
WITH a as (select distinct customer_id,
max(transaction_date) as max_date,
min(transaction_date) as min_date,
-- timestampdiff('day', 시작날짜, 끝나는 날짜),
-- timestampdiff('day', min(transaction_date), max(transaction_date) )
SUM(case when transaction_type = 'refund' THEN 1 ELSE 0 END ) / COUNT(transaction_id)  as refund_rate
from customer_transactions 
group by customer_id
having count(*)>=3
)
select customer_id
from a 
where refund_rate < 0.2 AND datediff(max_date, min_date) >=30
