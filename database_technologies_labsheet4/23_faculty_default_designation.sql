-- Q12. Create Faculty with Designation defaulting to 'Lecturer'.
USE SchoolConstraintsDB;
CREATE TABLE IF NOT EXISTS Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    Designation VARCHAR(50) DEFAULT 'Lecturer'
);

INSERT INTO Faculty (FacultyID, FacultyName) VALUES (1, 'Ritu Sharma');
SELECT * FROM Faculty;
