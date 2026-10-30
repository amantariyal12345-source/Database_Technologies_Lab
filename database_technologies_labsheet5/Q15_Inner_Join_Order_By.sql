-- Database Technologies Lab Sheet 5
-- Q15. Inner Join + ORDER BY
-- Display matched employee name, department, and salary sorted from highest salary to lowest.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, d.DeptName, e.Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
ORDER BY e.Salary DESC;
