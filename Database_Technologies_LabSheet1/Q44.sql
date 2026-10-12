-- Database Technologies Lab Sheet 1 | Question 44
-- Question: In one ALTER command, rename raw_data.temp_val to converted_val, change it to DECIMAL(6,3), and add processed_at TIMESTAMP immediately after it.

ALTER TABLE raw_data
CHANGE COLUMN temp_val converted_val DECIMAL(6,3),
ADD COLUMN processed_at TIMESTAMP AFTER converted_val;
