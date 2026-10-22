-- Q8. Insert sample data into Students.
USE SchoolDB;
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Email) VALUES
(1, 'Asha', 'Sharma', '2003-04-12 00:00:00', 'F', 'asha@example.com'),
(2, 'Ravi', 'Kumar', '2002-11-03 00:00:00', 'M', 'ravi@example.com'),
(3, 'Neha', 'Singh', '2004-01-25 00:00:00', 'F', 'neha@example.com');
SELECT * FROM Students;
