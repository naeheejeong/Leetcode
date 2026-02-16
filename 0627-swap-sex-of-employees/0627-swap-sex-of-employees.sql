# Write your MySQL query statement below
-- m->f로, f->m으로 변경
update salary
set sex = 
    case when sex = 'm' then 'f'
    else 'm' end