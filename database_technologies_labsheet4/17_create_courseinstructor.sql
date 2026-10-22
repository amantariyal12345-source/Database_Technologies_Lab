-- Q6. Create CourseInstructor with InstructorID as primary key; insert 3 records.
USE SchoolConstraintsDB;
CREATE TABLE IF NOT EXISTS CourseInstructor (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100) NOT NULL,
    DepartmentName VARCHAR(100)
);

INSERT INTO CourseInstructor (InstructorID, InstructorName, DepartmentName) VALUES
(1, 'Anita Verma', 'Computer Science'),
(2, 'Sanjay Rao', 'Mathematics'),
(3, 'Meera Joshi', 'Physics');
