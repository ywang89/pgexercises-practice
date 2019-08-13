/*
** Question: https://pgexercises.com/questions/string/like.html
*/

-- method 1
SELECT *
FROM cd.facilities f
WHERE f.name LIKE 'Tennis%';

-- method 2
SELECT *
FROM cd.facilities f
WHERE substr(f.name, 1, 6) = 'Tennis';

-- method 3
SELECT *
FROM cd.facilities f
WHERE substring(f.name FROM '#"Tennis#"%' FOR '#') = 'Tennis';
