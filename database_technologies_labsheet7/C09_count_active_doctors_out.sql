-- Question 9: Create a cursor procedure with an OUT parameter to count all doctors whose Status is 'Active'. Execute it and display the count.
DROP PROCEDURE IF EXISTS sp_cursor_count_active;
DELIMITER //
CREATE PROCEDURE sp_cursor_count_active(OUT p_count INT)
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_status VARCHAR(20);
    DECLARE cur CURSOR FOR SELECT Status FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    SET p_count = 0;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_status;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        IF v_status = 'Active' THEN
            SET p_count = p_count + 1;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_count_active(@active_count);
SELECT @active_count AS ActiveDoctorCount;
