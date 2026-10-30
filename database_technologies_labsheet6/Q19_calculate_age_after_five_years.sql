-- Database Technologies Lab Sheet 6
-- Q19. Calculate Age After Five Years
-- Question: Create a function named AgeAfterFiveYears that accepts current age and returns the age after five years.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS AgeAfterFiveYears;
DELIMITER //
CREATE FUNCTION AgeAfterFiveYears(p_Age INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    RETURN p_Age + 5;
END //
DELIMITER ;

SELECT AgeAfterFiveYears(20) AS AgeAfterFiveYears;
