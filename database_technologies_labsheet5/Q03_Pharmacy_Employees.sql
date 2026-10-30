-- Database Technologies Lab Sheet 5
-- Q3. Pharmacy Employees
-- Use INNER JOIN and WHERE to display employees belonging to the Pharmacy department.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpID, e.EmpName, d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Pharmacy';
