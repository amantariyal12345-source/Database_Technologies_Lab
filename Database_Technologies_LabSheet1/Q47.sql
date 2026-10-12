-- Database Technologies Lab Sheet 1 | Question 47
-- Question: Create file_metadata with file_id INT primary key, file_path VARCHAR(500), file_size_bytes BIGINT, and checksum CHAR(64).

CREATE TABLE file_metadata (
    file_id INT PRIMARY KEY,
    file_path VARCHAR(500),
    file_size_bytes BIGINT,
    checksum CHAR(64)
);
