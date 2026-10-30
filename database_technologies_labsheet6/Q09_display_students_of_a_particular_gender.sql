-- Database Technologies Lab Sheet 6
-- Q9. Display Students of a Particular Gender
-- Question: Create a stored procedure named GetStudentsByGender that accepts Gender as an IN parameter and displays students of that gender. Test it using Female.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS GetStudentsByGender;
DELIMITER //
CREATE PROCEDURE GetStudentsByGender(IN p_Gender VARCHAR(10))
BEGIN
    SELECT * FROM Student
    WHERE Gender = p_Gender;
END //
DELIMITER ;

CALL GetStudentsByGender('Female');
