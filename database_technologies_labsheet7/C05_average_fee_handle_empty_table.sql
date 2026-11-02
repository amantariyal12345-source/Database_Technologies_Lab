-- Question 5: Create a cursor procedure to calculate the average ConsultationFee of all doctors. Handle the case where no rows are available.
DROP PROCEDURE IF EXISTS sp_cursor_average_fee;
DELIMITER //
CREATE PROCEDURE sp_cursor_average_fee(OUT p_average DECIMAL(12,2))
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_fee DECIMAL(10,2);
    DECLARE v_total DECIMAL(12,2) DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT ConsultationFee FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_fee;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        SET v_total = v_total + v_fee;
        SET v_count = v_count + 1;
    END LOOP;
    CLOSE cur;

    IF v_count = 0 THEN
        SET p_average = NULL;
    ELSE
        SET p_average = v_total / v_count;
    END IF;
END //
DELIMITER ;

CALL sp_cursor_average_fee(@average_fee);
SELECT @average_fee AS AverageConsultationFee;
-- If Doctors contains no rows, the result is NULL.
