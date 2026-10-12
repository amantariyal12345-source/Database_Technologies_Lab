-- Database Technologies Lab Sheet 1 | Question 22
-- Question: Create event_schedules with event_id INT, venue_id INT, event_date DATE, duration_hours TINYINT, and composite primary key (event_id, venue_id).

CREATE TABLE event_schedules (
    event_id INT,
    venue_id INT,
    event_date DATE,
    duration_hours TINYINT,
    PRIMARY KEY (event_id, venue_id)
);
