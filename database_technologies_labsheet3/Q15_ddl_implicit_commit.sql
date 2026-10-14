-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q15. [TCL - Implicit Commit via DDL Hazard] Demonstrate what happens when ALTER TABLE is executed inside an uncommitted transaction updating salary.
--
-- Answer (MySQL):
START TRANSACTION;

UPDATE employees
SET salary = 85000.00
WHERE emp_id = 101;

-- MySQL DDL such as ALTER TABLE causes an implicit commit.
-- This means the preceding UPDATE is committed; a later ROLLBACK
-- cannot undo that UPDATE.
ALTER TABLE employees ADD COLUMN demo_note VARCHAR(100) NULL;

ROLLBACK;

-- Check the salary: the UPDATE above remains committed in MySQL.
SELECT emp_id, salary FROM employees WHERE emp_id = 101;

-- Optional cleanup (also DDL, so it can implicitly commit):
ALTER TABLE employees DROP COLUMN demo_note;
