-- Database Technologies Lab Sheet 5
-- Q16. DISTINCT Departments
-- Display distinct department names that have at least one matching employee.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT DISTINCT d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID;
