# Write your MySQL query statement below
-- 유효한 이메일 주소를 가진 사용자 
-- 문자로 시작해야하고 / 도메인 '@leetcode.com'
select user_id, name, mail
from users
where mail regexp '^[A-Za-z][A-Za-z0-9._-]*@leetcode\.com$'
AND mail LIKE BINARY '%@leetcode.com'