-- Database Technologies Lab Sheet 1 | Question 27
-- Question: Add middle_name VARCHAR(30) to employees right after given_name.

ALTER TABLE employees
ADD COLUMN middle_name VARCHAR(30) AFTER given_name;
