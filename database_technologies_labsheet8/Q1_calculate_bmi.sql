-- Q1. Create a function calculate_bmi(weight_kg, height_m) that returns BMI.
USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS calculate_bmi;
DELIMITER //

CREATE FUNCTION calculate_bmi(weight_kg DECIMAL(5,2), height_m DECIMAL(4,2))
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(weight_kg / (height_m * height_m), 2);
END //

DELIMITER ;

-- Test with suitable values: weight = 70 kg, height = 1.75 m.
SELECT calculate_bmi(70.00, 1.75) AS BMI;
