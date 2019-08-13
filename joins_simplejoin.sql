/*
** Question: https://pgexercises.com/questions/joins/simplejoin.html
*/

-- method 1
SELECT
	b.starttime
FROM cd.bookings b
	INNER JOIN cd.members m ON b.memid = m.memid
WHERE m.firstname = 'David' AND m.surname = 'Farrell';

-- method 2
-- Watch out for the comma between tables in FROM
SELECT
	b.starttime
FROM cd.bookings b,
	cd.members m
WHERE m.firstname = 'David'
	AND m.surname = 'Farrell'
	AND b.memid = m.memid;
