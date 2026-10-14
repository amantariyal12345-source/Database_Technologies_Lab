-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q19. [TCL - Order Status Workflow Rollback] Update order 5002 status to 'Shipped' and roll back if total_amount < 500.
--
-- Answer (MySQL):
-- MySQL stored-program example: execute this as a user with CREATE ROUTINE
-- privilege. The manager account also needs UPDATE on company_db.orders.
DELIMITER //

CREATE PROCEDURE process_order_5002()
BEGIN
    DECLARE amount DECIMAL(10,2);

    START TRANSACTION;

    SELECT total_amount INTO amount
    FROM orders
    WHERE order_id = 5002
    FOR UPDATE;

    UPDATE orders
    SET status = 'Shipped'
    WHERE order_id = 5002;

    IF amount < 500.00 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END//

DELIMITER ;

CALL process_order_5002();

-- Given the worksheet data (450.00), this transaction rolls back,
-- leaving order 5002 as Pending.
DROP PROCEDURE process_order_5002;
