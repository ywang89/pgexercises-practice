/*
** Question: https://pgexercises.com/questions/basic/classify.html
*/

SELECT
	f.name,
	CASE WHEN f.monthlymaintenance > 100 THEN 'expensive'
		ELSE 'cheap' END AS cost
FROM cd.facilities f
;
