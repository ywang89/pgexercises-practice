/*
** Question: https://pgexercises.com/questions/basic/where3.html
** 
** References: https://www.postgresql.org/docs/current/functions-matching.html
*/

-- method 1
SELECT *
FROM cd.facilities f
WHERE f.name LIKE '%Tennis%';

-- method 2
SELECT *
FROM cd.facilities f
WHERE f.name SIMILAR TO '%Tennis%';

-- method 3
SELECT *
FROM cd.facilities f
WHERE f.name ~ 'Tennis';
