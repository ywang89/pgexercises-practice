/*
** Question: https://pgexercises.com/questions/basic/where2.html
*/

SELECT f.facid, f.name, f.membercost, f.monthlymaintenance
FROM cd.facilities f
WHERE f.membercost > 0 AND
	f.membercost < f.monthlymaintenance * 1.0 / 50
;
