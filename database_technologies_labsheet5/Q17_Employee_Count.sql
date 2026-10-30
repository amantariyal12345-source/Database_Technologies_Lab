-- Database Technologies Lab Sheet 5
-- Q17. Employee Count
-- Use INNER JOIN, GROUP BY, and COUNT to show the number of employees in each matched department.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT d.DeptName, COUNT(e.EmpID) AS EmployeeCount
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
GROUP BY d.DeptID, d.DeptName;
