-- Database Technologies Lab Sheet 5
-- Q14. Natural Join with Salary
-- Using NATURAL JOIN, display employee name, department name, and salary for salaries >= 70000.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT EmpName, DeptName, Salary
FROM Employees
NATURAL JOIN Departments
WHERE Salary >= 70000;
