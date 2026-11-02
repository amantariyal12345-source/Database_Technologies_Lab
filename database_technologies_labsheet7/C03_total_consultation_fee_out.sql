-- Question 3: Create a cursor procedure with an OUT parameter to calculate the total ConsultationFee of all doctors. Call it and display the OUT value.
DROP PROCEDURE IF EXISTS sp_cursor_total_fee;
DELIMITER //
CREATE PROCEDURE sp_cursor_total_fee(OUT p_total DECIMAL(12,2))
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR SELECT ConsultationFee FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    SET p_total = 0;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_fee;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        SET p_total = p_total + v_fee;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_total_fee(@total_fee);
SELECT @total_fee AS TotalConsultationFee;
