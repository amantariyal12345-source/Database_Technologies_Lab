-- Database Technologies Lab Sheet 5
-- Q20. Highest Paid Employee
-- Find the highest-paid employee among matched employees and display name, department, and salary.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
ORDER BY e.Salary DESC
LIMIT 1;
