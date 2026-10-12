-- Database Technologies Lab Sheet 2 | Question 09
-- Question: Change order 5002 status from Pending to Shipped.

UPDATE orders SET status = 'Shipped' WHERE order_id = 5002;
