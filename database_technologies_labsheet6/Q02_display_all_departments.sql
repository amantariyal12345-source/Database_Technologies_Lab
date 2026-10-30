-- Database Technologies Lab Sheet 6
-- Q2. Display All Departments
-- Question: Create a stored procedure named ShowDepartments to display all records from the Department table.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS ShowDepartments;
DELIMITER //
CREATE PROCEDURE ShowDepartments()
BEGIN
    SELECT * FROM Department;
END //
DELIMITER ;

CALL ShowDepartments();
