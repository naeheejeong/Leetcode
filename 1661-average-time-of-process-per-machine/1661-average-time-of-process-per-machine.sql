SELECT machine_id,
ROUND(SUM(case when activity_type = 'start' then timestamp*-1 else timestamp END)
/ count(distinct process_id),3) as processing_time
from activity
group by machine_id