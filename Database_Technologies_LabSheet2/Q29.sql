-- Database Technologies Lab Sheet 2 | Question 29
-- Question: Count employees in each department.

SELECT dept_id, COUNT(*) AS employee_count FROM employees GROUP BY dept_id;
