-- Q1-Q2. Create Department with DeptName NOT NULL, then test inserting a Student without Name.
CREATE DATABASE IF NOT EXISTS SchoolConstraintsDB;
USE SchoolConstraintsDB;

CREATE TABLE IF NOT EXISTS Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Setup Student for the NOT NULL test. Name is NOT NULL to demonstrate the constraint.
CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    Age INT,
    DeptID INT
);

-- Expected result: this INSERT fails because Name is NOT NULL. Uncomment to test:
-- INSERT INTO Student (StudentID, Email, Age, DeptID) VALUES (105, 'test@example.com', 20, 1);
