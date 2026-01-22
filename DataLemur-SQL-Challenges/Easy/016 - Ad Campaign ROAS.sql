 SELECT advertiser_id, ROUND((SUM(revenue) / SUM(spend))::decimal, 2) AS ROAS
FROM ad_campaigns
GROUP BY advertiser_id
ORDER BY advertiser_id;

---xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT
  advertiser_id,
  ROUND(((SUM(revenue) / SUM(spend))), 2) AS ROAS
FROM ad_campaigns_google
GROUP BY advertiser_id
ORDER BY advertiser_id;

---xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

WITH cte AS (
  SELECT
    advertiser_id
    ,SUM(spend) AS spend
    ,SUM(revenue) AS revenue
  FROM ad_campaigns_google
  GROUP BY advertiser_id
)
SELECT
  advertiser_id
  ,ROUND((revenue / spend), 2) AS ROAS
FROM cte
ORDER BY advertiser_id ASC
;
