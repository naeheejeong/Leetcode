# Write your MySQL query statement below
-- 유저별 프롬프트 전체 수, 평균 사용 토큰 수 2자리수
-- 적어도 3개의 프롬프트를 제출한 유저들, 평균 토큰 사용 수 보다 적어도 하나는 크게 사용한 유저들
-- order by average tokens desc, user_id asc
select user_id, count(prompt) as prompt_count, round(avg(tokens),2) as avg_tokens 
from prompts
group by user_id
having count(prompt)>2 
AND max(tokens) > avg(tokens)
order by 3 desc, user_id asc
