SELECT employee_id
FROM employee
GROUP BY employee_id
HAVING (SUM(years_of_experience) >= 8 AND COUNT(DISTINCT domain) = 1) 
  OR (SUM(years_of_experience) >=12 AND COUNT(DISTINCT domain) = 2);

