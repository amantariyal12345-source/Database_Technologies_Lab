-- Database Technologies Lab Sheet 5
-- Q6. Equi Join with Multiple Columns
-- Display employee name, employee city, department name, and department location using an equality-based join.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, e.City, d.DeptName, d.Location
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID;
