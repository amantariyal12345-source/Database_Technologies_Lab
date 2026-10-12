-- Database Technologies Lab Sheet 1 | Question 24
-- Question: Drop email and change salary to DECIMAL(12,2) in employees in one ALTER statement.

ALTER TABLE employees
DROP COLUMN email,
MODIFY COLUMN salary DECIMAL(12,2);
