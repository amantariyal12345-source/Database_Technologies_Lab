-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q02. [DCL - Multi-Privilege GRANT] Write a statement to grant SELECT and INSERT permissions on company_db.employees to pre-created user 'alice'@'localhost'.
--
-- Answer (MySQL):
GRANT SELECT, INSERT ON company_db.employees TO 'alice'@'localhost';
