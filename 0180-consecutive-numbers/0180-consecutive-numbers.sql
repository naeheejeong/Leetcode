# Write your MySQL query statement below
-- 3번 연속으로 나오는 숫자 찾기
with n as (select num,
lag(num,1) over() as two,
lag(num,2) over() as three
from logs 
)
select distinct num as ConsecutiveNums
from n
where num = two AND num = three