-- Database Technologies Lab Sheet 6
-- Q18. Calculate Double Marks
-- Question: Create a function named DoubleMarks that accepts marks and returns twice the marks.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS DoubleMarks;
DELIMITER //
CREATE FUNCTION DoubleMarks(p_Marks DECIMAL(5,2))
RETURNS DECIMAL(6,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN p_Marks * 2;
END //
DELIMITER ;

SELECT DoubleMarks(85.50) AS DoubleMarks;
