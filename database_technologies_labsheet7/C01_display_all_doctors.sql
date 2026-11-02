-- Question 1: Create a stored procedure using a cursor to display DoctorID and DoctorName for every doctor. Execute it and verify all six doctors are processed.
DROP PROCEDURE IF EXISTS sp_cursor_all_doctors;
DELIMITER //
CREATE PROCEDURE sp_cursor_all_doctors()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT DoctorID, DoctorName FROM Doctors ORDER BY DoctorID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id, v_name;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT v_id AS DoctorID, v_name AS DoctorName;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_all_doctors();
