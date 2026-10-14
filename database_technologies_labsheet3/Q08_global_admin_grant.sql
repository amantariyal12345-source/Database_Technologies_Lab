-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q08. [DCL - Global Admin GRANT] Grant ALL privileges on all databases to pre-created account 'admin_user'@'%'.
--
-- Answer (MySQL):
GRANT ALL PRIVILEGES ON *.* TO 'admin_user'@'%' WITH GRANT OPTION;
