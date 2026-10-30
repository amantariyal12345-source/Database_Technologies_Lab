-- Database Technologies Lab Sheet 6
-- Q20. Display Student Name, Marks and Grade
-- Question: Using the StudentGrade() function, write a SELECT query to display StudentName, Marks and Grade for every student in the Student table.
-- MySQL solution and test:

USE CollegeDB;

-- Run after creating the StudentGrade function in Q14.
SELECT StudentName, Marks, StudentGrade(Marks) AS Grade
FROM Student;
