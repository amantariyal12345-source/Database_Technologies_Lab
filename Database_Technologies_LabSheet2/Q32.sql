-- Database Technologies Lab Sheet 2 | Question 32
-- Question: Retrieve employees earning above the average employee salary.

SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
