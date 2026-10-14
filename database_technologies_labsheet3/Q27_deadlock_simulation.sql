-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q27. [TCL - Deadlock Handling Simulation] Simulate an InnoDB deadlock between dev_user and hr_assistant: Session 1 locks emp 101; Session 2 locks emp 102; Session 1 requests 102; Session 2 requests 101.
--
-- Answer (MySQL):
-- Run each section in a DIFFERENT MySQL session at the same time.
-- SESSION 1: connect as dev_user
START TRANSACTION;
UPDATE employees SET salary = salary WHERE emp_id = 101;
-- Now run Session 2's first two statements.
UPDATE employees SET salary = salary WHERE emp_id = 102;
-- This waits for Session 2's lock and participates in a deadlock.
COMMIT;

-- SESSION 2: connect as hr_assistant before Session 1's second UPDATE
START TRANSACTION;
UPDATE employees SET salary = salary WHERE emp_id = 102;
-- Then request the row held by Session 1:
UPDATE employees SET salary = salary WHERE emp_id = 101;
-- InnoDB detects the deadlock and rolls back one transaction.
-- The session chosen as victim should restart its transaction if appropriate.
