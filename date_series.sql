/*
** Question: https://pgexercises.com/questions/date/series.html
**
** Reference for casting types in PostgreSQL:
**  https://www.postgresql.org/docs/current/sql-syntax-lexical.html#SQL-SYNTAX-CONSTANTS-GENERIC
*/

SELECT GENERATE_SERIES(TIMESTAMP '2012-10-01', 
					   TIMESTAMP '2012-10-31', 
					   INTERVAL '1 DAY') AS ts;
