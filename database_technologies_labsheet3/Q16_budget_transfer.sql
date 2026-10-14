-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q16. [TCL - Financial Budget Transfer] Transfer 10000.00 budget from Department 10 to Department 20 atomically.
--
-- Answer (MySQL):
START TRANSACTION;

UPDATE departments
SET budget = budget - 10000.00
WHERE dept_id = 10 AND budget >= 10000.00;

UPDATE departments
SET budget = budget + 10000.00
WHERE dept_id = 20;

-- In a real application, verify both UPDATE statements affected one row.
-- If either update did not affect exactly one row, issue ROLLBACK instead.
COMMIT;
