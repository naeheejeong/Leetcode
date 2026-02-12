# Write your MySQL query statement below
-- red 회사 오더 하지 않은 사람의 이름
select name
from salesperson s 
where s.name NOT IN 
    (
    select s.name
    from salesperson s 
    left join orders o on s.sales_id = o.sales_id
    left join company c on o.com_id = c.com_id
    where c.name = 'RED'
    )