-- question: https://pgexercises.com/questions/string/pad.html
-- A few concepts related to this one:
--      LPAD: http://www.postgresqltutorial.com/postgresql-lpad/
--      CHAR, VARCHAR, TEXT: http://www.postgresqltutorial.com/postgresql-char-varchar-text/
--      LENGTH: http://www.postgresqltutorial.com/postgresql-length-function/

SELECT
	LPAD(CAST(m.zipcode AS CHAR(5)), 5, '0') AS zip
FROM cd.members m
ORDER BY zip
;
