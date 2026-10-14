-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q29. [TCL - Granular Row-Level Batch Insert Recovery] Insert order 5008, set savepoint sp_5008, insert order 5009, set savepoint sp_5009, and roll back to sp_5008 if order 5009 fails business rules.
--
-- Answer (MySQL):
START TRANSACTION;

INSERT INTO orders (order_id, customer_name, order_date, total_amount, status)
VALUES (5008, 'Delta Works', '2024-02-01', 700.00, 'Pending');

SAVEPOINT sp_5008;

INSERT INTO orders (order_id, customer_name, order_date, total_amount, status)
VALUES (5009, 'Epsilon Group', '2024-02-02', 0.00, 'Pending');

SAVEPOINT sp_5009;

-- Example business rule: total_amount must be greater than zero.
-- If order 5009 violates the rule, run:
-- ROLLBACK TO SAVEPOINT sp_5008;
-- Otherwise, keep the inserts and run:
COMMIT;

-- Note: SQL alone does not automatically branch on a business rule here;
-- check the condition in application code or a stored program before COMMIT.
