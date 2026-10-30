-- Database Technologies Lab Sheet 5
-- Q18. Average Salary
-- Use INNER JOIN and GROUP BY to calculate average salary for each matched department.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT d.DeptName, AVG(e.Salary) AS AverageSalary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
GROUP BY d.DeptID, d.DeptName;
