-- Database Technologies Lab Sheet 5
-- Q13. Natural Join with Filter
-- Using NATURAL JOIN, display employees belonging to the department located in Block B.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT EmpName, DeptName, Location
FROM Employees
NATURAL JOIN Departments
WHERE Location = 'Block B';
