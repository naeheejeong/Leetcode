# Write your MySQL query statement below
-- 첫문자 -> 대문자로, 나머지-> 소문자로 ; order by user_id
select user_id,
CONCAT(UPPER(substring(name,1,1)),LOWER(substring(name,2))) as name
from users
order by user_id