-- Database Technologies Lab Sheet 2 | Question 34
-- Question: Delete orders for customers who have an order with Cancelled status.

DELETE FROM orders WHERE customer_name IN (SELECT customer_name FROM (SELECT DISTINCT customer_name FROM orders WHERE status = 'Cancelled') AS cancelled_customers);
