-- Q3. Create consultation_with_tax(fee, tax_percent).
USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS consultation_with_tax;
DELIMITER //

CREATE FUNCTION consultation_with_tax(
    p_fee DECIMAL(10,2),
    p_tax_percent DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN ROUND(p_fee + (p_fee * p_tax_percent / 100), 2);
END //

DELIMITER ;

-- Display original fee and fee after applying 18% tax.
SELECT PatientID, PatientName, ConsultationFee AS OriginalFee,
       consultation_with_tax(ConsultationFee, 18) AS FeeWithTax
FROM Patients;
