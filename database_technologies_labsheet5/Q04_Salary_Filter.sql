-- Database Technologies Lab Sheet 5
-- Q4. Salary Filter
-- Display matched employees whose salary is greater than 60000.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
WHERE e.Salary > 60000;
