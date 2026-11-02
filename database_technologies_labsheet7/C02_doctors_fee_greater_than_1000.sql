-- Question 2: Create a cursor procedure that displays doctors whose ConsultationFee is greater than 1000. Test the procedure.
DROP PROCEDURE IF EXISTS sp_cursor_fee_over_1000;
DELIMITER //
CREATE PROCEDURE sp_cursor_fee_over_1000()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR
        SELECT DoctorID, DoctorName, ConsultationFee
        FROM Doctors
        WHERE ConsultationFee > 1000
        ORDER BY DoctorID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_name, v_fee;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT v_id AS DoctorID, v_name AS DoctorName, v_fee AS ConsultationFee;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_fee_over_1000();
