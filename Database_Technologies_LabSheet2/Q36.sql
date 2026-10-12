-- Database Technologies Lab Sheet 2 | Question 36
-- Question: Display employee full names with a space between first and last name.

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
