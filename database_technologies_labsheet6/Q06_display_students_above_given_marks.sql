-- Database Technologies Lab Sheet 6
-- Q6. Display Students Above Given Marks
-- Question: Create a stored procedure named StudentsAboveMarks that accepts marks as an IN parameter and displays students whose marks are greater than the given value. Test it using 80.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS StudentsAboveMarks;
DELIMITER //
CREATE PROCEDURE StudentsAboveMarks(IN p_Marks DECIMAL(5,2))
BEGIN
    SELECT * FROM Student
    WHERE Marks > p_Marks;
END //
DELIMITER ;

CALL StudentsAboveMarks(80);
