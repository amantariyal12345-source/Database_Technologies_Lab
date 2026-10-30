-- Database Technologies Lab Sheet 6
-- Q10. Display Students Within a Marks Range
-- Question: Create a stored procedure named StudentsBetweenMarks that accepts two marks values and displays students whose marks are between the two values. Test it using 70 and 90.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS StudentsBetweenMarks;
DELIMITER //
CREATE PROCEDURE StudentsBetweenMarks(
    IN p_MinMarks DECIMAL(5,2),
    IN p_MaxMarks DECIMAL(5,2)
)
BEGIN
    SELECT * FROM Student
    WHERE Marks BETWEEN p_MinMarks AND p_MaxMarks;
END //
DELIMITER ;

CALL StudentsBetweenMarks(70, 90);
