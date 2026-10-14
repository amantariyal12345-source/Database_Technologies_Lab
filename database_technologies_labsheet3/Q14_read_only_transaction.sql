-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q14. [TCL - Read-Only Transaction Mode] Configure transaction mode to READ ONLY before running reporting SELECT queries as 'analyst'@'localhost'.
--
-- Answer (MySQL):
SET TRANSACTION READ ONLY;
START TRANSACTION;

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM orders;

COMMIT;
