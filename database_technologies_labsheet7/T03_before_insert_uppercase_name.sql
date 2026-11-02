-- Question 3: Create a BEFORE INSERT trigger that converts DoctorName to uppercase before the doctor is stored. Insert a test doctor using a lowercase name and verify the result.
DROP TRIGGER IF EXISTS trg_doctors_before_insert_uppercase;
DELIMITER //
CREATE TRIGGER trg_doctors_before_insert_uppercase
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    SET NEW.DoctorName = UPPER(NEW.DoctorName);
END //
DELIMITER ;

INSERT INTO Doctors (DoctorID, DoctorName, Department, ConsultationFee, Status)
VALUES (298, 'dr. lowercase test', 'General Medicine', 650.00, 'Active');

SELECT * FROM Doctors WHERE DoctorID = 298;
