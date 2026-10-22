-- Q8. Add foreign key Enrollment(StudentID) -> Student(StudentID).
USE SchoolConstraintsDB;
CREATE TABLE IF NOT EXISTS Enrollment (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2)
);
ALTER TABLE Enrollment
ADD CONSTRAINT fk_enrollment_student
FOREIGN KEY (StudentID) REFERENCES Student(StudentID);
