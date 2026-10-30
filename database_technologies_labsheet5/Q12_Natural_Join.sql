-- Database Technologies Lab Sheet 5
-- Q12. Natural Join
-- Use NATURAL JOIN to display employee names, DeptID, and department names. Do not write an ON condition.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT EmpName, DeptID, DeptName
FROM Employees
NATURAL JOIN Departments;
