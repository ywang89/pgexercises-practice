/*
** Question: https://pgexercises.com/questions/string/concat.html
*/

-- method 1
SELECT 
	m.surname || ', ' || m.firstname AS name
FROM cd.members m;

-- method 2
-- Reference: http://www.postgresqltutorial.com/postgresql-concat-function/
SELECT 
	CONCAT_WS(', ', m.surname, m.firstname) AS name
FROM cd.members m;
