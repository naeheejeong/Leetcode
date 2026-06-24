-- 상반기와 하반기의 평균 연비를 비교하여 연비가 향상된 운전자를 찾는 솔루션을 작성하세요. 
-- 각 운행의 연비 =  주행 거리(km)를 연료 소비량(fuel_consumed)으로 나누어 계산합니다. 
-- 상반기는 1월부터 6월까지, 하반기는 7월부터 12월까지입니다. 
-- 상반기와 하반기 모두 운행 기록이 있는 운전자만 포함하세요. 
-- 연비 향상률 = (하반기 평균값 - 상반기 평균값) / ROUND(,2)


WITH a as (SELECT t.driver_id, d.driver_name,
AVG(case when MONTH(trip_date) BETWEEN 1 AND 6 THEN distance_km / fuel_consumed END)  avg_km_1,
avg(case when MONTH(trip_date) BETWEEN 7 AND 12 THEN distance_km/ fuel_consumed END)  avg_km_2
FROM drivers d
JOIN trips t ON d.driver_id = t.driver_id
group by t.driver_id, driver_name
)
select driver_id, driver_name, 
ROUND(avg_km_1,2) as first_half_avg ,
ROUND(avg_km_2,2) as second_half_avg ,
ROUND(avg_km_2 - avg_km_1 , 2) as efficiency_improvement
from a 
WHERE avg_km_1 IS NOT NULL AND avg_km_2 IS NOT NULL 
AND avg_km_2 - avg_km_1  > 0 
order by efficiency_improvement desc, driver_name