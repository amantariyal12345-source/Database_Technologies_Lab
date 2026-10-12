-- Database Technologies Lab Sheet 2 | Question 28
-- Question: Calculate total salary expenditure per department.

SELECT dept_id, SUM(salary) AS total_salary_expenditure FROM employees GROUP BY dept_id;
