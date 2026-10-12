-- Database Technologies Lab Sheet 1 | Question 32
-- Question: Convert projects.start_date to project_year with data type YEAR in one DDL statement.

ALTER TABLE projects
CHANGE COLUMN start_date project_year YEAR;
