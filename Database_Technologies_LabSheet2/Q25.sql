-- Database Technologies Lab Sheet 2 | Question 25
-- Question: Find orders that are Cancelled or have amount above 2000.00.

SELECT * FROM orders WHERE status = 'Cancelled' OR total_amount > 2000.00;
