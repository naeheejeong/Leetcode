-- 이탈 위험 고객 찾기
-- - 마지막 이벤트가 : active subscription 
-- - 구독 기록에서 downgrade가 1 이상
-- - 현재 구독액 <= 기록 상 maximum plan revenue * 0.5
-- - 60일 이상 구독자
-- order by days_as_subscriber desc, user_id asc

WITH m as (select user_id, max(event_date), 
max(monthly_amount) as max_amount,
SUM(case when event_type = 'downgrade' THEN 1 ELSE 0 END) downgrade_cnt,
datediff(max(event_date), min(event_date)) days
from subscription_events
group by user_id
),
r as (select *, row_number() over(partition by user_id order by event_date desc) rn
from subscription_events
)
select m.user_id, 
plan_name as current_plan, 
monthly_amount as current_monthly_amount, 
max_amount as max_historical_amount,
days as days_as_subscriber
from m
JOIN r ON m.user_id = r.user_id 
where rn=1 AND r.event_type <> 'cancel'
AND downgrade_cnt >=1 
AND monthly_amount / max_amount <= 0.5
AND days>=60
group by user_id
order by days_as_subscriber desc, user_id asc
