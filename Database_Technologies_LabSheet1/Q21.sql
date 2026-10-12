-- Database Technologies Lab Sheet 1 | Question 21
-- Question: Create order_items with composite primary key (order_id, item_id), quantity INT, and unit_price DECIMAL(8,2).

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    quantity INT,
    unit_price DECIMAL(8,2),
    PRIMARY KEY (order_id, item_id)
);
