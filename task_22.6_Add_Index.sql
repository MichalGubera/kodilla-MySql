CREATE INDEX BOOKTITLE ON BOOKS(TITLE);

EXPLAIN SELECT * FROM READERS
WHERE FIRSTNAME LIKE "JOHN";

CREATE INDEX READER ON READERS (FIRSTNAME, LASTNAME);

EXPLAIN SELECT * FROM READERS
WHERE FIRSTNAME LIKE "JOHN";