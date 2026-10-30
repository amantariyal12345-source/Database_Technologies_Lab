-- Database Technologies Lab Sheet 5
-- Q7. Computer Science
-- Find all employees belonging to Computer Science using an equality-based INNER JOIN.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpID, e.EmpName, d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
WHERE d.DeptName = 'Computer Science';
