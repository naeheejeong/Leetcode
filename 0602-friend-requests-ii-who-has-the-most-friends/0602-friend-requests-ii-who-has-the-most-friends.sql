SELECT id, COUNT(*) AS num
FROM (
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id  AS id FROM RequestAccepted
) f
group by id 
order by count(*) desc
limit 1 