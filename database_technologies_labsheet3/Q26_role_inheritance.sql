-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q26. [DCL - Role Inheritance Hierarchy] Create roles read_role, write_role, admin_role, configure role inheritance, create 'super_dev'@'localhost', and assign admin_role.
--
-- Answer (MySQL):
CREATE ROLE IF NOT EXISTS 'read_role', 'write_role', 'admin_role';

GRANT SELECT ON company_db.* TO 'read_role';
GRANT INSERT, UPDATE, DELETE ON company_db.* TO 'write_role';

-- admin_role inherits both read_role and write_role.
GRANT 'read_role', 'write_role' TO 'admin_role';

CREATE USER IF NOT EXISTS 'super_dev'@'localhost'
IDENTIFIED BY 'ChangeThis_StrongPassword!';

GRANT 'admin_role' TO 'super_dev'@'localhost';
SET DEFAULT ROLE 'admin_role' TO 'super_dev'@'localhost';
