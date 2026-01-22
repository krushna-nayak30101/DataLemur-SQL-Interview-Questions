SELECT app_id, 
ROUND(100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) / SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2) AS ctr
FROM events
WHERE DATE_PART('YEAR', timestamp) = 2022
GROUP BY app_id;


--- method 2 
--with cte 

with cte as (
select app_id,
sum(case when event_type= 'impression' then 1 else 0 end ) as impression_count,
sum(case when event_type= 'click' then 1 else 0 end ) as click_count
from events 
WHERE year (timestamp) = 2022
group by app_id
)
select app_id,
ROUND(100.0 *click_count/impression_count,2) AS ctr
from cte 
