-- Database Technologies Lab Sheet 2 | Question 23
-- Question: Deactivate employees hired before 2021-01-01.

UPDATE employees SET is_active = FALSE WHERE hire_date < '2021-01-01';
