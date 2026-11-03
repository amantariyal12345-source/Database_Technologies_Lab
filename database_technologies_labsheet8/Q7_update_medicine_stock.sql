-- Q7. Create update_medicine_stock(IN p_id, IN p_quantity).
-- This procedure adds the supplied quantity to the current stock.
USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS update_medicine_stock;
DELIMITER //

CREATE PROCEDURE update_medicine_stock(
    IN p_id INT,
    IN p_quantity INT
)
BEGIN
    UPDATE Medicines
    SET Stock = Stock + p_quantity
    WHERE MedicineID = p_id;

    SELECT MedicineID, MedicineName, Stock
    FROM Medicines
    WHERE MedicineID = p_id;
END //

DELIMITER ;

-- Increase Paracetamol stock by 10 and verify the changed row.
CALL update_medicine_stock(301, 10);
