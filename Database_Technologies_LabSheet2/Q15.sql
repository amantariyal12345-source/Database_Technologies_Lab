-- Database Technologies Lab Sheet 2 | Question 15
-- Question: Display departments in Building A or Building B.

SELECT * FROM departments WHERE location IN ('Building A', 'Building B');
