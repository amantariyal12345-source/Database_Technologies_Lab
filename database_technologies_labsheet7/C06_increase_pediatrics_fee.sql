-- Question 6: Create a cursor procedure that increases the ConsultationFee of all Pediatrics doctors by 10%. Execute it and verify the Doctors table.
DROP PROCEDURE IF EXISTS sp_cursor_raise_pediatrics_fee;
DELIMITER //
CREATE PROCEDURE sp_cursor_raise_pediatrics_fee()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR
        SELECT DoctorID, ConsultationFee
        FROM Doctors
        WHERE Department = 'Pediatrics';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_fee;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        UPDATE Doctors
        SET ConsultationFee = ROUND(v_fee * 1.10, 2)
        WHERE DoctorID = v_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_raise_pediatrics_fee();
SELECT * FROM Doctors ORDER BY DoctorID;
