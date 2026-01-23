WITH cte AS (
  SELECT
    customer_id
    ,purchase_amount
    ,ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY purchase_amount DESC) AS rownum
  FROM transactions
)
SELECT
  customer_id
  ,purchase_amount
FROM cte 
WHERE rownum = 1
ORDER BY purchase_amount DESC
;
