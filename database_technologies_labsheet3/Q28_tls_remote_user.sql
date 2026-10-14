-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q28. [DCL - Encrypted Transport (TLS/SSL) Enforcement] Create remote user 'cloud_user'@'%' requiring SSL/TLS and grant SELECT, INSERT.
--
-- Answer (MySQL):
CREATE USER IF NOT EXISTS 'cloud_user'@'%'
IDENTIFIED BY 'ChangeThis_StrongPassword!'
REQUIRE SSL;

GRANT SELECT, INSERT ON company_db.* TO 'cloud_user'@'%';
