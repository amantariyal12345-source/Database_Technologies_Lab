-- Database Technologies Lab Sheet 1 | Question 49
-- Question: Create sensor_readings with composite primary key (sensor_id INT, recorded_at TIMESTAMP) and reading FLOAT, then rename it historical_sensor_readings.

CREATE TABLE sensor_readings (
    sensor_id INT,
    recorded_at TIMESTAMP,
    reading FLOAT,
    PRIMARY KEY (sensor_id, recorded_at)
);

RENAME TABLE sensor_readings TO historical_sensor_readings;
