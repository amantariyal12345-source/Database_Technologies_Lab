-- Database Technologies Lab Sheet 5
-- Q11. Theta Join – Greater Than or Equal
-- Display employee name, salary, and grade where employee salary is >= the grade minimum.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, e.Salary, sg.Grade, sg.MinSalary
FROM Employees AS e
INNER JOIN SalaryGrades AS sg
    ON e.Salary >= sg.MinSalary;
