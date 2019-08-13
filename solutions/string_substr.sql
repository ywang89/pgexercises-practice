/*
** Question: https://pgexercises.com/questions/string/substr.html
*/

-- method 1
-- use SUBSTR
SELECT
	SUBSTR(m.surname, 1, 1) AS letter,
	COUNT(*) AS count
FROM cd.members m
GROUP BY SUBSTR(m.surname, 1, 1)
ORDER BY letter;

-- method 2
-- use SUBSTRING
SELECT
	substring(m.surname FROM '#"_#"%' FOR '#') AS letter,
	COUNT(*) AS count
FROM cd.members m
GROUP BY substring(m.surname FROM '#"_#"%' FOR '#')
ORDER BY letter;

-- method 3
-- use SUBSTRING
SELECT
	substring(m.surname FROM '^(.)') AS letter,
	COUNT(*) AS count
FROM cd.members m
GROUP BY substring(m.surname FROM '^(.)')
ORDER BY letter;

