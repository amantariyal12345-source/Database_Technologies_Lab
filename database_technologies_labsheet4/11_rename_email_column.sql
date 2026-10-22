-- Q11. Rename Email to ContactEmail in Pupils (MySQL 8.0+).
USE SchoolDB;
ALTER TABLE Pupils RENAME COLUMN Email TO ContactEmail;
