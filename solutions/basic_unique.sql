/*
** Question: https://pgexercises.com/questions/basic/unique.html
*/

SELECT DISTINCT m.surname
FROM cd.members m
ORDER BY m.surname
LIMIT 10
;
