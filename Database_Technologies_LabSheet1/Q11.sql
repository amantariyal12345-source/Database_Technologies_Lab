-- Database Technologies Lab Sheet 1 | Question 11
-- Question: Create user_profiles with user_id as primary key, bio TEXT, and profile_pic BLOB.

CREATE TABLE user_profiles (
    user_id INT PRIMARY KEY,
    bio TEXT,
    profile_pic BLOB
);
