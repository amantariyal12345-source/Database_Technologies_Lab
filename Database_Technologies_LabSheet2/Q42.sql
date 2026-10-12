-- Database Technologies Lab Sheet 2 | Question 42
-- Question: Find departments whose average employee salary is above the global employee average.

SELECT dept_id, AVG(salary) AS department_average_salary FROM employees GROUP BY dept_id HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);
