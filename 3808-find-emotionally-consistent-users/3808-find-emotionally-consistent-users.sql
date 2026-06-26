-- emotionally consistent users 찾기
--  - 각 유저별 전체 리액션 수 
--  - 5개 이상의 다른 컨텐츠에서 반응
--  - 리액션의 60% 이상이 같은 타입이면 emotionally consistent
--  order by  reaction_ratio desc, user_id
with r as (select user_id,
reaction,
count(reaction) as cnt,
rank() over(partition by user_id order by count(*) desc) rn
from reactions
group by user_id, reaction
)
select r.user_id, r.reaction as dominant_reaction,
ROUND(sum(cnt) / total_cnt,2) as reaction_ratio
from r 
JOIN 
(select user_id, count(*) as total_cnt
from reactions 
group by user_id
having count(*)>=5) a
ON r.user_id = a.user_id
where rn=1
    AND ( cnt/total_cnt >= 0.6 )
group by user_id 
order by  reaction_ratio desc, user_id
