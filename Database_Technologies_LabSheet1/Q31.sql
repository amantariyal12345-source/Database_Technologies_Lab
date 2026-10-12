-- Database Technologies Lab Sheet 1 | Question 31
-- Question: Drop order_items' existing primary key, add order_item_id INT as the first column, and set it as the new primary key in one ALTER command.

ALTER TABLE order_items
DROP PRIMARY KEY,
ADD COLUMN order_item_id INT FIRST,
ADD PRIMARY KEY (order_item_id);
