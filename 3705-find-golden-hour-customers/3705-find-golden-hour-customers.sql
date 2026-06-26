-- golden hour customers : 피크시간에 꾸준히 구매하고 높은 만족도를 보임.
-- - 주문건수 3개 이상, 피크시간(11-14, 18-21) 구매 60% 이상, 평균 만족도 4점이상 ROUND(, 2)
-- - 50%이상 만족도 남김
-- order by average_rating desc, customer_id desc
select distinct customer_id,
count(*) as total_orders,
-- hour() : 해당 숫자가 들어간 컬럼은 모두 반환 (시간이 넘어가도)
-- time_format(order_timestamp, '%H:%i')
ROUND(
    sum(Case when ( time_format(order_timestamp, '%H:%i') between '11:00' AND '14:00') OR ( time_format(order_timestamp, '%H:%i') between '18:00' AND '21:00') THEN 1 ELSE 0 END )*100 / count(*) )  peak_hour_percentage,
ROUND(avg(order_rating),2) as average_rating
from restaurant_orders
group by customer_id 
having count(*) >=3 
AND sum(Case when ( time_format(order_timestamp, '%H:%i') between '11:00' AND '14:00') OR ( time_format(order_timestamp, '%H:%i') between '18:00' AND '21:00')  THEN 1 ELSE 0 END ) / count(order_id) >= 0.6 
AND sum(case when order_rating IS NOT NULL THEN 1 ELSE 0 END)*100 / count(*) >=50
AND avg(order_rating) >= 4
order by average_rating desc, customer_id desc
