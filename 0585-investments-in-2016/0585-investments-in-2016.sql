# Write your MySQL query statement below
-- 보험계약자의 2016 투자 총액 : sum tiv_2016 구하기
-- 조건1.tiv_2015가 1명 이상의 다른 보험계약자(pid)와 동일해야함(중복값)
-- 조건2. lat, lon이 고유값으로 존재.
-- tiv_2016 -> 반올림 2자리

with t as (
	select tiv_2015
	from insurance
	group by tiv_2015
	having count(*) >= 2 -- 중복값
	),
l as (
	select lat, lon
	from insurance 
	group by lat, lon
	having count(*) = 1 -- 고유값
	)
select round(sum(tiv_2016),2) as tiv_2016
from insurance i
where i.tiv_2015 IN (select tiv_2015 from t)
AND (i.lat, i.lon) IN (select lat, lon from l)