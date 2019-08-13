/*
** Question: https://pgexercises.com/questions/date/daysinmonth.html
*/

-- method 1
-- quote below from the site, important to remember
-- "
--  It's worth noting that subtracting two timestamps will always produce an 
--  interval in terms of days (or portions of a day). You won't just get an answer 
--  in terms of months or years, because the length of those time periods is variable.
-- "
--
-- It's also worth noting the result of TIMESTAMP + INTERVAL
-- The MONTH element of the TIMESTAMP will be moving to the next month, but not exceeding
-- the last day of the next month.
--
-- For example, 
--      SELECT TIMESTAMP '2019-01-31' + INTERVAL '1 MONTH' AS test
-- will generate a result '2019-02-28 00:00:00'
--      SELECT TIMESTAMP '2019-01-01' + INTERVAL '1 MONTH' AS test
-- will generate a result '2019-02-01 00:00:00'

SELECT
	EXTRACT(MONTH FROM ts.months) AS month,
	ts.months + INTERVAL '1 MONTH' - ts.months AS length
FROM 
(
  SELECT
	  GENERATE_SERIES(TIMESTAMP '2012-01-01 00:00:00', 
					  TIMESTAMP '2012-12-01 00:00:00', 
					  INTERVAL '1 MONTH') AS months
) ts
;

-- method 2
-- slightly different from method 1 by generating 2 timestamp columns.
SELECT
	EXTRACT(MONTH FROM ts.months) AS month,
	ts.months_2 - ts.months AS length
FROM
(
  SELECT
	  GENERATE_SERIES(TIMESTAMP '2012-01-01 00:00:00',
					  TIMESTAMP '2012-12-01 00:00:00',
					  INTERVAL '1 MONTH') AS months,
  	  GENERATE_SERIES(TIMESTAMP '2012-02-01 00:00:00',
					  TIMESTAMP '2013-01-01 00:00:00',
					  INTERVAL '1 MONTH') AS months_2
) ts
;
