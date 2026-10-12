-- Database Technologies Lab Sheet 1 | Question 42
-- Question: Create system_events with event_id BIGINT, node_id SMALLINT, event_payload TEXT, logged_time TIMESTAMP, and composite primary key (event_id, node_id).

CREATE TABLE system_events (
    event_id BIGINT,
    node_id SMALLINT,
    event_payload TEXT,
    logged_time TIMESTAMP,
    PRIMARY KEY (event_id, node_id)
);
