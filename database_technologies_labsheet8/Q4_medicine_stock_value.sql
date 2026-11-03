-- Q4. Create medicine_stock_value(unit_price, stock).
USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS medicine_stock_value;
DELIMITER //

CREATE FUNCTION medicine_stock_value(
    p_unit_price DECIMAL(10,2),
    p_stock INT
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN p_unit_price * p_stock;
END //

DELIMITER ;

SELECT MedicineID, MedicineName, UnitPrice, Stock,
       medicine_stock_value(UnitPrice, Stock) AS StockValue
FROM Medicines;
