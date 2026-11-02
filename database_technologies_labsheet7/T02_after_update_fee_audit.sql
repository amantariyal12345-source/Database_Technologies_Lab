-- Question 2: Create an AFTER UPDATE trigger that records OLD and NEW ConsultationFee values whenever a doctor's fee changes. Update one doctor and verify Doctor_Audit.
DROP TRIGGER IF EXISTS trg_doctors_after_fee_update;
DELIMITER //
CREATE TRIGGER trg_doctors_after_fee_update
AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF NOT (OLD.ConsultationFee <=> NEW.ConsultationFee) THEN
        INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
        VALUES (NEW.DoctorID, 'FEE UPDATE', OLD.ConsultationFee, NEW.ConsultationFee);
    END IF;
END //
DELIMITER ;

UPDATE Doctors SET ConsultationFee = ConsultationFee + 50 WHERE DoctorID = 201;
SELECT * FROM Doctor_Audit WHERE DoctorID = 201 ORDER BY AuditID DESC;
