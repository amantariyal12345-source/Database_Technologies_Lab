-- Database Technologies Lab Sheet 6
-- Q16. Calculate Bonus
-- Question: Create a function named CalculateBonus that accepts marks and returns: 1000 for 90 or above, 500 for 75–89, and 200 for below 75.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS CalculateBonus;
DELIMITER //
CREATE FUNCTION CalculateBonus(p_Marks DECIMAL(5,2))
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    IF p_Marks >= 90 THEN
        RETURN 1000;
    ELSEIF p_Marks >= 75 THEN
        RETURN 500;
    ELSE
        RETURN 200;
    END IF;
END //
DELIMITER ;

SELECT CalculateBonus(92.00) AS Bonus;
