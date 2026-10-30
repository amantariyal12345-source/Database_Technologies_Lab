-- Database Technologies Lab Sheet 6
-- Q14. Find Student Grade
-- Question: Create a function named StudentGrade that accepts marks and returns: A for 90 or above, B for 75–89, C for 60–74, and D for below 60.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS StudentGrade;
DELIMITER //
CREATE FUNCTION StudentGrade(p_Marks DECIMAL(5,2))
RETURNS CHAR(1)
DETERMINISTIC
NO SQL
BEGIN
    IF p_Marks >= 90 THEN
        RETURN 'A';
    ELSEIF p_Marks >= 75 THEN
        RETURN 'B';
    ELSEIF p_Marks >= 60 THEN
        RETURN 'C';
    ELSE
        RETURN 'D';
    END IF;
END //
DELIMITER ;

SELECT StudentGrade(92.00) AS Grade;
