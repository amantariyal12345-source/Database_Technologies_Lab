-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q13. [DCL - Selective Privilege Revocation] Revoke UPDATE permission on company_db.employees from 'hr_assistant'@'localhost' while keeping SELECT intact.
--
-- Answer (MySQL):
REVOKE UPDATE ON company_db.employees FROM 'hr_assistant'@'localhost';
