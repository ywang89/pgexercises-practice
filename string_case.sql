/*
** Question: https://pgexercises.com/questions/string/case.html
*/

-- method 1
SELECT *
FROM cd.facilities f
WHERE UPPER(f.name) LIKE 'TENNIS%';

-- method 2
SELECT *
FROM cd.facilities f
WHERE f.name ILIKE 'TENNIS%';
