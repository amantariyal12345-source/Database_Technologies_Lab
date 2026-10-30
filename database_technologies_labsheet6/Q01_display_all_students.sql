-- Database Technologies Lab Sheet 6
-- Q1. Display All Students
-- Question: Create a stored procedure named ShowStudents to display all records from the Student table.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS ShowStudents;
DELIMITER //
CREATE PROCEDURE ShowStudents()
BEGIN
    SELECT * FROM Student;
END //
DELIMITER ;

CALL ShowStudents();
