-- polarized opinion : 책에 대해 평점 4점과 평점 2점이 각각 하나 이상 있는 경우, 그 책은 호불호가 극명하게 갈린다고 판단합니다
-- 5개의 reading sessions 
-- rating spread = highest_rating - lowest_rating
-- polarization score : 이상치 개수/총session개수 | ROUND(,2)
-- polarization score >= 0.6
-- order by polarization score desc, title desc 
select r.book_id, title, author, genre, pages, 
max(session_rating) - min(session_rating) as rating_spread,
ROUND(SUM(case when session_rating >3 OR session_rating <3 THEN 1 else 0 END) / count(session_id) ,2 ) as polarization_score
from reading_sessions r
JOIN books b ON r.book_id = b.book_id 
group by book_id
having count(session_id) >=5
AND SUM(case when session_rating >3 THEN 1 else 0 END) > 0 
AND SUM(case when session_rating<3 THEN 1 ELSE 0 END) >0
AND polarization_score >= 0.6
order by polarization_score desc, title desc 
