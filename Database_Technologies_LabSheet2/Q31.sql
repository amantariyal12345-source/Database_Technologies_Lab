-- Database Technologies Lab Sheet 2 | Question 31
-- Question: Find maximum and minimum order amounts for each status.

SELECT status, MAX(total_amount) AS maximum_order_amount, MIN(total_amount) AS minimum_order_amount FROM orders GROUP BY status;
