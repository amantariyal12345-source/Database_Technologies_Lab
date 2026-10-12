-- Database Technologies Lab Sheet 2 | Question 22
-- Question: Give a 10% raise to employees in department 10.

UPDATE employees SET salary = salary * 1.10 WHERE dept_id = 10;
