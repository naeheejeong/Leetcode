# Write your MySQL query statement below
-- 중복된 email 구하기 email은 널값이 아님
select email as Email
from person
group by email
having count(email) >1