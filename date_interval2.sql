/*
** Question: https://pgexercises.com/questions/date/interval2.html
*/

SELECT 
	EXTRACT(EPOCH FROM (TIMESTAMP '2012-09-02 00:00:00' - TIMESTAMP '2012-08-31 01:00:00'))
	AS date_part;
