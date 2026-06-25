with w as (select * , sum(duration_hours) totalHours
from meetings
group by employee_id, WEEKOFYEAR(meeting_date), year(meeting_date)
)
select w.employee_id, e.employee_name, department, 
        count(w.employee_id) as meeting_heavy_weeks
from w 
JOIN employees e ON e.employee_id = w.employee_id
WHERE totalHours > 20
group by w.employee_id, e.employee_name, department
having count(w.employee_id) >= 2
order by meeting_heavy_weeks desc , e.employee_name