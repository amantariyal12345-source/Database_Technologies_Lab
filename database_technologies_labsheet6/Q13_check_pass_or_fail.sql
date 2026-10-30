-- Database Technologies Lab Sheet 6
-- Q13. Check Pass or Fail
-- Question: Create a function named ResultStatus that accepts marks and returns Pass if marks are 50 or above; otherwise return Fail.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS ResultStatus;
DELIMITER //
CREATE FUNCTION ResultStatus(p_Marks DECIMAL(5,2))
RETURNS VARCHAR(10)
DETERMINISTIC
NO SQL
BEGIN
    IF p_Marks >= 50 THEN
        RETURN 'Pass';
    ELSE
        RETURN 'Fail';
    END IF;
END //
DELIMITER ;

SELECT ResultStatus(76.50) AS Result;
