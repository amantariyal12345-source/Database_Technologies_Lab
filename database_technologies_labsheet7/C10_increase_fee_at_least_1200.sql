-- Question 10: Create a cursor procedure that gives a 5% fee increase to every doctor whose ConsultationFee is at least 1200. Execute it and verify the updated fees.
DROP PROCEDURE IF EXISTS sp_cursor_raise_fee_1200;
DELIMITER //
CREATE PROCEDURE sp_cursor_raise_fee_1200()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR
        SELECT DoctorID, ConsultationFee
        FROM Doctors
        WHERE ConsultationFee >= 1200;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_fee;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        UPDATE Doctors
        SET ConsultationFee = ROUND(v_fee * 1.05, 2)
        WHERE DoctorID = v_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_raise_fee_1200();
SELECT * FROM Doctors ORDER BY DoctorID;
