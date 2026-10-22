-- Q3. Make Student.Email unique and demonstrate that duplicate emails are rejected.
USE SchoolConstraintsDB;
ALTER TABLE Student ADD CONSTRAINT uq_student_email UNIQUE (Email);

-- After inserting sample rows from 28_insert_lab_sheet_sample_data.sql, uncomment this
-- to test the duplicate email constraint:
-- INSERT INTO Student (StudentID, Name, Email, Age, DeptID) VALUES (105, 'Test User', 'rahul@example.com', 20, 1);
