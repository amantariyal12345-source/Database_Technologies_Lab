-- Q10. Add CHECK constraint requiring Credits between 1 and 6.
USE SchoolConstraintsDB;
CREATE TABLE IF NOT EXISTS Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    DeptID INT
);
ALTER TABLE Course
ADD CONSTRAINT chk_course_credits CHECK (Credits BETWEEN 1 AND 6);
