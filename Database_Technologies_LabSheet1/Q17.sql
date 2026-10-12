-- Database Technologies Lab Sheet 1 | Question 17
-- Question: Rename employees.first_name to given_name using DDL.

ALTER TABLE employees
RENAME COLUMN first_name TO given_name;
