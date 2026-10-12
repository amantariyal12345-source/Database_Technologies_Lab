-- Database Technologies Lab Sheet 1 | Question 50
-- Question: Create application_logs with log_id BIGINT primary key, level ENUM('DEBUG','INFO','WARN','ERROR'), message TEXT, execution_time DOUBLE, created_at DATETIME; then change level to VARCHAR(10).

CREATE TABLE application_logs (
    log_id BIGINT PRIMARY KEY,
    level ENUM('DEBUG', 'INFO', 'WARN', 'ERROR'),
    message TEXT,
    execution_time DOUBLE,
    created_at DATETIME
);

ALTER TABLE application_logs
MODIFY COLUMN level VARCHAR(10);
