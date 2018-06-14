DELIMITER $$

CREATE TRIGGER BOOKS_DELETE AFTER DELETE ON BOOKS 
FOR EACH ROW
BEGIN
  INSERT INTO BOOKS_AUD(EVENT_DATE, EVENT_TYPE, BOOK_ID)
	VALUES (CURTIME(), "DELETE", OLD.BOOK_ID);
END $$

DELIMITER ;