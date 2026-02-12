# Write your MySQL query statement below
-- 주소 없으면 null 
select firstName, lastName, ifnull(city,null) as city, ifnull(state,null) as state
from person p
left JOIN address a on p.personId = a.personId 