-- Database Technologies Lab Sheet 6
-- Q7. Display Total Number of Students
-- Question: Create a stored procedure named TotalStudents that calculates and displays the total number of students in the Student table.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS TotalStudents;
DELIMITER //
CREATE PROCEDURE TotalStudents()
BEGIN
    SELECT COUNT(*) AS TotalStudents
    FROM Student;
END //
DELIMITER ;

CALL TotalStudents();
