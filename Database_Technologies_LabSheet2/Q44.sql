-- Database Technologies Lab Sheet 2 | Question 44
-- Question: Find the third-highest salary.

SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 2;
