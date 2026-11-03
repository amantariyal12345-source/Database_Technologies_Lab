-- Q5. Create patient_by_gender(IN p_gender).
USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS patient_by_gender;
DELIMITER //

CREATE PROCEDURE patient_by_gender(IN p_gender VARCHAR(10))
BEGIN
    SELECT PatientID, PatientName, Age, Gender, WeightKg, ConsultationFee
    FROM Patients
    WHERE Gender = p_gender;
END //

DELIMITER ;

-- Execute for female and male patients.
CALL patient_by_gender('F');
CALL patient_by_gender('M');
