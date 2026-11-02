-- Question 4: Create a BEFORE INSERT trigger that prevents a doctor from being inserted with a negative ConsultationFee. Use SIGNAL SQLSTATE '45000' with a meaningful message and test it.
DROP TRIGGER IF EXISTS trg_doctors_before_insert_fee_check;
DELIMITER //
CREATE TRIGGER trg_doctors_before_insert_fee_check
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.ConsultationFee < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ConsultationFee cannot be negative';
    END IF;
END //
DELIMITER ;

-- Expected: this INSERT fails with the trigger's error message.
INSERT INTO Doctors (DoctorID, DoctorName, Department, ConsultationFee, Status)
VALUES (297, 'Dr. Invalid Fee', 'General Medicine', -100.00, 'Active');
