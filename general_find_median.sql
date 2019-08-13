
-- Practice finding median using pgexercise's tables.

-- method 1
-- Use built-in function
SELECT 
	PERCENTILE_DISC(0.50) WITHIN GROUP (ORDER BY f.initialoutlay) AS median 
FROM cd.facilities f
;

-- method 2
-- Based on this thread: https://stackoverflow.com/questions/1342898/function-to-calculate-median-in-sql-server
SELECT
	AVG(t1.initialoutlay) AS median
FROM
(
SELECT
	*,
	ROW_NUMBER() OVER (ORDER BY initialoutlay ASC, facid ASC) AS row_asc,
	ROW_NUMBER() OVER (ORDER BY initialoutlay DESC, facid DESC) AS row_desc
FROM cd.facilities f
) t1
WHERE t1.row_asc IN (t1.row_desc, t1.row_desc + 1, t1.row_desc - 1);

-- method 3
-- Based on this comment: https://leetcode.com/problems/find-median-given-frequency-of-numbers/discuss/102710/Easy-peasy
WITH freq AS (
  SELECT guestcost, COUNT(*) AS frequency
  FROM cd.facilities
  GROUP BY guestcost
)

SELECT AVG(f.guestcost) AS median
FROM freq f
WHERE f.frequency >= ABS(
  (SELECT SUM(frequency) FROM freq WHERE guestcost <= f.guestcost) -
  (SELECT SUM(frequency) FROM freq WHERE guestcost >= f.guestcost)
  )
;
