-- Database Technologies Lab Sheet 2 | Question 46
-- Question: Delete inactive employees earning less than their department's average salary.

DELETE FROM employees WHERE is_active = FALSE AND salary < (SELECT department_avg FROM (SELECT dept_id, AVG(salary) AS department_avg FROM employees GROUP BY dept_id) AS dept_averages WHERE dept_averages.dept_id = employees.dept_id);
