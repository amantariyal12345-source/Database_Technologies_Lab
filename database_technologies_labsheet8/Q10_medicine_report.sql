-- Q10. Create medicine_report() with stock value and readable stock status.
-- Stock status rules defined for this solution:
-- 75 or more = High, 40 to 74 = Medium, below 40 = Low.
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

DROP PROCEDURE IF EXISTS medicine_report;
DELIMITER //

CREATE PROCEDURE medicine_report()
BEGIN
    SELECT MedicineID, MedicineName, UnitPrice, Stock,
           medicine_stock_value(UnitPrice, Stock) AS StockValue,
           CASE
               WHEN Stock >= 75 THEN 'High'
               WHEN Stock >= 40 THEN 'Medium'
               ELSE 'Low'
           END AS StockStatus
    FROM Medicines;
END //

DELIMITER ;

CALL medicine_report();
