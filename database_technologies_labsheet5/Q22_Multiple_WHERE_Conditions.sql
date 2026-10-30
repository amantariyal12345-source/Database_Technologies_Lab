-- Database Technologies Lab Sheet 5
-- Q22. Multiple WHERE Conditions
-- Display employees from Delhi or Pune whose salary is at least 50000, with department names.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, e.City, e.Salary, d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
WHERE e.City IN ('Delhi', 'Pune')
  AND e.Salary >= 50000;
