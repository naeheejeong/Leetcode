# Write your MySQL query statement below
-- 취소율 = 차단되지 않은 사용자가 포함된 요청 중 취소된 요청(고객 또는 운전자 기준) 수  / 전체 요청 수
-- 2013년 10월 1일부터 2013년 10월 3일까지 매일 최소 한 건 이상의 운행이 기록된, 차단되지 않은 사용자(고객과 운전자 모두 차단되지 않은 상태)의 요청 취소율 구하기. 취소율은 소수점 둘째 자리까지 반올림하세요.
select request_at as 'Day', 
ROUND(
    SUM(case when status <> 'completed' THEN 1 ELSE 0 END) / COUNT(*)
 ,2) as 'Cancellation Rate'
from trips t 
JOIN users u1 ON u1.users_id = t.client_id
JOIN users u2 ON u2.users_id = t.driver_id  
where u1.banned = 'No' AND u2.banned = 'No'
AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
group by request_at
