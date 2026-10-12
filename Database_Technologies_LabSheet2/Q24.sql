-- Database Technologies Lab Sheet 2 | Question 24
-- Question: Retrieve active employees earning more than 60000.00.

SELECT * FROM employees WHERE is_active = TRUE AND salary > 60000.00;
