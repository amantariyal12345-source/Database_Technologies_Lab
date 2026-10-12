-- Database Technologies Lab Sheet 1 | Question 16
-- Question: Add a composite primary key to existing student_courses using student_id INT and course_id INT.

ALTER TABLE student_courses
ADD PRIMARY KEY (student_id, course_id);
