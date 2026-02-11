# Write your MySQL query statement below
-- 300만 키로 이상 or 250만명 이상 
select name, population, area
from world
where population>=25000000 OR area>=3000000