-- Database Technologies Lab Sheet 6
-- Q5. Display Students from a Department
-- Question: Create a stored procedure named GetStudentsByDept that accepts DeptID as an IN parameter and displays all students belonging to that department. Test it using DeptID 102.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS GetStudentsByDept;
DELIMITER //
CREATE PROCEDURE GetStudentsByDept(IN p_DeptID INT)
BEGIN
    SELECT * FROM Student
    WHERE DeptID = p_DeptID;
END //
DELIMITER ;

CALL GetStudentsByDept(102);
