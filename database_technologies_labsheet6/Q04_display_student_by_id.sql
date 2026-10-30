-- Database Technologies Lab Sheet 6
-- Q4. Display Student by ID
-- Question: Create a stored procedure named GetStudent that accepts StudentID as an IN parameter and displays the details of that student. Test it using StudentID 3.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS GetStudent;
DELIMITER //
CREATE PROCEDURE GetStudent(IN p_StudentID INT)
BEGIN
    SELECT * FROM Student
    WHERE StudentID = p_StudentID;
END //
DELIMITER ;

CALL GetStudent(3);
