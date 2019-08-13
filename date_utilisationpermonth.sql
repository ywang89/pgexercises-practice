/*
** This is my answer for this question: https://pgexercises.com/questions/date/utilisationpermonth.html
** 
** Relevant resources:
** - ROUND function: https://stackoverflow.com/questions/13113096/how-to-round-an-average-to-2-decimal-places-in-postgresql
*/

-- method 1
WITH month_hours AS (
  SELECT
	  t1.month,
	  (CAST(t1.month + INTERVAL '1 MONTH' AS DATE) - CAST(t1.month AS DATE)) * 12.50 AS m_hours	
  FROM
  (
	  SELECT GENERATE_SERIES(
        TIMESTAMP '2012-07-01', 
		TIMESTAMP '2013-01-01',
		'1 MONTH') AS month
  ) t1
)

SELECT
	f.name,
	t2.start_month,
	ROUND((t2.total_hours / m.m_hours) * 100, 1) AS utilisation
FROM
(
  SELECT 
	  b.facid, DATE_TRUNC('MONTH', b.starttime) AS start_month,
	  SUM(b.slots * 0.5) AS total_hours
  FROM cd.bookings b
  GROUP BY b.facid, DATE_TRUNC('MONTH', b.starttime)
) t2
	LEFT OUTER JOIN month_hours m ON t2.start_month = m.month
	LEFT OUTER JOIN cd.facilities f ON t2.facid = f.facid
ORDER BY f.name, t2.start_month
;


-- method 2
-- this method is slight different on the way of calculating total open hours of a facility per month.
WITH month_hours AS (
  SELECT
	  t1.month,
	  EXTRACT(EPOCH FROM (t1.month + INTERVAL '1 MONTH' - t1.month)) / (60 * 60 * 24) * 12.5 AS m_hours	
  FROM
  (
	  SELECT GENERATE_SERIES(
		TIMESTAMP '2012-07-01', 
		TIMESTAMP '2013-01-01',
		'1 MONTH') AS month
  ) t1
)

SELECT
	f.name,
	t2.start_month,
	ROUND((t2.total_hours / CAST(m.m_hours AS numeric)) * 100, 1) AS utilisation
FROM
(
  SELECT 
	  b.facid, DATE_TRUNC('MONTH', b.starttime) AS start_month,
	  SUM(b.slots * 0.5) AS total_hours
  FROM cd.bookings b
  GROUP BY b.facid, DATE_TRUNC('MONTH', b.starttime)
) t2
	LEFT OUTER JOIN month_hours m ON t2.start_month = m.month
	LEFT OUTER JOIN cd.facilities f ON t2.facid = f.facid
ORDER BY f.name, t2.start_month
;
