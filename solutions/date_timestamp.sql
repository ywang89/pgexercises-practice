/*
** Question: https://pgexercises.com/questions/date/timestamp.html
**
** References: https://www.postgresql.org/docs/current/datatype-datetime.html
*/

-- below 2 methods both work

SELECT CAST('2012-08-31 01:00:00' AS TIMESTAMP) AS timestamp;

SELECT TIMESTAMP '2012-08-31 01:00:00' AS timestamp;
