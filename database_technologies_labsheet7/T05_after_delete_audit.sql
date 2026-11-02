-- Question 5: Create an AFTER DELETE trigger that records the deleted DoctorID and OLD ConsultationFee in Doctor_Audit. Delete a test doctor and verify the audit record.
DROP TRIGGER IF EXISTS trg_doctors_after_delete;
DELIMITER //
CREATE TRIGGER trg_doctors_after_delete
AFTER DELETE ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
    VALUES (OLD.DoctorID, 'DELETE', OLD.ConsultationFee, NULL);
END //
DELIMITER ;

-- Insert a temporary test row, then delete it to demonstrate the trigger.
INSERT INTO Doctors (DoctorID, DoctorName, Department, ConsultationFee, Status)
VALUES (296, 'Dr. Test Delete', 'General Medicine', 500.00, 'Active');
DELETE FROM Doctors WHERE DoctorID = 296;

SELECT * FROM Doctor_Audit WHERE DoctorID = 296 ORDER BY AuditID DESC;
