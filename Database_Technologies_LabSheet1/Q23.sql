-- Database Technologies Lab Sheet 1 | Question 23
-- Question: Add hire_date DATE and is_active BOOLEAN to employees in one DDL statement.

ALTER TABLE employees
ADD COLUMN hire_date DATE,
ADD COLUMN is_active BOOLEAN;
