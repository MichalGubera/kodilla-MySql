-- DROP TABLE IF EXISTS
USE KODILLA_COURSE;
DROP TABLE IF EXISTS STATS;

-- CREATE TABLE
USE KODILLA_COURSE;
CREATE TABLE STATS (
  STAT_ID INT(11) AUTO_INCREMENT,
  STAT_DATE DATETIME NOT NULL,
  STAT VARCHAR(20) NOT NULL,
  VALUE INT(11) NOT NULL,
  PRIMARY KEY (`STAT_ID`)
);

COMMIT;

-- DROP VIEW IF EXISTS
USE KODILLA_COURSE;
DROP VIEW IF EXISTS BESTSELLERS_COUNT;
-- CREATE VIEW
USE KODILLA_COURSE;
CREATE VIEW BESTSELLERS_COUNT AS
  SELECT COUNT(*) BESTSELLER_COUNT FROM BOOKS
  WHERE BESTSELLER = 1;
  
COMMIT;

-- SET BESTSELLERS TO NOT SET
USE KODILLA_COURSE;
UPDATE BOOKS
   SET BESTSELLER = 0
 WHERE BOOK_ID IN (1,2,3,4,5);
 
 COMMIT;

-- cleaning up stats
USE KODILLA_COURSE;
DROP EVENT IF EXISTS UPDATE_STATS;  

-- CREATE EVENT
USE KODILLA_COURSE;
DELIMITER $$

CREATE EVENT UPDATE_STATS
  ON SCHEDULE EVERY 1 MINUTE
  DO 
    BEGIN
      DECLARE result INT DEFAULT 0;
      CALL UpdateBestsellers();
      SELECT bestseller_count FROM bestsellers_count INTO result;
      INSERT INTO STATS(STAT_DATE, STAT, VALUE)
        VALUES(CURTIME(), "BESTSELLERS", result);
    END $$
    
DELIMITER ;

COMMIT;

-- CHECK 
SELECT * FROM BOOKS;
SELECT * FROM BESTSELLERS_COUNT;
SELECT * FROM STATS;
SHOW PROCESSLIST;
