/*
** Question: https://pgexercises.com/questions/aggregates/fachours.html
*/

SELECT b.facid, SUM(slots) AS "Total Slots"
FROM cd.bookings b
GROUP BY b.facid
ORDER BY b.facid
;
