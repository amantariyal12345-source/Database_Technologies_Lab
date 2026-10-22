-- Q15. Create composite index on Enrollment(StudentID, CourseID).
USE SchoolConstraintsDB;
CREATE INDEX idx_enrollment_student_course ON Enrollment (StudentID, CourseID);
