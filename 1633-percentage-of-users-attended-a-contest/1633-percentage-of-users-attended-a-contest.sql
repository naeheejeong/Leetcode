# Write your MySQL query statement below
-- 대회에 등록한 유저 퍼센테이지를 2자리 반올림
-- percentage desc , 동점일경우 contest_id
select 
contest_id, 
round(count(distinct user_id) * 100 /(select count(user_id) from Users) ,2) as percentage
from  Register
group by contest_id
order by percentage desc,contest_id