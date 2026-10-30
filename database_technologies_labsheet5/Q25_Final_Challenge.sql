-- Database Technologies Lab Sheet 5
-- Q25. Final Challenge
-- Use an equality-based INNER JOIN to find departments whose total employee salary is greater than 100000. Display department name and total salary.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT d.DeptName, SUM(e.Salary) AS TotalSalary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
GROUP BY d.DeptID, d.DeptName
HAVING SUM(e.Salary) > 100000;
