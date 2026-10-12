-- Database Technologies Lab Sheet 1 | Question 8
-- Question: Remove the is_available column from products.

ALTER TABLE products
DROP COLUMN is_available;
