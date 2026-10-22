-- Q9. Add CHECK constraint requiring Age > 18 and test invalid insert.
USE SchoolConstraintsDB;
ALTER TABLE Student
ADD CONSTRAINT chk_student_age CHECK (Age > 18);

-- Expected result: this insert fails because Age is not greater than 18.
-- Uncomment to test:
-- INSERT INTO Student (StudentID, Name, Email, Age, DeptID) VALUES (106, 'Underage Test', 'underage@example.com', 18, 1);
