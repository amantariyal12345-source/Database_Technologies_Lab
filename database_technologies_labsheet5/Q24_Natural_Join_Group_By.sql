-- Database Technologies Lab Sheet 5
-- Q24. Natural Join + GROUP BY
-- Using NATURAL JOIN, count employees in each department.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT DeptName, COUNT(EmpID) AS EmployeeCount
FROM Employees
NATURAL JOIN Departments
GROUP BY DeptID, DeptName;
