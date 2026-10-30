-- Database Technologies Lab Sheet 5
-- Q21. IN Condition
-- Display employees working in either Computer Science or Pharmacy.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpID, e.EmpName, d.DeptName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
WHERE d.DeptName IN ('Computer Science', 'Pharmacy');
