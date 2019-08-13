/*
** Question: https://pgexercises.com/questions/aggregates/count3.html
*/

-- method 1
SELECT m.recommendedby, COUNT(*) AS count
FROM cd.members m
WHERE m.recommendedby IS NOT NULL
GROUP BY m.recommendedby
ORDER BY m.recommendedby;
