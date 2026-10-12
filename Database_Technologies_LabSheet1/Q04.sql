-- Database Technologies Lab Sheet 1 | Question 4
-- Question: Create audit_logs with log_id as primary key, action TEXT, and created_at TIMESTAMP.

CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY,
    action TEXT,
    created_at TIMESTAMP
);
