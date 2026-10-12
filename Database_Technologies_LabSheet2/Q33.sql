-- Database Technologies Lab Sheet 2 | Question 33
-- Question: Find employees in departments located in Building A.

SELECT * FROM employees WHERE dept_id IN (SELECT dept_id FROM departments WHERE location = 'Building A');
