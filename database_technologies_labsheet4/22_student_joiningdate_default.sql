-- Q11. Add JoiningDate with current date as default and insert without it.
USE SchoolConstraintsDB;
ALTER TABLE Student
ADD COLUMN JoiningDate DATE DEFAULT (CURRENT_DATE);

INSERT INTO Student (StudentID, Name, Email, Age, DeptID)
VALUES (107, 'Karan Mehta', 'karan@example.com', 20, 1);

SELECT StudentID, Name, JoiningDate FROM Student WHERE StudentID = 107;
