-- Database Technologies Lab Sheet 6
-- Q15. Find Age Category
-- Question: Create a function named AgeCategory that accepts age and returns Adult if age is 18 or above; otherwise return Minor.
-- MySQL solution and test:

USE CollegeDB;

DROP FUNCTION IF EXISTS AgeCategory;
DELIMITER //
CREATE FUNCTION AgeCategory(p_Age INT)
RETURNS VARCHAR(10)
DETERMINISTIC
NO SQL
BEGIN
    IF p_Age >= 18 THEN
        RETURN 'Adult';
    ELSE
        RETURN 'Minor';
    END IF;
END //
DELIMITER ;

SELECT AgeCategory(20) AS AgeCategory;
