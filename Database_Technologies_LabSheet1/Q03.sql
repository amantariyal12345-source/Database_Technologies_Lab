-- Database Technologies Lab Sheet 1 | Question 3
-- Question: Create projects with project_id as primary key, project_name VARCHAR(100), and start_date DATE.

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE
);
