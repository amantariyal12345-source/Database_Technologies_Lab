-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q23. [TCL - Shared Read Locking (FOR SHARE)] Lock department 10 row in shared mode using SELECT ... FOR SHARE before generating an analytical report.
--
-- Answer (MySQL):
START TRANSACTION;

SELECT dept_id, dept_name, location, budget
FROM departments
WHERE dept_id = 10
FOR SHARE;

-- Example analytical report:
SELECT dept_id, COUNT(*) AS employee_count, AVG(salary) AS average_salary
FROM employees
WHERE dept_id = 10
GROUP BY dept_id;

COMMIT;
