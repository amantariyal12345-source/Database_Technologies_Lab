-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q25. [TCL - Order Cancellation Sync Workflow] Cancel order 5002 and refund 450.00 to department 20 budget in a guarded transaction.
--
-- Answer (MySQL):
-- NOTE: The worksheet grants manager UPDATE only on company_db.orders.
-- Updating departments also requires UPDATE on company_db.departments.
START TRANSACTION;

SELECT order_id, total_amount, status
FROM orders
WHERE order_id = 5002
FOR UPDATE;

-- Guard: only cancel a pending order with the expected refund amount.
UPDATE orders
SET status = 'Cancelled'
WHERE order_id = 5002
  AND status = 'Pending'
  AND total_amount = 450.00;

-- Execute the following only if the order UPDATE affected exactly one row:
UPDATE departments
SET budget = budget + 450.00
WHERE dept_id = 20;

-- Verify affected-row counts in the client/application.
-- COMMIT only if both updates affected exactly one row; otherwise ROLLBACK.
COMMIT;
