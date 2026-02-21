# Write your MySQL query statement below
-- 트리의 각 노드는 다음 세 가지 유형 중 하나일 수 있습니다.
-- "리프" : 해당 노드가 리프 노드인 경우.
-- "루트" : 해당 노드가 트리의 루트인 경우.
-- "내부" : 해당 노드가 리프 노드도 아니고 루트 노드도 아닌 경우.
-- 트리의 각 노드 유형을 출력하는 솔루션을 작성하세요.
-- 결과 테이블을 어떤 순서 로든 반환합니다 .
-- id = 내번호, p_id = 내부모id
select id,
case when p_id is null then 'Root'
when id IN (select p_id from tree where id is not null ) then 'Inner'
else 'Leaf' end as type 
from tree