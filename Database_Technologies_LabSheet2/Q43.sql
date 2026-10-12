-- Database Technologies Lab Sheet 2 | Question 43
-- Question: Display employees in departments with budget greater than 300000.00.

SELECT * FROM employees WHERE dept_id IN (SELECT dept_id FROM departments WHERE budget > 300000.00);
