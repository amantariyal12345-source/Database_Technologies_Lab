-- Database Technologies Lab Sheet 2 | Question 21
-- Question: Insert George Clark (dept 30, salary 50000, date 2024-02-05, active) and Hannah Abbott (dept 10, salary 71000, date 2024-02-10, active) in one query.

INSERT INTO employees (emp_id, first_name, last_name, dept_id, salary, hire_date, is_active)
VALUES
(107, 'George', 'Clark', 30, 50000.00, '2024-02-05', TRUE),
(108, 'Hannah', 'Abbott', 10, 71000.00, '2024-02-10', TRUE);
