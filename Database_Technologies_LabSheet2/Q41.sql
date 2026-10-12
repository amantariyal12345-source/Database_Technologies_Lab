-- Database Technologies Lab Sheet 2 | Question 41
-- Question: Increase salary by 15% for employees in the department with the highest budget.

UPDATE employees SET salary = salary * 1.15 WHERE dept_id = (SELECT dept_id FROM departments WHERE budget = (SELECT MAX(budget) FROM departments));
