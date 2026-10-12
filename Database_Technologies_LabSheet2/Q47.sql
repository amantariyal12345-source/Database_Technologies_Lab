-- Database Technologies Lab Sheet 2 | Question 47
-- Question: Show department name and employee count using a scalar subquery in SELECT.

SELECT d.dept_name, (SELECT COUNT(*) FROM employees e WHERE e.dept_id = d.dept_id) AS employee_count FROM departments d;
