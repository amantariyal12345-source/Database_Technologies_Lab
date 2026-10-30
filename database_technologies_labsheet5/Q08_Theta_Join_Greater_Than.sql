-- Database Technologies Lab Sheet 5
-- Q8. Theta Join – Greater Than
-- Use a Theta Join to display employees whose salary is greater than a salary grade's minimum salary.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, e.Salary, sg.Grade, sg.MinSalary
FROM Employees AS e
INNER JOIN SalaryGrades AS sg
    ON e.Salary > sg.MinSalary;
