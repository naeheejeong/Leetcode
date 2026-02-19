# Write your MySQL query statement below
-- 현재 대출 중이지만 반납되지 않은 책 중에서 도서관 에 재고가 없는 책을 모두 찾는 솔루션을 작성하세요 .
-- 대출 기록에 NULL 값 이 있는 경우 해당 도서는 현재 대출 중인 것으로 간주됩니다. return_date
-- 현재 대출자 수를 기준으로 내림차순 으로 정렬한 다음, 도서 제목을 기준으로 오름차순으로 정렬한 결과 테이블을 반환합니다 .
-- 반납되지않은책
-- 재고가 없는 책 : total copies - available copies = 0
with cte as (select book_id, count(record_id) as current_borrowers 
from borrowing_records 
where return_date is null
group by book_id
)
select l.book_id,
l.title,
l.author,
l.genre,
l.publication_year,
c.current_borrowers
from cte c
JOIN library_books l
on c.book_id = l.book_id

where c.current_borrowers - l.total_copies = 0

order by c.current_borrowers desc, l.title 

