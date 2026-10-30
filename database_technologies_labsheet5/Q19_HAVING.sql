-- Database Technologies Lab Sheet 5
-- Q19. HAVING
-- Show departments whose average employee salary is greater than 60000.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT d.DeptName, AVG(e.Salary) AS AverageSalary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DeptID = d.DeptID
GROUP BY d.DeptID, d.DeptName
HAVING AVG(e.Salary) > 60000;
