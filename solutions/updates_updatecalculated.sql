/*
** Question: https://pgexercises.com/questions/updates/updatecalculated.html
*/

UPDATE cd.facilities f1
SET 
	membercost = (SELECT membercost * 1.1 FROM cd.facilities WHERE facid = 0),
	guestcost = (SELECT guestcost * 1.1 FROM cd.facilities WHERE facid = 0)
WHERE f1.facid = 1;
