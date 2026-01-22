SELECT candidate_id
FROM candidates
WHERE skill IN('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(candidate_id) = 3
ORDER BY candidate_id;


-- methid 2 

WITH cte AS (
  SELECT
    candidate_id
    ,STRING_AGG(LOWER(skill), ' , ') AS skills
  FROM candidates
  GROUP BY candidate_id
)
SELECT
  candidate_id
FROM cte 
WHERE skills LIKE '%python%'
AND skills LIKE '%tableau%'
AND skills LIKE '%postgresql%'
