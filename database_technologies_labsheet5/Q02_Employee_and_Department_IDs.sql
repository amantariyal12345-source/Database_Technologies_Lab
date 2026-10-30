-- Database Technologies Lab Sheet 5
-- Q2. Employee and Department IDs
-- Use INNER JOIN to display EmpID, EmpName, DeptID, and DeptName.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID;
