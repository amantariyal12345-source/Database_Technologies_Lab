-- Database Technologies Lab Sheet 2 | Question 48
-- Question: List customer names with more than one order OR total spending above 1000.00.

SELECT customer_name FROM orders GROUP BY customer_name HAVING COUNT(*) > 1 OR SUM(total_amount) > 1000.00;
