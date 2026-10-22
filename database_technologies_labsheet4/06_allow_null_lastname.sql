-- Q6. Modify LastName to allow NULL values.
USE SchoolDB;
ALTER TABLE Students MODIFY COLUMN LastName VARCHAR(50) NULL;
