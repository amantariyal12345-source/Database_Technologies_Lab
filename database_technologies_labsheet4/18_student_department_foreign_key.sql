-- Q7. Add foreign key Student(DeptID) -> Department(DeptID).
USE SchoolConstraintsDB;
ALTER TABLE Student
ADD CONSTRAINT fk_student_department
FOREIGN KEY (DeptID) REFERENCES Department(DeptID);
