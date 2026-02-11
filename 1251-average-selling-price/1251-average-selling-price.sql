# Write your MySQL query statement below
-- 각 제품별 평균 판매가 구하기 : round( 2자리수 ) 
-- 안팔린 제품은 0으로 대체
select p.product_id,
ifnull(round(sum(price*units) / sum(units) , 2),0) as average_price
from prices p 
left join unitsSold s 
on p.product_id = s.product_id
AND s.purchase_date between p.start_date and p.end_date
group by p.product_id 