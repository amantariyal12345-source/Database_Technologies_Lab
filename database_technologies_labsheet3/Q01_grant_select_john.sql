-- Database Technologies Lab Sheet 3
-- Course Code: MCA105P
-- Q01. [Basic DCL - GRANT Read Access] Write a MySQL statement to grant SELECT permission on database company_db to pre-created user 'john'@'localhost'.
--
-- Answer (MySQL):
GRANT SELECT ON company_db.* TO 'john'@'localhost';
