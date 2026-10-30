-- Database Technologies Lab Sheet 6
-- Q11. Add Two Numbers
-- Question: Create a function named AddTwoNumbers that accepts two integers and returns their sum. Test it with 10 and 20.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS AddTwoNumbers;
DELIMITER //
CREATE FUNCTION AddTwoNumbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN a + b;
END //
DELIMITER ;

SELECT AddTwoNumbers(10, 20) AS SumResult;
