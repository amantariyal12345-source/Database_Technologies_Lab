-- Q8. Create medicine_count(OUT p_count).
USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS medicine_count;
DELIMITER //

CREATE PROCEDURE medicine_count(OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count
    FROM Medicines;
END //

DELIMITER ;

-- Call using a session variable and display the result.
CALL medicine_count(@total_medicines);
SELECT @total_medicines AS TotalMedicines;
