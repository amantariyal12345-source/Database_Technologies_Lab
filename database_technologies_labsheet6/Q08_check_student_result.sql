-- Database Technologies Lab Sheet 6
-- Q8. Check Student Result
-- Question: Create a stored procedure named CheckResult that accepts StudentID as an IN parameter. If marks are 50 or above, display Pass; otherwise display Fail.
-- MySQL solution and test:

USE CollegeDB;

DROP PROCEDURE IF EXISTS CheckResult;
DELIMITER //
CREATE PROCEDURE CheckResult(IN p_StudentID INT)
BEGIN
    SELECT StudentID, StudentName, Marks,
           CASE
               WHEN Marks >= 50 THEN 'Pass'
               ELSE 'Fail'
           END AS Result
    FROM Student
    WHERE StudentID = p_StudentID;
END //
DELIMITER ;

CALL CheckResult(3);
