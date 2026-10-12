-- Database Technologies Lab Sheet 2 | Question 40
-- Question: Set status Cancelled for orders with amount under 200.00.

UPDATE orders SET status = 'Cancelled' WHERE total_amount < 200.00;
