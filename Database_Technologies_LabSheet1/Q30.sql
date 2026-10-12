-- Database Technologies Lab Sheet 1 | Question 30
-- Question: Create device_logs with log_id BIGINT primary key, ip_address VARCHAR(45), and payload LONGBLOB.

CREATE TABLE device_logs (
    log_id BIGINT PRIMARY KEY,
    ip_address VARCHAR(45),
    payload LONGBLOB
);
