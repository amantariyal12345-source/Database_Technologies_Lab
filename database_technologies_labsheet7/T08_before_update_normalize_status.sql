-- Question 8: Create a BEFORE UPDATE trigger that normalizes a Status value of 'active' to 'Active'. Test it by updating a doctor.
DROP TRIGGER IF EXISTS trg_doctors_before_update_status;
DELIMITER //
CREATE TRIGGER trg_doctors_before_update_status
BEFORE UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF LOWER(NEW.Status) = 'active' THEN
        SET NEW.Status = 'Active';
    END IF;
END //
DELIMITER ;

UPDATE Doctors SET Status = 'active' WHERE DoctorID = 203;
SELECT DoctorID, DoctorName, Status FROM Doctors WHERE DoctorID = 203;
