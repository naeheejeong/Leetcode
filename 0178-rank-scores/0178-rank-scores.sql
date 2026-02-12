# Write your MySQL query statement below
-- 고 -> 낮은 순 점수
-- 타이인 랭킹 잇음
select score,
dense_rank() over(order by score desc) as 'rank'
from scores