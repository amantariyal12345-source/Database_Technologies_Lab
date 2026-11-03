-- Q9. Create patient_report() showing patient details, BMI and age category.
-- The supplied Patients table does not contain height. This script adds HeightM
-- and uses sample heights so that BMI can be calculated. Replace them with
-- actual patient heights if your faculty provides them.
USE Hospital_Functions_Lab;

ALTER TABLE Patients
ADD COLUMN IF NOT EXISTS HeightM DECIMAL(4,2);

UPDATE Patients
SET HeightM = CASE PatientID
    WHEN 201 THEN 1.60
    WHEN 202 THEN 1.75
    WHEN 203 THEN 1.65
    WHEN 204 THEN 1.78
    WHEN 205 THEN 1.68
    WHEN 206 THEN 1.62
END
WHERE HeightM IS NULL;

DROP FUNCTION IF EXISTS calculate_bmi;
DELIMITER //

CREATE FUNCTION calculate_bmi(weight_kg DECIMAL(5,2), height_m DECIMAL(4,2))
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(weight_kg / (height_m * height_m), 2);
END //

DELIMITER ;

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

DROP PROCEDURE IF EXISTS patient_report;
DELIMITER //

CREATE PROCEDURE patient_report()
BEGIN
    SELECT PatientID, PatientName, Age,
           calculate_bmi(WeightKg, HeightM) AS BMI,
           age_category(Age) AS AgeCategory
    FROM Patients;
END //

DELIMITER ;

CALL patient_report();
