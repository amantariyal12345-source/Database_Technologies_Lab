-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q22. [TCL - Exclusive Pessimistic Locking (FOR UPDATE)] Lock employee row emp_id 101 using SELECT ... FOR UPDATE before updating salary to 88000.00.
--
-- Answer (MySQL):
START TRANSACTION;

SELECT emp_id, salary
FROM employees
WHERE emp_id = 101
FOR UPDATE;

UPDATE employees
SET salary = 88000.00
WHERE emp_id = 101;

COMMIT;
