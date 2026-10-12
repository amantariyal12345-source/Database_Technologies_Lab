-- Database Technologies Lab Sheet 2 | Question 49
-- Question: Copy department 10 employees into department 50, increasing each employee ID by 500.

INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
SELECT emp_id + 500, first_name, last_name, 50, salary, hire_date, is_active FROM employees WHERE dept_id = 10;
