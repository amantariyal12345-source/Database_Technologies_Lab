-- Question 8: Create a cursor-based doctor report that processes rows ordered by Department and DoctorName and displays DoctorName, Department, and ConsultationFee.
DROP PROCEDURE IF EXISTS sp_cursor_doctor_report;
DELIMITER //
CREATE PROCEDURE sp_cursor_doctor_report()
BEGIN
    DECLARE v_done INT DEFAULT 0;
    DECLARE v_name VARCHAR(50);
    DECLARE v_department VARCHAR(40);
    DECLARE v_fee DECIMAL(10,2);
    DECLARE cur CURSOR FOR
        SELECT DoctorName, Department, ConsultationFee
        FROM Doctors
        ORDER BY Department, DoctorName;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO v_name, v_department, v_fee;
        IF v_done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT v_name AS DoctorName, v_department AS Department,
               v_fee AS ConsultationFee;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

CALL sp_cursor_doctor_report();
