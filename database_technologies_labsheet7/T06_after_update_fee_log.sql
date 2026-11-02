-- Question 6: Create an AFTER UPDATE trigger that stores every changed consultation fee in Fee_Log, including DoctorID, DoctorName, OLD fee, and NEW fee. Test it with an UPDATE.
DROP TRIGGER IF EXISTS trg_doctors_after_fee_log;
DELIMITER //
CREATE TRIGGER trg_doctors_after_fee_log
AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    IF NOT (OLD.ConsultationFee <=> NEW.ConsultationFee) THEN
        INSERT INTO Fee_Log (DoctorID, DoctorName, OldFee, NewFee)
        VALUES (NEW.DoctorID, NEW.DoctorName, OLD.ConsultationFee, NEW.ConsultationFee);
    END IF;
END //
DELIMITER ;

UPDATE Doctors SET ConsultationFee = ConsultationFee + 25 WHERE DoctorID = 202;
SELECT * FROM Fee_Log WHERE DoctorID = 202 ORDER BY LogID DESC;
