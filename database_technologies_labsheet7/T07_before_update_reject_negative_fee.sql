-- Question 7: Create a BEFORE UPDATE trigger that prevents ConsultationFee from becoming negative. Test the trigger with an invalid UPDATE.
DROP TRIGGER IF EXISTS trg_doctors_before_update_fee_check;
DELIMITER //
CREATE TRIGGER trg_doctors_before_update_fee_check
BEFORE UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.ConsultationFee < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ConsultationFee cannot be negative';
    END IF;
END //
DELIMITER ;

-- Expected: this UPDATE fails with the trigger's error message.
UPDATE Doctors SET ConsultationFee = -1 WHERE DoctorID = 201;
