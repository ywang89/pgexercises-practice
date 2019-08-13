/*
** Question: https://pgexercises.com/questions/string/reg.html
*/

-- method 1
SELECT m.memid, m.telephone
FROM cd.members m
WHERE m.telephone ~ '[()]'
ORDER BY m.memid
;

-- method 2
-- please note that POSITION is case sensitive
SELECT m.memid, m.telephone
FROM cd.members m
WHERE POSITION('(' IN m.telephone) > 0 OR POSITION(')' IN m.telephone) > 0
ORDER BY m.memid
;

-- method 3
-- use SQL standard SIMILAR TO
SELECT m.memid, m.telephone
FROM cd.members m
WHERE m.telephone SIMILAR TO '%[()]%'
ORDER BY m.memid
;
