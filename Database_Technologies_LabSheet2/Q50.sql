-- Database Technologies Lab Sheet 2 | Question 50
-- Question: Set order status Completed if amount > 1000, Shipped if amount is 500–1000, otherwise Pending.

UPDATE orders SET status = CASE WHEN total_amount > 1000 THEN 'Completed' WHEN total_amount BETWEEN 500 AND 1000 THEN 'Shipped' ELSE 'Pending' END;
