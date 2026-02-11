# Write your MySQL query statement below
-- quaility : rating+position avg
-- poor query percentage :rating 3보다 작을때
-- querty name, quality, poor query percentage / 2자리수 반올림
select  query_name,
round(sum(rating / position ) / count(query_name),2) as quality,
round(sum(case when rating < 3 then 1 else 0 end ) / count(rating) * 100 ,2) as poor_query_percentage  
from Queries
group by query_name