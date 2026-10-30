-- Database Technologies Lab Sheet 6
-- Q17. Find Higher Number
-- Question: Create a function named HigherNumber that accepts two integers and returns the greater number.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS HigherNumber;
DELIMITER //
CREATE FUNCTION HigherNumber(a INT, b INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    IF a >= b THEN
        RETURN a;
    ELSE
        RETURN b;
    END IF;
END //
DELIMITER ;

SELECT HigherNumber(10, 20) AS HigherNumber;
