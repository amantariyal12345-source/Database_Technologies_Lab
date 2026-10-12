-- Database Technologies Lab Sheet 1 | Question 12
-- Question: Create ticket_orders with ticket_id as primary key and priority_level restricted to ENUM('Low','Medium','High').

CREATE TABLE ticket_orders (
    ticket_id INT PRIMARY KEY,
    priority_level ENUM('Low', 'Medium', 'High')
);
