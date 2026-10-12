-- Database Technologies Lab Sheet 1 | Question 46
-- Question: In one statement, drop student_enrollments' composite primary key, add enrollment_id BIGINT as the first column, and make it the new primary key.

ALTER TABLE student_enrollments
DROP PRIMARY KEY,
ADD COLUMN enrollment_id BIGINT FIRST,
ADD PRIMARY KEY (enrollment_id);
