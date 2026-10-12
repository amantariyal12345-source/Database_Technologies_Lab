-- Database Technologies Lab Sheet 1 | Question 28
-- Question: Create geolocations with location_id INT primary key, latitude DECIMAL(9,6), and longitude DECIMAL(9,6).

CREATE TABLE geolocations (
    location_id INT PRIMARY KEY,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);
