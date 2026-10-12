-- Database Technologies Lab Sheet 1 | Question 14
-- Question: Change employees.email from VARCHAR(100) to VARCHAR(150).

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(150);
