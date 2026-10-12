-- Database Technologies Lab Sheet 2 | Question 30
-- Question: Show departments with total salary expense above 100000.00.

SELECT dept_id, SUM(salary) AS total_salary_expense FROM employees GROUP BY dept_id HAVING SUM(salary) > 100000.00;
