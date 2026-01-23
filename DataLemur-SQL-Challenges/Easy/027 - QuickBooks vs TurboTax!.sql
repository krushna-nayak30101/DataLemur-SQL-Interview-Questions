SELECT
  SUM (CASE WHEN LOWER(product) LIKE 'turbotax%' THEN 1 ELSE 0 END) AS turbotax,
  SUM (CASE WHEN LOWER(product) LIKE 'quickbooks%' THEN 1 ELSE 0 END) AS quickbooks
FROM filed_taxes;
