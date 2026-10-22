-- Insert the sample data listed in the PDF.
-- Run after the matching Department, Student, Course, and Enrollment tables exist.
USE SchoolConstraintsDB;

INSERT INTO Department (DeptID, DeptName, Location) VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Mathematics', 'Block B'),
(3, 'Physics', 'Block C');

INSERT INTO Student (StudentID, Name, Email, Age, DeptID) VALUES
(101, 'Rahul', 'rahul@example.com', 20, 1),
(102, 'Priya', 'priya@example.com', 21, 2),
(103, 'Amit', NULL, 19, 1),
(104, 'Sneha', 'sneha@example.com', 22, 3);

INSERT INTO Course (CourseID, CourseName, Credits, DeptID) VALUES
(201, 'Database Systems', 4, 1),
(202, 'Linear Algebra', 3, 2),
(203, 'Quantum Mechanics', 4, 3);

INSERT INTO Enrollment (EnrollID, StudentID, CourseID, Grade) VALUES
(301, 101, 201, 'A'),
(302, 102, 202, 'B'),
(303, 103, 201, 'C'),
(304, 104, 203, 'A');
