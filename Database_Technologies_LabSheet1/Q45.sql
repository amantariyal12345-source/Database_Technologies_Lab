-- Database Technologies Lab Sheet 1 | Question 45
-- Question: Create student_enrollments with student_id INT, course_id INT, semester VARCHAR(10), enrollment_date DATE, and a 3-column composite primary key.

CREATE TABLE student_enrollments (
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id, semester)
);
