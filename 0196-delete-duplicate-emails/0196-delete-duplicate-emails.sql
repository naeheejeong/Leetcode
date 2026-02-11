# Write your MySQL query statement below
-- smallest id 를 가진 유니크 이메일만 남기고 중복 삭제
delete p2
from person p1 
join person p2 
on  p1.email=p2.email
AND p1.id<p2.id