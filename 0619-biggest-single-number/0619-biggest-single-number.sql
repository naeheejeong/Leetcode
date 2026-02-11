# Write your MySQL query statement below
-- 가장큰 single number 한번이라도 테이ㅣ블에 잇으면 됨 

select max(num) as num
from mynumbers
where num IN
(
select num
from mynumbers
group by num
having count(num)=1
)