/*
This is my solution to the question:
https://pgexercises.com/questions/aggregates/payback.html
*/

-- method 1
SELECT
	t1.name,
	t1.initialoutlay * 1.0 / (t1.income - t1.monthlymaintenance) AS months
FROM
(
  SELECT
	  f.name,
	  f.monthlymaintenance,
	  f.initialoutlay,
	  SUM(
		CASE WHEN b.memid = 0 THEN f.guestcost * b.slots
		ELSE f.membercost * b.slots END) / 3.0 AS income
  FROM cd.facilities f
	  INNER JOIN cd.bookings b ON f.facid = b.facid
  GROUP BY f.facid
) t1
ORDER BY t1.name
;

-- method 2
-- Since the aggregate function already returns a facid level result,
-- there actually is no need to have a subquery; we can directly starts
-- calculating number of months 
SELECT
  f.name,
  f.initialoutlay /
    (
      SUM(
        CASE WHEN b.memid = 0 THEN f.guestcost * b.slots
        ELSE f.membercost * b.slots END
        ) / 3.0 -
      f.monthlymaintenance
    ) AS months
FROM cd.facilities f
  INNER JOIN cd.bookings b ON f.facid = b.facid
GROUP BY f.facid
ORDER BY f.name
;
