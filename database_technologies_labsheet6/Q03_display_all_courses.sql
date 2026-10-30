-- Database Technologies Lab Sheet 6
-- Q3. Display All Courses
-- Question: Create a stored procedure named ShowCourses to display all records from the Course table.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS ShowCourses;
DELIMITER //
CREATE PROCEDURE ShowCourses()
BEGIN
    SELECT * FROM Course;
END //
DELIMITER ;

CALL ShowCourses();
