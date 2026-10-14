-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q21. [TCL - Conditional Multi-Table Transaction] Raise salaries in department 10 by 15%, set savepoint sp_salary_done, increase department 10 budget by 50000.00, and roll back to the savepoint if budget exceeds 520000.00.
--
-- Answer (MySQL):
-- Intended for a MySQL session with UPDATE privileges on employees and departments.
START TRANSACTION;

UPDATE employees
SET salary = salary * 1.15
WHERE dept_id = 10;

SAVEPOINT sp_salary_done;

UPDATE departments
SET budget = budget + 50000.00
WHERE dept_id = 10;

-- Budget starts at 500000.00, so it becomes 550000.00 and exceeds 520000.00.
-- Roll back the budget update while retaining the salary updates.
ROLLBACK TO SAVEPOINT sp_salary_done;

COMMIT;
