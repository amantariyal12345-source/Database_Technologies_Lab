-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q20. [DCL - Role-Based Access Control (RBAC)] Create role reporter_role, grant SELECT on company_db.* to it, and assign it to 'analyst'@'localhost'.
--
-- Answer (MySQL):
CREATE ROLE IF NOT EXISTS 'reporter_role';
GRANT SELECT ON company_db.* TO 'reporter_role';
GRANT 'reporter_role' TO 'analyst'@'localhost';
SET DEFAULT ROLE 'reporter_role' TO 'analyst'@'localhost';
