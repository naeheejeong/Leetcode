WITH new AS (
  SELECT
    product_id,
    new_price,
    ROW_NUMBER() OVER (
      PARTITION BY product_id
      ORDER BY change_date DESC
    ) AS rn
  FROM Products
  WHERE change_date <= '2019-08-16'
),
all_p as (
  SELECT DISTINCT product_id
  FROM Products
)
SELECT
  a.product_id,
  COALESCE(n.new_price, 10) AS price
FROM all_p a
LEFT JOIN new n
  ON a.product_id = n.product_id
 AND n.rn = 1;