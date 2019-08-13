/*
** Question: https://pgexercises.com/questions/aggregates/facrev2.html
** Note: slots represnets a half-hour slot. The cost is per each half-hour slot.
*/

SELECT
	f.name,
	SUM(CASE WHEN b.memid = 0 THEN f.guestcost * b.slots 
		ELSE f.membercost * b.slots END) AS revenue
FROM cd.facilities f
	LEFT OUTER JOIN cd.bookings b ON f.facid = b.facid
GROUP BY f.facid
HAVING SUM(CASE WHEN b.memid = 0 THEN f.guestcost * b.slots 
		ELSE f.membercost * b.slots END) < 1000
ORDER BY revenue;
