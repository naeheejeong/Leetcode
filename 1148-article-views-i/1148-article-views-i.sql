# Write your MySQL query statement below
-- 적어도 한명이 작가가 본인 아티클을 봤음. id asc 정렬
select distinct author_id as id 
from views
where viewer_id = author_id 
order by id