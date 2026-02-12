# Write your MySQL query statement below
-- 유저별 첫 로그인날짜
select player_id, min(event_date) as first_login
from activity 
group by player_id