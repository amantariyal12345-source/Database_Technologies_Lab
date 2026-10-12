-- Database Technologies Lab Sheet 1 | Question 48
-- Question: In one ALTER statement, change file_metadata.file_id from INT to BIGINT, change file_path to TEXT, and drop checksum.

ALTER TABLE file_metadata
MODIFY COLUMN file_id BIGINT,
MODIFY COLUMN file_path TEXT,
DROP COLUMN checksum;
