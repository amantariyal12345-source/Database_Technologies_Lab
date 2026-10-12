-- Database Technologies Lab Sheet 2 | Question 26
-- Question: List employees not in departments 10 or 30.

SELECT * FROM employees WHERE dept_id NOT IN (10, 30);
