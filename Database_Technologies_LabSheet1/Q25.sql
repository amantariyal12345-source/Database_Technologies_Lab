-- Database Technologies Lab Sheet 1 | Question 25
-- Question: Add a composite primary key on inventory(warehouse_id, sku).

ALTER TABLE inventory
ADD PRIMARY KEY (warehouse_id, sku);
