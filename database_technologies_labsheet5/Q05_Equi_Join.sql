-- Database Technologies Lab Sheet 5
-- Q5. Equi Join
-- Perform an Equi Join between Employees and Departments using DeptID = DeptID.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID;
