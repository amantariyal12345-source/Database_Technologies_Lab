-- Question 4: Create a cursor procedure with an OUT parameter to count doctors belonging to the Cardiology department. Execute it and display the result.
DROP PROCEDURE IF EXISTS sp_cursor_count_cardiology;
DELIMITER //
CREATE PROCEDURE sp_cursor_count_cardiology(OUT p_count INT)
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_department VARCHAR(40);
    DECLARE cur CURSOR FOR SELECT Department FROM Doctors;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    SET p_count = 0;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_department;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        IF v_department = 'Cardiology' THEN
            SET p_count = p_count + 1;
        END IF;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_count_cardiology(@cardiology_count);
SELECT @cardiology_count AS CardiologyDoctorCount;
