-- # Write your MySQL query statement below
-- 각 주식의 자본 이득/손실을 보고하는 솔루션을 작성하세요. 
-- 주식의 자본 이득/손실은 주식을 한 번 또는 여러 번 매수 및 매도한 후 발생하는 총 이득 또는 손실입니다. 결과 표는 순서에 관계없이 반환할 수 있습니다. 
-- SUM(매도) - SUM(매수)
WITH f as (select stock_name,
SUM(case when operation = 'Sell' then price END) as sum_sell,
SUM(case when operation = 'buy' then price END) as sum_buy
from stocks
group by stock_name
)
select stock_name,
sum_sell - sum_buy as capital_gain_loss
from f 