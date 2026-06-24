-- # Write your MySQL query statement below
-- 최근 3회 평가에서 지속적으로 성과가 향상된 직원을 찾는 솔루션을 작성하세요. 
-- 직원은 최소 3회 이상의 평가를 받아야 하며, 최근 3회 평가의 평점이 이전 평가보다 지속적으로 상승해야 합니다. (각 평가가 이전 평가보다 좋아야 함) 
-- 각 직원에 대해 review_date를 기준으로 가장 최근 3개의 평가를 사용하세요. 
-- 향상 점수는 최근 3개 평가 중 가장 최근 평점과 가장 초기 평점의 차이를 계산하여 산출합니다.
WITH a as (select distinct e.employee_id,e.name, review_date, rating,
row_number() over(partition by employee_id order by review_date desc) rn 
from employees e 
JOIN performance_reviews p ON e.employee_id = p.employee_id
) ,
b as (select employee_id, name, review_date,
max(case when rn=1 then rating END) as rating1,
max(case when rn=2 then rating END) as rating2,
max(case when rn=3 then rating END) as rating3
from a 
where rn<=3
group by employee_id 
)
select employee_id, name,
rating1 - rating3 as improvement_score
from b 
where rating1>rating2 AND rating2>rating3 
AND rating1 is not null
AND rating2 is not null
AND rating3 is not null
order by improvement_score desc, name asc