-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q03. [DCL - REVOKE Privilege] Revoke INSERT privilege on company_db.employees from user 'alice'@'localhost'.
--
-- Answer (MySQL):
REVOKE INSERT ON company_db.employees FROM 'alice'@'localhost';
