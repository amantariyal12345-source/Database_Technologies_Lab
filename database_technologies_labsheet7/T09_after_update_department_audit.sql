-- Question 9: Create an AFTER UPDATE trigger that records an audit event when a doctor's Department changes. Change one department and verify the audit table.
DROP TRIGGER IF EXISTS trg_doctors_after_department_update;
DELIMITER //
CREATE TRIGGER trg_doctors_after_department_update
AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF NOT (OLD.Department <=> NEW.Department) THEN
        INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
        VALUES (NEW.DoctorID, 'DEPARTMENT UPDATE', NULL, NULL);
    END IF;
END //
DELIMITER ;

UPDATE Doctors SET Department = 'Cardiology Review' WHERE DoctorID = 204;
SELECT * FROM Doctor_Audit
WHERE DoctorID = 204 AND ActionType = 'DEPARTMENT UPDATE'
ORDER BY AuditID DESC;
