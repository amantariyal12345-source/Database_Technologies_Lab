-- Database Technologies Lab Sheet 5
-- Q1. Basic Inner Join
-- Display employee names, department names, and department locations for employees with matching departments.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, d.DeptName, d.Location
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID;
