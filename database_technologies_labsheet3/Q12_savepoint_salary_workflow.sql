-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q12. [TCL - Multi-Step Savepoint Workflow] Update salary for emp_id 101 to 80000.00, create savepoint sp_first, update salary for emp_id 102 to 95000.00, roll back to sp_first, and commit.
--
-- Answer (MySQL):
START TRANSACTION;

UPDATE employees
SET salary = 80000.00
WHERE emp_id = 101;

SAVEPOINT sp_first;

UPDATE employees
SET salary = 95000.00
WHERE emp_id = 102;

ROLLBACK TO SAVEPOINT sp_first;
COMMIT;

-- Result: emp_id 101's update is committed; emp_id 102's update is undone.
