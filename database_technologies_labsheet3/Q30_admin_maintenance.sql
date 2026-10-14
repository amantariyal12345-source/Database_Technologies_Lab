-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q30. [DCL & TCL - Complete Administrative Maintenance Script] Create 'test_maint'@'localhost', grant SELECT, INSERT, UPDATE, update emp_104 active status and roll back, audit grants, revoke permissions, and lock the account.
--
-- Answer (MySQL):
CREATE USER IF NOT EXISTS 'test_maint'@'localhost'
IDENTIFIED BY 'ChangeThis_StrongPassword!';

GRANT SELECT, INSERT, UPDATE ON company_db.* TO 'test_maint'@'localhost';

START TRANSACTION;

UPDATE employees
SET is_active = TRUE
WHERE emp_id = 104;

ROLLBACK;

SHOW GRANTS FOR 'test_maint'@'localhost';

REVOKE SELECT, INSERT, UPDATE ON company_db.* FROM 'test_maint'@'localhost';

ALTER USER 'test_maint'@'localhost' ACCOUNT LOCK;
