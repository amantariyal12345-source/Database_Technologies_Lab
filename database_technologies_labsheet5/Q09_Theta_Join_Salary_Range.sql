-- Database Technologies Lab Sheet 5
-- Q9. Theta Join – Salary Range
-- Assign each employee to the correct salary grade using >= and <= in the join condition.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, e.Salary, sg.Grade
FROM Employees AS e
INNER JOIN SalaryGrades AS sg
    ON e.Salary >= sg.MinSalary
   AND e.Salary <= sg.MaxSalary;
