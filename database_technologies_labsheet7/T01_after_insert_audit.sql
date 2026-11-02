-- Question 1: Create an AFTER INSERT trigger on Doctors that records the new DoctorID, action type, and new ConsultationFee in Doctor_Audit. Insert a test doctor and verify the audit table.
DROP TRIGGER IF EXISTS trg_doctors_after_insert;
DELIMITER //
CREATE TRIGGER trg_doctors_after_insert
AFTER INSERT ON Doctors
FOR EACH ROW
BEGIN
    INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
    VALUES (NEW.DoctorID, 'INSERT', NULL, NEW.ConsultationFee);
END //
DELIMITER ;

INSERT INTO Doctors (DoctorID, DoctorName, Department, ConsultationFee, Status)
VALUES (299, 'Dr. Test Insert', 'General Medicine', 700.00, 'Active');

SELECT * FROM Doctor_Audit WHERE DoctorID = 299 ORDER BY AuditID DESC;
