# Write your MySQL query statement below

-- 영화에 가장 많이 점수를 매긴 유저 이름 
(
select  u.name as results
from movierating r
JOIN users u on u.user_id = r.user_id
group by r.user_id
order by count(*) desc, u.name
limit 1
)

UNION ALL

(
-- 2020-02에 가장 높은 평균 rate를 받은 영화 이름
select m.title as results
from movierating r 
JOIN movies m on r.movie_id = m.movie_id
where date_format(created_at,'%Y-%m') = '2020-02'
group by r.movie_id
order by avg(r.rating) desc, m.title
limit 1
)