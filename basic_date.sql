/*
** Question: https://pgexercises.com/questions/basic/date.html
*/

SELECT m.memid, m.surname, m.firstname, m.joindate
FROM cd.members m
WHERE m.joindate >= '2012-09-01'
;
