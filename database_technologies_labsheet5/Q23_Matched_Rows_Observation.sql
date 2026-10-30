-- Database Technologies Lab Sheet 5
-- Q23. Matched Rows Observation
-- Use INNER JOIN to display all matched employees. Observe which employee is excluded because no department has DeptID 50.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpID, e.EmpName, e.DeptID, d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID;

-- Observation: Neha (EmpID 106, DeptID 50) is excluded because
-- Departments has no row with DeptID 50.
