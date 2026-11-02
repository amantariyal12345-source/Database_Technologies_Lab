-- Question 7: Create a cursor procedure that changes Status to 'Review' for doctors whose ConsultationFee is below 1000. Verify the affected rows.
DROP PROCEDURE IF EXISTS sp_cursor_mark_review;
DELIMITER //
CREATE PROCEDURE sp_cursor_mark_review()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE cur CURSOR FOR
        SELECT DoctorID FROM Doctors WHERE ConsultationFee < 1000;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_id;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        UPDATE Doctors SET Status = 'Review' WHERE DoctorID = v_id;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_mark_review();
SELECT * FROM Doctors WHERE Status = 'Review' ORDER BY DoctorID;
