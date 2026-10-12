-- Database Technologies Lab Sheet 2 | Question 27
-- Question: Find employees whose first name contains 'a', case-insensitively.

SELECT * FROM employees WHERE LOWER(first_name) LIKE '%a%';
