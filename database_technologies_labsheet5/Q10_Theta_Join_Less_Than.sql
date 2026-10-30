-- Database Technologies Lab Sheet 5
-- Q10. Theta Join – Less Than
-- Display employee names and salary grades where employee salary is less than the grade maximum salary.
-- Run the setup from the lab sheet first, then execute this file.

USE CollegeJoinDB;

SELECT e.EmpName, e.Salary, sg.Grade, sg.MaxSalary
FROM Employees AS e
INNER JOIN SalaryGrades AS sg
    ON e.Salary < sg.MaxSalary;
