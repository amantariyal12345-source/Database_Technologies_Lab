-- Q5. Ensure StudentID is the primary key and test duplicate StudentID.
USE SchoolConstraintsDB;
-- StudentID is already declared PRIMARY KEY in the Student setup file.
-- Expected result: duplicate StudentID is rejected. Uncomment to test:
-- INSERT INTO Student (StudentID, Name, Email, Age, DeptID) VALUES (101, 'Duplicate ID', 'different@example.com', 20, 1);
