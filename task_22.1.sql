DROP FUNCTION IF EXISTS FindUser;
DELIMITER $$
CREATE FUNCTION FindUser(USER_ID INT) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50) DEFAULT 'Invalid ID selected';
    IF USER_ID > 0 THEN
		SET result = (SELECT concat(FIRSTNAME, ' ', LASTNAME, ' ' , PESELID) FROM READERS WHERE READER_ID = USER_ID);
	END IF;
    RETURN result;
END $$

DELIMITER ;

SELECT FindUser(0) AS USER;
