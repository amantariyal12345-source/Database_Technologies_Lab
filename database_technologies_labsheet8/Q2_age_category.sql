-- Q2. Create age_category(age) and apply it to every patient.
-- Rules defined for this solution:
-- Below 18 = Child, 18 to 59 = Adult, 60 and above = Senior.
USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS age_category;
DELIMITER //

CREATE FUNCTION age_category(p_age INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE result_category VARCHAR(10);

    IF p_age < 18 THEN
        SET result_category = 'Child';
    ELSEIF p_age < 60 THEN
        SET result_category = 'Adult';
    ELSE
        SET result_category = 'Senior';
    END IF;

    RETURN result_category;
END //

DELIMITER ;

SELECT PatientID, PatientName, Age,
       age_category(Age) AS AgeCategory
FROM Patients;
