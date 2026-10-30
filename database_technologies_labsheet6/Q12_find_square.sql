-- Database Technologies Lab Sheet 6
-- Q12. Find Square
-- Question: Create a function named FindSquare that accepts an integer and returns its square. Test it with 5.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS FindSquare;
DELIMITER //
CREATE FUNCTION FindSquare(n INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN n * n;
END //
DELIMITER ;

SELECT FindSquare(5) AS SquareResult;
