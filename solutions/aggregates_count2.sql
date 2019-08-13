/*
** Question: https://pgexercises.com/questions/aggregates/count2.html
*/

SELECT COUNT(*) AS count
FROM cd.facilities f
WHERE f.guestcost >= 10;
