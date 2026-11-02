-- Question 10: Create and test a trigger of your choice that demonstrates a useful hospital data-validation or auditing rule. Clearly identify the rule.
-- Rule chosen: a doctor's name must not be blank or consist only of spaces.
DROP TRIGGER IF EXISTS trg_doctors_before_insert_name_check;
DELIMITER //
CREATE TRIGGER trg_doctors_before_insert_name_check
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.DoctorName IS NULL OR CHAR_LENGTH(TRIM(NEW.DoctorName)) = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'DoctorName cannot be empty';
    END IF;
END //
DELIMITER ;

-- Expected: this INSERT fails because DoctorName is blank.
INSERT INTO Doctors (DoctorID, DoctorName, Department, ConsultationFee, Status)
VALUES (295, '   ', 'General Medicine', 600.00, 'Active');
