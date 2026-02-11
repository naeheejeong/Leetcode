WITH first_login AS (
  SELECT player_id, MIN(event_date) AS first_login -- 1. 첫 로그인 날짜
  FROM Activity
  GROUP BY player_id
),
next_day AS (
  SELECT DISTINCT a.player_id
  FROM Activity a
  JOIN first_login f
    ON a.player_id = f.player_id
   AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY) -- 2.첫로그인+1일에 로그인햇는지
)
SELECT
  ROUND(
    (SELECT COUNT(*) FROM next_day) / (SELECT COUNT(DISTINCT player_id) FROM Activity)
  , 2) AS fraction;